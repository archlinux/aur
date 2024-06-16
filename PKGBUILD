# Maintainer: Georg Nagel <g.schlmm at gmail dot com>

_pkgbase=penpot
pkgname=(penpot penpot-exporter penpot-frontend)
pkgver=2.0.3
babashka_version="1.3.189"
pkgrel=2
pkgdesc="The open-source design tool for design and code collaboration "
arch=('x86_64')
url="https://penpot.app"
license=('MPL-2.0')
# penpot is using 19, but archlinux only has 17 and 21. 17 and > 21 doesnt work
# also jdk is needed and not only jre
_jdkver="21"
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
makedepends=('clojure' 'git' 'curl' 'npm' 'rsync')
optdepends=(
  "python-tabulator: for the penbot-manage script"
  "sfnt2woff: for uploading own fonts"
  "chromium: for making the exporter work"
)
source=(
  https://github.com/penpot/penpot/archive/refs/tags/$pkgver.tar.gz
  https://github.com/borkdude/babashka/releases/download/v$babashka_version/babashka-$babashka_version-linux-amd64-static.tar.gz
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
  '5a5f73cf354d7b45a584eed589d779bbc52c051decb93365985e00e252b24dca'
  '228e8ccee724ba8d66c66d8672161b991bb00b00e538e7aecd0b902330e5a712'
  '4b82b8a79d8a143fd8a6e4473447f8946c095e2617ba5fcba4cb5b1fdd840c2c'
  'bc133ba7409921978655c488293ef83f77250fd65cb7d574c3cba9f34ff42523'
  '828087c8fab14fb481b4bd01d92f47e9ecc9c07551a7a873bcfbafd1e3644afb'
  'a95f1029cec7cf408cf19cb97cf235c48f671aa93424c138759ee77e239d1c6a'
  '865ac061c90c1f64b60af7f1e36938748e2e2bd45e680b429e41dc9db6892bf8'
  'f3208349de006fc26119cd9b034958bbfa3c161bfb76a752d43d5b563df6e33d'
  'b759994786bcbba553ba50837c8f222760b344319e81655f32ea6e68097ec02a'
  '29f5cde4d5ba6d73b14d6fd88a0be930c6bcf5eff3512332cba50a30316c6621'
)

prepare() {
  # Set CLOJURE_GITLIBS environment variable to define the path for Git libraries
  # export CLOJURE_GITLIBS="$srcdir/clojure-gitlibs"
  mkdir -p $srcdir/bin
  cp "${srcdir}/bb" "${srcdir}/bin/bb"
  chmod +x "${srcdir}/bin/bb"
  export JAVA_HOME="/usr/lib/jvm/java-${_jdkver}-openjdk"
  export PATH=$srcdir/bin:$JAVA_HOME/bin:$PATH
}

build() {
  # build the frontend
  cd "${srcdir}/${_pkgbase}-${pkgver}/frontend"
  # we dont have yarn @ version 4 as package, so use npm
  sed -i s/yarn\ /npm\ / ./scripts/build
  sed -i 's/npm install/npm install --dev/' ./scripts/build
  # add buffer to dependencies?
  sed -i 's/"dependencies": {/"dependencies": {"buffer": "*",/' package.json
  rm -f package-lock.json
  # somehow shadow-cljs is needed but isnt installed (maybe because of not using yarn?)
  npm install --save-dev shadow-cljs
  CURRENT_HASH=$(echo $sha256sums[0] | head -c 7) ./scripts/build $pkgver

  # build the exporter
  cd "${srcdir}/${_pkgbase}-${pkgver}/exporter"
  sed -i s/yarn\ /npm\ / ./scripts/build
  sed -i 's/cp npm.lock target/#/' ./scripts/build
  # patch playwright to use chromium from archlinux
  # so we don't have to install the playwright binaries
  sed -i 's|:args #js|:executablePath "/usr/bin/chromium", :args #js|' src/app/browser.cljs
  ./scripts/build "${pkgver}"
  cd target
  sed -i 's#"packageManager": ".*",#"bin": "./app.js",#' package.json
  sed -i 's#"name": "exporter",#"name": "penpot-exporter",#' package.json
  tar cvf penpot-exporter.tgz .

  # build the backend
  cd "${srcdir}/${_pkgbase}-${pkgver}/backend"
  ./scripts/build "${pkgver}"
  sed -i "2 i JAVA_HOME='$JAVA_HOME'" target/dist/run.sh
  sed -i s#penpot.jar#/usr/share/java/penpot/backend.jar# target/dist/run.sh
}

package_penpot-exporter() {
  npm install -g \
    --cache "${srcdir}/npm-cache" \
    --prefix "${pkgdir}/usr" \
    "${srcdir}/${_pkgbase}-${pkgver}/exporter/target/penpot-exporter.tgz"
  install -Dm644 penpot-exporter.service "${pkgdir}/usr/lib/systemd/system/penpot-exporter.service"
}

package_penpot-frontend() {
  install -dm 755 "${pkgdir}/usr/share/webapps/penpot"
  cp -r "${srcdir}/${_pkgbase}-${pkgver}/frontend/target/dist/"* \
    "${pkgdir}/usr/share/webapps/penpot/"
}

package_penpot() {
  install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/backend/target/dist/penpot.jar" \
    "${pkgdir}/usr/share/java/penpot/backend.jar"
  install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}/backend/target/dist/run.sh" \
    "${pkgdir}/usr/bin/penpot"
  install -Dm755 "${srcdir}/${_pkgbase}-${pkgver}/backend/target/dist/manage.py" \
    "${pkgdir}/usr/bin/penpot-manage"

  install -Dm755 penpot-update-flags.sh "${pkgdir}/usr/bin/penpot-update-flags.sh"
  install -Dm644 penpot.conf.d "${pkgdir}/etc/conf.d/penpot"
  install -Dm644 penpot.service "${pkgdir}/usr/lib/systemd/system/penpot.service"
  install -Dm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/penpot.conf"
  install -Dm644 penpot.tmpfiles.d "${pkgdir}/usr/lib/tmpfiles.d/penpot.conf"
  install -Dm644 nginx.conf "${pkgdir}/usr/share/penpot/nginx.conf"
}
