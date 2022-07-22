pkgname=trojan-plus
pkgver=r765.14a1f9c
pkgrel=1
pkgdesc="Trojan added with experimental features"
arch=('x86_64')
url="https://github.com/Trojan-Plus-Group/trojan-plus"
license=('GPL3')
depends=('boost-libs' 'openssl' 'mariadb-libs')
optdepends=('ca-certificates: server certificate verification'
            'mariadb: advanced user management')
makedepends=('git' 'cmake' 'boost' 'openssl' 'mariadb-libs')
checkdepends=('openssl' 'python' 'curl' 'netcat')
conflicts=("trojan")
source=("${pkgname}::git+$url")
backup=('etc/trojan/config.json')
sha512sums=('SKIP')
pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
  cd "$pkgname"
  git submodule sync --recursive; git submodule foreach -q git config remote.origin.url; git submodule update --init --recursive --remote
}
build() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
