# Maintainer : coxackie
# Contributor: plague-doctor

pkgname=pcloudcc-git
_pkgname=${pkgname%-*}
pkgver=r1464.2ecb7c9
pkgrel=1
pkgdesc="A simple linux console client for pCloud cloud storage."
provides=("pcloudcc")
conflicts=("pcloudcc")
arch=('x86_64')
url="https://github.com/pcloudcom/console-client"
license=('GPL')
depends=('zlib' 'fuse')
makedepends=('cmake' 'boost')

source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname/pCloudCC/lib/pclsync"
  make clean
  make fs
  cd "$srcdir/$_pkgname/pCloudCC/lib/mbedtls"
  cmake .
  make clean
  make
  cd "$srcdir/$_pkgname/pCloudCC"
  cmake .
  make
}

package() {
  install -d "$pkgdir/usr/"{bin,lib}
  install -Dm775 "$srcdir/pcloudcc/pCloudCC/pcloudcc" "$pkgdir/usr/bin/pcloudcc"
  install -Dm664 "$srcdir/pcloudcc/pCloudCC/libpcloudcc_lib.so" "$pkgdir/usr/lib/libpcloudcc_lib.so"
}

