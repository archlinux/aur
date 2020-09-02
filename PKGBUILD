# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nanopolish
pkgver=0.13.2
pkgrel=2
pkgdesc="Provide signal-level analysis of Oxford Nanopore sequencing data"
arch=('i686' 'x86_64')
url="https://github.com/jts/nanopolish"
license=('MIT')
depends=('glibc' 'hdf5' 'htslib' 'zlib')
makedepends=('git' 'eigen' 'wget')
source=("git+https://github.com/jts/nanopolish.git#tag=v$pkgver"
        "0001-Fix-include-path-for-system-installed-eigen-library.patch::https://github.com/jts/nanopolish/commit/d8ba7166c44fff433458d2ec7b0f4f01578455be.patch"
        "0002-Allow-users-to-supply-htslib-include-path-from-comma.patch::https://github.com/jts/nanopolish/commit/90401e399fbd818f699fbba73a304337737d506e.patch")
sha256sums=('SKIP'
            '8863f56ef51672a4c6c50aeaea2e0e1b866a06bf4d4ca14006680f698e795a26'
            '99fc545490b0be901e3116274692172c9f3e3cb3984fc808b61febc9622cfde1')


prepare() {
  cd "nanopolish"

  git submodule update --init --recursive --remote

  patch -Np1 -i "$srcdir/0001-Fix-include-path-for-system-installed-eigen-library.patch"
  patch -Np1 -i "$srcdir/0002-Allow-users-to-supply-htslib-include-path-from-comma.patch"
}

build() {
  cd "nanopolish"

  make \
    EIGEN=noinstall \
    HDF5=noinstall \
    HTS=noinstall \
    EIGEN_INCLUDE="-I/usr/include/eigen3" \
    H5_INCLUDE="-I/usr/include" \
    HTS_INCLUDE="-I/usr/include/htslib"
}

check() {
  cd "nanopolish"

  make \
    EIGEN=noinstall \
    HDF5=noinstall \
    HTS=noinstall \
    EIGEN_INCLUDE="-I/usr/include/eigen3" \
    H5_INCLUDE="-I/usr/include" \
    HTS_INCLUDE="-I/usr/include/htslib" \
    test
}

package() {
  cd "nanopolish"

  install -Dm755 "nanopolish" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/nanopolish"
}
