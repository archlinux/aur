# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

_pkgbase=penpot
pkgname=(penpot penpot-exporter penpot-frontend penpot-mcp)
pkgver=2.16.0
pkgrel=1
pkgdesc="The open-source design tool for design and code collaboration "
arch=('x86_64')
url="https://penpot.app"
license=('MPL-2.0')
# penpot is using 19, but archlinux only has 17 and 21. 17 and > 21 doesnt work
# also jdk is needed and not only jre
_jdkver="26"
makedepends=('clojure' 'git' 'curl' 'npm' 'pnpm' 'rsync' 'babashka' 'rustup' 'emscripten' 'emsdk' 'jq' "java-environment>=${_jdkver}" "java-environment<=${_jdkver}")
source=(
  https://github.com/penpot/penpot/archive/refs/tags/$pkgver.tar.gz
  sysusers.conf
  penpot.conf.d
  penpot-exporter.conf.d
  penpot.service
  penpot-exporter.service
  penpot-mcp.service
  penpot.tmpfiles.d
  penpot-update-flags.sh
  nginx.conf
)
noextract=($pkgname-$pkgver.tgz)
sha256sums=(
  '474280d0ad248df718fd7799a0642eeb89126d9c4703dfc12610d527ea479629'
  '4b82b8a79d8a143fd8a6e4473447f8946c095e2617ba5fcba4cb5b1fdd840c2c'
  'bc133ba7409921978655c488293ef83f77250fd65cb7d574c3cba9f34ff42523'
  '828087c8fab14fb481b4bd01d92f47e9ecc9c07551a7a873bcfbafd1e3644afb'
  'a95f1029cec7cf408cf19cb97cf235c48f671aa93424c138759ee77e239d1c6a'
  'd386ff5cd3e614526ab400c218402f46025ad7db26a963d2f08220e79723c170'
  '2543f8a61141295eae21ba7872c80a31845fcad037b3b44cef273a40cdfb02a8'
  'f3208349de006fc26119cd9b034958bbfa3c161bfb76a752d43d5b563df6e33d'
  'b759994786bcbba553ba50837c8f222760b344319e81655f32ea6e68097ec02a'
  '29f5cde4d5ba6d73b14d6fd88a0be930c6bcf5eff3512332cba50a30316c6621'
)

build() {
  export RUSTUP_HOME=${srcdir}/.rustup
  export CARGO_HOME=${srcdir}/.cargo
  export RUST_VERSION=1.91.0
  export JAVA_HOME=/usr/lib/jvm/$(archlinux-java status | grep -o "[^ ]*-$_jdkver-[^ ]*" | head -n 1 | tr -d '[:space:]')/
  export PATH="$JAVA_HOME/bin/:$PATH"

  echo "==== BUILDING MCP SERVER"
  cd "${srcdir}/${_pkgbase}-${pkgver}/mcp/packages/server"
  pnpm --config.node-linker=hoisted install
  rm -rf node_modules dist/node_modules
  pnpm build
  cp -r ../../node_modules package.json dist
  sed -i 's#"main": "dist/index.js"#"main": "./index.js"#' dist/package.json
  cd dist
  sed -i 's~process.cwd()~import.meta.dirname~g' index.js
  sed -i 's~process.argv\[1\].endsWith("index.js")~process.argv[1].endsWith("index.js") || process.argv[1].includes("/bin/penpot-mcp")~' index.js

  echo "==== BULDING FRONTEND"
  cd "${srcdir}/${_pkgbase}-${pkgver}/frontend"
  sed -i '/^corepack/d' ./scripts/build
  sed -i '/^corepack/d' ../mcp/scripts/setup

  pushd ../render-wasm
  sed -i '/corepack/d' ./_build_env
  sed -i 's#/opt/emsdk/emsdk_env.sh#/usr/lib/emsdk/emsdk_env.sh#' ./build
  popd

  rustup install $RUST_VERSION
  rustup default $RUST_VERSION
  rustup target add wasm32-unknown-emscripten

  CURRENT_HASH=$(echo $sha256sums[0] | head -c 7) \
  PATH=$PATH:/usr/lib/emscripten \
    ./scripts/build $pkgver

  echo "==== BUILDING EXPORTER"
  cd "${srcdir}/${_pkgbase}-${pkgver}/exporter"
  # patch playwright to use chromium from archlinux
  # so we don't have to install the playwright binaries
  sed -i 's|:args #js|:executablePath "/usr/bin/chromium", :args #js|' src/app/browser.cljs
  sed -i 's#^{#{\n  "bin": "./app.js",#' package.json
  sed -i '/^corepack/d' ./scripts/build
  sed -i 's/pnpm install/pnpm --config.node-linker=hoisted install/g' ./scripts/build
  sed -i '/install chromium/d' ./scripts/build
  ./scripts/build "${pkgver}"
  cd target
  sed -i 's#"name": "exporter",#"name": "penpot-exporter",#' package.json
  mv ../node_modules .
  rm -f node_modules/.pnpm-workspace*

  echo "==== BUILDING BACKEND"
  cd "${srcdir}/${_pkgbase}-${pkgver}/backend"
  ./scripts/build "${pkgver}"
  sed -i "2 i JAVA_HOME='$JAVA_HOME'" target/dist/run.sh
  sed -i s#penpot.jar#/usr/share/java/penpot/backend.jar# target/dist/run.sh
}

