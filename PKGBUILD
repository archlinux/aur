# Contributor: Paige Aran <paige.aran@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
_base=racket
pkgname=${_base}-git
pkgver=7.0.0.12.38897.369eb65ec2
pkgrel=1
pkgdesc="Minimal Racket installation, without DrRacket, from git"
arch=('i686' 'x86_64')
url="https://${_base}-lang.org"
license=('Apache' 'GPL3' 'LGPL3' 'custom')
depends=(bash libffi)
makedepends=(git)
provides=(${_base})
conflicts=(${_base})
options=('!strip' '!emptydirs')
source=(git+https://github.com/${_base}/${_base}.git)
md5sums=('SKIP')

pkgver() {
  cd ${_base}
  printf %s.%s.%s \
    $(grep ' MZSCHEME_VERSION ' \
      ${srcdir}/${_gitname}/${_gitname}/src/racket/src/schvers.h |
      cut -d '"' -f 2) "$(git rev-list --count HEAD)" $(git log -1 --format='%h')
}

build() {
  cd ${_base}
  make in-place
}

package() {
  cd ${_base}/${_base}
  install -d "$pkgdir"/usr/share/doc/racket
  install -d "$pkgdir"/usr/lib
  install -d "$pkgdir"/usr/share/racket/
  cp -r bin "$pkgdir"/usr
  cp -r collects "$pkgdir"/usr/share/racket/
  cp -r lib "$pkgdir"/usr/lib/racket
  cp -r doc/* "$pkgdir"/usr/share/doc/racket
  install -Dm644 etc/config.rktd "$pkgdir"/etc/config.rktd
  cp -r man "$pkgdir"/usr/share
  cp -r share/applications "$pkgdir"/usr/share
}
