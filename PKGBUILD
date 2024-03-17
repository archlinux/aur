# Maintainer: Sam Day <me@samcday.com>

pkgname=dnf5
pkgver=5.1.15
pkgrel=3
pkgdesc="Next-generation RPM package management system "
arch=('x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
conflicts=('dnf')
depends=()
makedepends=(
    'cmake'
    'cppunit'
    'createrepo_c'
    'doxygen'
    'gettext'
    'perl-test-exception'
    # 'ruby'  # https://github.com/rpm-software-management/dnf5/issues/562
    'sdbus-cpp'
    'swig'
    'toml11'
    #'zchunk'    # seems broken with zchunk support enabled currently.
                 # I think because upstream depends on 0.9, but AUR has 1.3 packaged
    )
backup=("etc/$pkgname/dnf.conf")
options=('!emptydirs')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('f4044439b84c10eb4378b9212c082c4c1c6b0d69319a043bf05ac6d7142ea21f')

build() {
  cd "$pkgname-$pkgver"

  cmake -B build \
        -DWITH_MAN=off \
        -DWITH_ZCHUNK=off \
        -DWITH_RUBY=off

  cd build
  make
}

check() {
  cd "$pkgname-$pkgver/build"
  CTEST_OUTPUT_ON_FAILURE=1 make test
}

package() {
  cd "$pkgname-$pkgver"

  make -C build DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/{sbin,bin}/dnf5daemon-server
  ln -fs $pkgname "$pkgdir/usr/bin/dnf"
  rmdir $pkgdir/usr/sbin
}
