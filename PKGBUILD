# Maintainer: munsternet <munsternet at ik dot me>
_pkgname=trackaudio
pkgname=trackaudio-git
pkgver=1.3.0.beta.5.r3.g72f0323
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
  git submodule update --init --remote backend/vcpkg
  git submodule update --init --remote backend/extern/afv-native
  git submodule update --init --remote backend/extern/libuiohook
  cd backend/extern/afv-native
  git checkout develop-trackaudio
  cd ../libuiohook
  git checkout unregister-hook-when-debugging
}

build() {
  cd "$_pkgname"
  npm run build:backend
  npm install
  npm run build:unpack
}

package() {
  mkdir -p "$pkgdir/opt/TrackAudio"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 trackaudio.desktop -t "$pkgdir/usr/share/applications/"
  cp -r $_pkgname/dist/linux-unpacked/* "$pkgdir/opt/TrackAudio/"

  # make /usr/bin/trackaudio available
  binf="$pkgdir/usr/bin/$_pkgname"
  if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/TrackAudio/$_pkgname "$binf"
  fi
}

