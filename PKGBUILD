# Maintainer:

_pkgname="olivia"
pkgname="$_pkgname-git"
pkgver=1.0beta.r336.g4048134
pkgrel=1
pkgdesc="Elegant Cloud Music Player for Linux Desktop"
url="https://github.com/keshavbhatt/olivia"
license=('MIT')
arch=('i686' 'x86_64')

depends=(
  'ffmpeg'
  'mpv'
  'pv'
  'python'
  'qt5-base'
  'qt5-webkit'
  'socat'
  'taglib'
  'wget'
)
makedepends=(
  'git'
  'qt5-tools'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  provides=("$_pkgname")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags | sed -E 's/^v//;s/-(beta)/\1/;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

build() {
  mkdir -p build && cd build
  qmake "${srcdir:?}/$_pkgsrc/src/Olivia.pro" PREFIX="${pkgdir:?}/usr" -spec linux-g++ CONFIG+=release
  make
}

package() {
  cd build
  make install # ignores DESTDIR

  install -Dm644 "${srcdir:?}/$_pkgsrc/LICENSE" -t "${pkgdir:?}/usr/share/licenses/${pkgname:?}/"
}
