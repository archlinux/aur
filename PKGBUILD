# Contributor: Paige Aran <paige.aran@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_base=racket
pkgname=${_base}-git
pkgver=8.5.0.8.gc1bd043
pkgrel=2
pkgdesc="Minimal Racket installation, without DrRacket, from git"
arch=('i686' 'x86_64')
url="https://${_base}-lang.org"
license=('Apache' 'GPL3' 'LGPL3' 'custom')
depends=('bash' 'libffi')
makedepends=('git' 'awk' 'fontconfig')
provides=(${_base})
conflicts=(${_base})
options=('!strip' '!emptydirs')
source=(git+https://github.com/${_base}/${_base}.git)
md5sums=('SKIP')

pkgver() {
  printf %s.%s.%s.%s.g%s \
  $(awk '/ MZSCHEME_VERSION_X / {print $3}' \
	 "${srcdir}"/${_base}/${_base}/src/version/${_base}_version.h) \
  $(awk '/ MZSCHEME_VERSION_Y /{print $3}' \
	"${srcdir}"/${_base}/${_base}/src/version/${_base}_version.h) \
  $(awk '/ MZSCHEME_VERSION_Z / {print $3}'  \
	"${srcdir}"/${_base}/${_base}/src/version/${_base}_version.h| head -1) \
  $(awk '/ MZSCHEME_VERSION_W / {print $3}'  \
	"${srcdir}"/${_base}/${_base}/src/version/${_base}_version.h| head -1) \
  $(git log -1 --format='%h')
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
  sed -i 's+.png++' "$pkgdir"/usr/share/applications/{drracket,slideshow}.desktop
}
