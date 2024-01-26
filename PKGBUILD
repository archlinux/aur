# Maintainer: Analetta Ehler <dev@annieehler.com>

pkgname=cockpit-composer
pkgdesc='Composer generates custom images suitable for deploying systems or uploading to the cloud. It integrates into Cockpit as a frontend for osbuild.'
pkgver=47
pkgrel=1
url="https://www.cockpit-project.org"
arch=(x86_64)
license=(Apache)
depends=('dnf' 'qemu' 'osbuild' 'osbuild-composer' 'cockpit')
makedepends=('nodejs' 'npm' 'appstream-glib')
checkdepends=('npm')
optdepends=()
source=($pkgname-$pkgver.tar.gz::https://github.com/osbuild/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('fbf77f1b510e3d603adff30a85d5811343f3662df3c9f40037f78a967b221abc')
noextract=($pkgname-$pkgver.tar.gz)

prepare() {
  cd $srcdir
 
  # bsdtar simply can't take the heat
  tar -xf $pkgname-$pkgver.tar.gz
}

build() {
  cd $pkgname
  npm ci
  npm run build:prod
}

package() {
  cd $pkgname

  # static files for cockpit to serve
  install -Dm644 public/main.css "${pkgdir}/usr/share/cockpit/composer/main.css"
  install -Dm644 public/index.html "${pkgdir}/usr/share/cockpit/composer/index.html"
  install -Dm644 public/main.js "${pkgdir}/usr/share/cockpit/composer/index.html"
  install -Dm644 public/translations_compiled_cs_json.main.js "${pkgdir}/usr/share/cockpit/composer/index.html"
  install -Dm644 public/translations_compiled_de_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_de_json.main.js"
  install -Dm644 public/translations_compiled_en_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_en_json.main.js"
  install -Dm644 public/translations_compiled_fr_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_fr_json.main.js"
  install -Dm644 public/translations_compiled_ja_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_ja_json.main.js"
  install -Dm644 public/translations_compiled_ka_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_ka_json.main.js"
  install -Dm644 public/translations_compiled_ko_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_ko_json.main.js"
  install -Dm644 public/translations_compiled_tr_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_tr_json.main.js"
  install -Dm644 public/translations_compiled_uk_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_uk_json.main.js"
  install -Dm644 public/translations_compiled_zh_CN_json.main.js "${pkgdir}/usr/share/cockpit/composer/translations_compiled_zh_CN_json.main.js"
  install -Dm644 public/manifest.json "${pkgdir}/usr/share/cockpit/composer/manifest.json"
  install -Dm644 public/io.weldr.cockpit-composer.metainfo.xml "${pkgdir}/usr/share/cockpit/composer/io.weldr.cockpit-composer.metainfo.xml"
  
  # metainfo
  mkdir -p "${pkgdir}/usr/share/metainfo/"
  appstream-util validate-relax --nonet public/io.weldr.cockpit-composer.metainfo.xml
  install -Dm644 "public/io.weldr.cockpit-composer.metainfo.xml" "${pkgdir}/usr/share/metainfo/" 
  
  # license
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
