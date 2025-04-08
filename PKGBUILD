# Maintainer: Hauke Rehfeld <aur@haukerehfeld.de>
_pkgname=whisper.cpp
pkgname="${_pkgname}-git"
pkgver=v1.7.5.r13.gb1f5c11
pkgrel=1
pkgdesc="Port of OpenAI's Whisper model in C/C++"
arch=("i686" "x86_64")
url="https://github.com/ggerganov/whisper.cpp"
license=("MIT")

makedepends=("git" "cmake")
depends=()
conflicts=("${_pkgname}")
provides=()

source=("${pkgname}::git+https://github.com/ggerganov/whisper.cpp#branch=master")
sha256sums=('SKIP')


pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  _BUILDDIR="$srcdir/build"

  cmake -S "$srcdir/$pkgname" -B "$_BUILDDIR" -DCMAKE_INSTALL_PREFIX=/usr -W no-dev -D CMAKE_BUILD_TYPE=None
  cmake --build "$_BUILDDIR"
}

package() {
  _BUILDDIR="$srcdir/build"
  DESTDIR="$pkgdir" cmake --install "$_BUILDDIR"
  # compatability to previous make based build binary name
  ln -s "/usr/bin/whisper-cli" "$pkgdir/usr/bin/${_pkgname}"
}
