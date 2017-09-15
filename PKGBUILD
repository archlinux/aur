# Maintainer: Lukas Böger <dev  AT  lboeger  DOT  de>
# Contributor:  Francesco Turco <fturco  AT  fastmail  DOT  fm>
# Contributor:  Marcin Wieczorek <marcin  AT  marcin  DOT  co>

pkgname=tmsu-git
pkgver=0.6.1
pkgrel=1

pkgdesc='Tag your files and access them through a virtual filesystem'
arch=('i686' 'x86_64')
url="http://tmsu.org/"
license=('GPL3')

makedepends=('git' 'go')
conflicts=("${pkgname%-git}")

source=("git+https://github.com/oniony/${pkgname/-/.}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"

    printf '%s+g%s' $(git tag -l 'v*' | tail -n 1 | cut -c 2-) $(git describe --always)
}

build() {
  export GOPATH=/tmp

  go get -u github.com/mattn/go-sqlite3
  go get -u github.com/hanwen/go-fuse/fuse

  cd "${srcdir}/${pkgname%-git}"
  make dist
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  make test
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make install DESTDIR="${pkgdir}" MOUNT_INSTALL_DIR="${pkgdir}/usr/bin"
}
