# Maintainer: Omansh Krishn omansh@duck.com

pkgname=bloomeetunes-git
_pkgname=bloomeetunes
pkgver=2.9.9+138.r0.g6455809
pkgrel=1
_flutterver=3.24.0
pkgdesc='🌸Bloomee is a cross-platform music app designed to bring you ad-free tunes from various sources. 🌼🎵'
arch=('x86_64')
url='https://github.com/HemantKArya/BloomeeTunes'
license=('GPL2')
depends=('gtk3' 'pango' 'harfbuzz' 'at-spi2-core' 'cairo' 'gdk-pixbuf2' 'glib2' 'gcc-libs')
makedepends=('fvm' 'curl' 'git' 'unzip' 'xz' 'glu' 'ninja' 'cmake' 'mpv' 'clang')
provides=('bloomeetunes')
conflicts=('bloomeetunes-bin')
options=(!debug)


source=("${_pkgname}::git+https://github.com/HemantKArya/BloomeeTunes.git"
        "${_pkgname}.desktop")

sha512sums=('SKIP'
            '132a8d7d047d5cacf717ca1b13986699e977c62b64b88590bc2cbb3299fd27ad72d277b078159d7e548ddcefd16ed89208bfa898702b77a6941ff2cf5184ff30')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    fvm install "${_flutterver}"
    fvm use "${_flutterver}" -f
    fvm flutter pub get
    echo "CLIENT_ID = XXXXX\nCLIENT_SECRET = XXXX EOF" > assets/.env
}

build() {
  cd "${srcdir}/${_pkgname}" 
  fvm flutter build linux --release
}

package() {
  install -dm755 "${pkgdir}/opt"
  install -dm755 "${pkgdir}/usr/share/applications"
  
  install -Dm755 "${srcdir}/${_pkgname}/build/linux/x64/release/bundle/bloomee" "${pkgdir}/opt/bloomeetunes/bloomee"
  cp --preserve=mode -r "${srcdir}/${_pkgname}/build/linux/x64/release/bundle/data" "${pkgdir}/opt/bloomeetunes/data"
  cp --preserve=mode -r "${srcdir}/${_pkgname}/build/linux/x64/release/bundle/lib" "${pkgdir}/opt/bloomeetunes/lib"

  install -m644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
  
  cleanup
}

cleanup() {
  cd "${srcdir}/${_pkgname}"
  fvm flutter clean
  fvm remove "${_flutterver}"
  rm -rf ~/fvm/cache.git
}
