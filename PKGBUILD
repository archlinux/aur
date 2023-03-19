# Maintainer: weitcis <weitcis at pm dot me>
_pkgname=vector-audio
pkgname=vector-audio-git
pkgver=v0.7.0.r0.gafe2045
pkgrel=1
pkgdesc="An Audio-For-VATSIM ATC Client for macOS, Linux and Windows"
arch=(x86_64 aarch64)
url="https://github.com/pierr3/VectorAudio"
license=('GPL')
depends=()
makedepends=(
    git
    cmake
    gcc)
source=(
	"$_pkgname::git+https://github.com/pierr3/VectorAudio.git#branch=main"
	"vector-audio.desktop"
)
sha256sums=('SKIP'
            'fc3519b53638ff6ed548b8a096c5cb5395513725c097cfc6969d28ad1cf120c8')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
  ./vcpkg/bootstrap-vcpkg.sh -disableMetrics
}

build() {
  cd "$_pkgname"
  mkdir -p build/ && cd build/
  cmake .. && make
}

package() {
  mkdir -p "$pkgdir/usr/share/$_pkgname/resources"
  mkdir -p "$pkgdir/usr/share/$_pkgname/build"
  mkdir -p "$pkgdir/usr/bin"
  install -Dm644 $_pkgname/resources/* -t "$pkgdir/usr/share/$_pkgname/resources/"
  install -Dm644 vector-audio.desktop -t "$pkgdir/usr/share/applications/"
  touch "$pkgdir/usr/share/$_pkgname/resources/vector_audio.log"
  chmod 666 "$pkgdir/usr/share/$_pkgname/resources/vector_audio.log"
  install -Dm755 "$_pkgname/build/vector_audio" -t "$pkgdir/usr/share/$_pkgname/build/"
  #cd "$pkgdir/usr/bin"
  #ln -s "../share/$_pkgname/build/vector_audio" .
}
