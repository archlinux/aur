# Maintainer: Angelo Theodorou <encelo at gmail dot com>

pkgname=tracy-git
pkgver=v0.4.r32.g80bd427
pkgrel=1
pkgdesc="Real-time, nanosecond resolution frame profiler"
arch=('i686' 'x86_64')
url="https://bitbucket.org/wolfpld/tracy"
license=('BSD')
depends=('glfw-x11' 'gtk2')
makdepends=('pkgconf')
provides=('tracy')
conflicts=('tracy')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/tracy
  ( set -o pipefail
    git describe --tags --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd tracy
  make -C profiler/build/unix release
  make -C update/build/unix release
  make -C capture/build/unix release
}

package() {
  cd tracy
  install -Dm755 profiler/build/unix/Tracy-release $pkgdir/usr/bin/tracy
  install -Dm755 update/build/unix/update-release $pkgdir/usr/bin/tracy-update
  install -Dm755 capture/build/unix/capture-release $pkgdir/usr/bin/tracy-capture
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