package_penpot-frontend() {
  install -dm 755 "${pkgdir}/usr/share/webapps/penpot"
  install -Dm755 penpot-update-flags.sh "${pkgdir}/usr/bin/penpot-update-flags.sh"
  cp --no-preserve=ownership -r \
    "${srcdir}/${_pkgbase}-${pkgver}/frontend/target/dist/"* \
    "${pkgdir}/usr/share/webapps/penpot/"
}

package_penpot() {
  backup=("etc/conf.d/penpot")
  depends=(
    "java-environment>=${_jdkver}" "java-environment<=${_jdkver}"
    'nodejs'
    'redis'
    'postgresql'
    'imagemagick'
    'poppler'
    'potrace'
    'woff2'
    'fontforge'
    'rlwrap'
    'libwebp'
    'fontconfig'
    'ghostscript'
    'netpbm'
    'potrace'
    'imagemagick'
  )
  optdepends=(
    "python-tabulator: for the penbot-manage script"
    "sfnt2woff: for uploading own fonts"
  )

  install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/backend/target/dist/penpot.jar" \
    "${pkgdir}/usr/share/java/penpot/backend.jar"
  install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}/backend/target/dist/run.sh" \
    "${pkgdir}/usr/bin/penpot"
  install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}/backend/target/dist/manage.py" \
    "${pkgdir}/usr/bin/penpot-manage"

  install -Dm644 penpot.conf.d "${pkgdir}/etc/conf.d/penpot"
  install -Dm644 penpot.service "${pkgdir}/usr/lib/systemd/system/penpot.service"
  install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/penpot.conf"
  install -Dm644 penpot.tmpfiles.d "${pkgdir}/usr/lib/tmpfiles.d/penpot.conf"
  install -Dm644 nginx.conf "${pkgdir}/usr/share/penpot/nginx.conf"
}

package_penpot-exporter() {
  backup=("etc/conf.d/penpot-exporter")
  depends=(
    'nodejs'
    'redis'
    'postgresql'
    'imagemagick'
    'poppler'
    'potrace'
    'woff2'
    'fontforge'
    'rlwrap'
    'libwebp'
    'fontconfig'
    'ghostscript'
    'netpbm'
    'potrace'
    "chromium"
  )

  install -dm 755 "${pkgdir}/usr/lib/node_modules/penpot-exporter"
  install -dm 755 "${pkgdir}/usr/bin"
  cp --no-preserve=ownership -r \
    "${srcdir}/${_pkgbase}-${pkgver}/exporter/target/." \
    "${pkgdir}/usr/lib/node_modules/penpot-exporter"
  pushd "${pkgdir}/usr/bin"
  ln -s ../lib/node_modules/penpot-exporter/app.js penpot-exporter
  popd
  install -Dm644 penpot-exporter.service "${pkgdir}/usr/lib/systemd/system/penpot-exporter.service"
  install -Dm644 penpot-exporter.conf.d "${pkgdir}/etc/conf.d/penpot-exporter"
}

package_penpot-mcp() {
  depends=(
    'nodejs'
  )

  install -dm 755 "${pkgdir}/usr/lib/node_modules/penpot-mcp"
  install -dm 755 "${pkgdir}/usr/bin"
  cp --no-preserve=ownership -r \
    "${srcdir}/${_pkgbase}-${pkgver}/mcp/packages/server/dist/." \
    "${pkgdir}/usr/lib/node_modules/penpot-mcp/"
  pushd "${pkgdir}/usr/bin"
  ln -s ../lib/node_modules/penpot-mcp/index.js penpot-mcp
  popd
  install -Dm644 penpot-mcp.service "${pkgdir}/usr/lib/systemd/system/penpot-mcp.service"
}
