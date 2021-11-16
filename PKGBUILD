# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=jackmix-git
_pkgname=jackmix
pkgver=r370.fbe4885
pkgrel=1
pkgdesc="Matrix-mixer for JACK"
arch=('i686' 'x86_64')
url="https://github.com/kampfschlaefer/jackmix"
license=('GPL2')
depends=('qt5-base' 'jack' 'ladish')
makedepends=('gendesk' 'scons')
conflicts=('jackmix')
source=("${_pkgname}"::'git+https://github.com/kampfschlaefer/jackmix.git#branch=no-lash'
        silence_deprec_errors.patch)
md5sums=('SKIP'
         '0ed19b1747391585c597d73cc06f30b1')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${_pkgname}"
  gendesk -f -n --pkgname "$_pkgname" --exec "$_pkgname" --pkgdesc "$pkgdesc" --categories 'Audio;AudioVideo;Mixer'
  patch -p2 -i "$srcdir/silence_deprec_errors.patch"
}

build() {
  cd "$srcdir/${_pkgname}"
  scons
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm755 jackmix/jackmix $pkgdir/usr/bin/jackmix
  install -Dm644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
}
