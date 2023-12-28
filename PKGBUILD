# Maintainer: Kaydax <contact+aur@kaydax.xyz>

_pkgname=dectalk
pkgname=${_pkgname}-git
pkgver=2023.10.30.r5.g2de226f1
pkgrel=1
pkgdesc="Modern builds for the 90s/00s DECtalk text-to-speech application."
arch=('i686' 'x86_64')
url="https://github.com/dectalk/dectalk"
license=('Proprietary')
provides=('dectalk')
depends=('alsa-lib' 'libpulse')
makedepends=('make' 'git' 'unzip')
optdepend=(
  'gtk2: Needed for graphical interface'
)
source=("git+https://github.com/dectalk/dectalk"
        "dectalk.patch"
        "dectalk.desktop"
        "paul.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "dectalk"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch --directory="$_pkgname" --forward --strip=1 --input="${srcdir}/dectalk.patch"
  cd "dectalk/src"
  autoreconf -si
  ./configure
}

build() {
  cd "dectalk/src"
  make
}

package() {
  mkdir -p "$pkgdir/usr/share/applications"
  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp "dectalk.desktop" "$pkgdir/usr/share/applications/dectalk.desktop"
  cp "paul.png" "$pkgdir/usr/share/pixmaps/paul.png"
  cd "dectalk/src"
  make DESTDIR="$pkgdir" install
}

