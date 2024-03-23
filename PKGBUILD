# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Aloxaf <aloxafx at gamil>

pkgname=hiddify-next
pkgver=1.1.1
pkgrel=1
pkgdesc="Multi-platform proxy client based on sing-box universal proxy tool-chain"
arch=('x86_64')
url="https://github.com/hiddify/hiddify-next"
license=('CC-BY-NC-SA-4.0')
depends=('at-spi2-core'
         'fontconfig'
         'gcc-libs'
         'glib2'
         'glibc'
         'gtk3'
         'libayatana-appindicator'
         'libepoxy'
         'pango')
makedepends=('clang' 'cmake' 'fvm' 'ninja')
source=("${pkgname}-${pkgver}::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "hiddify-next.desktop")
sha256sums=('44549d666f74c60693f09888f44a38c26a09f7f8783f40d545c3e168c81fe086'
            'f5ea17d65166ee85605863bcf718d09c4b77bf324090bbb4771bbf7bd626987e')

prepare() {
  cd "${pkgname}-${pkgver}"
  fvm global stable
  export PATH="${PATH}:$(fvm global stable --verbose | awk '/cacheVersion.binPath/ {print $2}')"
  flutter config --no-analytics
  flutter config --enable-linux-desktop
  make linux-prepare
}

build() {
  cd "${pkgname}-${pkgver}"
  flutter build linux --release
}

package() {
  cd "${pkgname}-${pkgver}/build/linux/x64/release/bundle"
  install -d "${pkgdir}/opt/${pkgname}"
  cp -r . "${pkgdir}/opt/${pkgname}"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/hiddify" "${pkgdir}/usr/bin/hiddify"

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/hiddify.desktop"
  sed -i "s/VERSION_PLACEHOLDER/${pkgver}/" "${pkgdir}/usr/share/applications/hiddify.desktop"

  install -Dm644 data/flutter_assets/assets/images/logo.svg "${pkgdir}/usr/share/pixmaps/hiddify.svg"
}
