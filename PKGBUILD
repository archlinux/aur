# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-git
pkgver=1.0.2.beta.2.r11.gb90f58e
pkgrel=1
pkgdesc="Next-generation cross-platform Audio-For-VATSIM ATC Client"
arch=(x86_64 aarch64)
url="https://github.com/pierr3/TrackAudio"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin")
depends=()
makedepends=(
    gcc
    git
    ninja
    nodejs-cmake-js
    npm
    unzip
    zip)
source=(
	"$_pkgname::git+https://github.com/pierr3/TrackAudio.git#branch=main"
	'trackaudio.desktop'
)
b2sums=('SKIP'
  'e5d905932c031af328c3139cf225113cbdbb9abf0e0e00c6f58ffc1a78dbf3a21afb787c74768c3e18449b342a41f0117774db52b9f20229fd7fdd02b80a7b6e')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  npm run build-backend
  npm install
  npm run package
}

package() {
  mkdir -p "$pkgdir/usr/lib/$_pkgname/"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 trackaudio.desktop -t "$pkgdir/usr/share/applications/"
  cp -r $_pkgname/out/TrackAudio-linux-x64/* -t "$pkgdir/usr/lib/$_pkgname/"
  ln -s "/usr/lib/${_pkgname}/trackaudio" "${pkgdir}/usr/bin/trackaudio"

  # Trackaudio expects libafv_native.so in /usr/lib
  ln -s "/usr/lib/${_pkgname}/libafv_native.so" "${pkgdir}/usr/lib/libafv_native.so"
}

