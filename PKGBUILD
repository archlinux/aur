# Maintainer: Kino <cybao292261@163.com>

pkgname=eastl
_pkgname=EASTL
pkgver=3.27.00
pkgrel=2
pkgdesc="Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance."
arch=('x86_64' 'riscv64')
url="https://github.com/electronicarts/EASTL"
license=("BSD-3-Clause")
makedepends=("cmake" "git")
optdepends=("mimalloc: for better performance")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/electronicarts/EASTL/archive/${pkgver}.tar.gz"
        "EASTL-3.21.23.patch")
sha256sums=('5606643e41ab12fd7c209755fe04dca581ed01f43dec515288b1544eea22623f'
            'c5b9a2db05ec2d98fb8e7b59ee942adfc0cd223e06567fc49ad1bb4acf5a011a')
b2sums=('e1872453575135fd81e7caa07638df7d30c716ae6c9422aacdd0ae20a9b8ab144c77370d67636497d70c0bdacb469a9769215db5288b0df708696db9aa262fbb'
        '9ea7ab0978e0399c6cfbab37e16431caafca768fea2b800cf14587a2ae83d8ee187192f51819f1dedf5166a80b1acf846f7cca5efe64f770a1d82da459596333')

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  patch -Np1 < "$srcdir/EASTL-3.21.23.patch"
}

build() {
  # Clear default flags in makepkg.conf
  unset CFLAGS CXXFLAGS LDFLAGS LTOFLAGS

  cmake -B build -S $srcdir/$_pkgname-$pkgver \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_SHARED_LIBS=ON \
        -DEASTL_BUILD_TESTS=ON \
        -DEASTL_BUILD_BENCHMARK=OFF \
        -DEASTL_STD_ITERATOR_CATEGORY_ENABLED=ON \
        -Wno-dev
  cmake --build build --config Release
}

check() {
  ctest --test-dir build/test -C Release -VV
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/3RDPARTYLICENSES.TXT" "${pkgdir}/usr/share/licenses/${pkgname}/3RDPARTYLICENSES.TXT"
}
