# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

_pkgbase=penpot
pkgname=(penpot penpot-exporter penpot-frontend)
pkgver=2.3.0
pkgrel=1
pkgdesc="The open-source design tool for design and code collaboration "
arch=('x86_64')
url="https://penpot.app"
license=('MPL-2.0')
# penpot is using 19, but archlinux only has 17 and 21. 17 and > 21 doesnt work
# also jdk is needed and not only jre
_jdkver="21"
makedepends=('clojure' 'git' 'curl' 'npm' 'yarn' 'rsync' 'babashka')
source=(
  https://github.com/penpot/penpot/archive/refs/tags/$pkgver.tar.gz
  sysusers.conf
  penpot.conf.d
  penpot-exporter.conf.d
  penpot.service
  penpot-exporter.service
  penpot.tmpfiles.d
  penpot-update-flags.sh
  nginx.conf
)
noextract=($pkgname-$pkgver.tgz)
sha256sums=(
  '7215da765022f894c9574b69a9e4f2c46369b71c20e5055d280436bdf12912d3'
  '4b82b8a79d8a143fd8a6e4473447f8946c095e2617ba5fcba4cb5b1fdd840c2c'
  'bc133ba7409921978655c488293ef83f77250fd65cb7d574c3cba9f34ff42523'
  '828087c8fab14fb481b4bd01d92f47e9ecc9c07551a7a873bcfbafd1e3644afb'
  'a95f1029cec7cf408cf19cb97cf235c48f671aa93424c138759ee77e239d1c6a'
  'ee1c7f1566b31ae8666c4444568906db5745a11b01c4ca53eda6b8f508f88e86'
  'f3208349de006fc26119cd9b034958bbfa3c161bfb76a752d43d5b563df6e33d'
  'b759994786bcbba553ba50837c8f222760b344319e81655f32ea6e68097ec02a'
  '29f5cde4d5ba6d73b14d6fd88a0be930c6bcf5eff3512332cba50a30316c6621'
)

build() {
  export YARN_CACHE_FOLDER="${srcdir}/.yarn-cache"
  # # build the frontend
  echo "==== BULDING frontend"
  cd "${srcdir}/${_pkgbase}-${pkgver}/frontend"
  # # we dont have yarn @ version 4 as package, so use yarn 1.x
  sed -i '/"packageManager":.*,/d' ../package.json
  sed -i '/"packageManager":.*,/d' ./package.json
  sed -i 's/yarn install/NODE_ENV=development yarn install/' ./scripts/build
  sed -i 's/\.git#commit=/.git#/' package.json
  CURRENT_HASH=$(echo $sha256sums[0] | head -c 7) ./scripts/build $pkgver

  echo "==== BUILDING EXPORTER"

  # build the exporter
  cd "${srcdir}/${_pkgbase}-${pkgver}/exporter"
  sed -i '/"packageManager":.*,/d' ./package.json
  # patch playwright to use chromium from archlinux
  # so we don't have to install the playwright binaries
  sed -i 's|:args #js|:executablePath "/usr/bin/chromium", :args #js|' src/app/browser.cljs
  sed -i 's#^{#{\n  "bin": "./app.js",#' package.json
  ./scripts/build "${pkgver}"
  cd target
  sed -i 's#"name": "exporter",#"name": "penpot-exporter",#' package.json
  tar cvf penpot-exporter.tgz .

  echo "==== BUILDING BACKEND"
  # build the backend
  cd "${srcdir}/${_pkgbase}-${pkgver}/backend"
  sed -i '/"packageManager":.*,/d' ./package.json
  ./scripts/build "${pkgver}"
  sed -i "2 i JAVA_HOME='$JAVA_HOME'" target/dist/run.sh
  sed -i s#penpot.jar#/usr/share/java/penpot/backend.jar# target/dist/run.sh
}

package_penpot-frontend() {
  install -dm 755 "${pkgdir}/usr/share/webapps/penpot"
  install -Dm755 penpot-update-flags.sh "${pkgdir}/usr/bin/penpot-update-flags.sh"
  cp -r "${srcdir}/${_pkgbase}-${pkgver}/frontend/target/dist/"* \
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

  npm install -g \
    --cache "${srcdir}/.npm-cache" \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_pkgbase}-${pkgver}/exporter/target/penpot-exporter.tgz"
  install -Dm644 penpot-exporter.service "${pkgdir}/usr/lib/systemd/system/penpot-exporter.service"
  install -Dm644 penpot-exporter.conf.d "${pkgdir}/etc/conf.d/penpot-exporter"
}
