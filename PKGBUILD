# Maintainer: Kino <cybao292261@163.com>

pkgname=eastl
_pkgname=EASTL
pkgver=3.27.01
pkgrel=1
pkgdesc="Electronic Arts Standard Template Library. It is an extensive and robust implementation that has an emphasis on high performance."
arch=('x86_64' 'riscv64')
url="https://github.com/electronicarts/EASTL"
license=("BSD-3-Clause")
makedepends=("cmake" "git")
optdepends=("mimalloc: for better performance")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/electronicarts/EASTL/archive/${pkgver}.tar.gz"
        "EASTL-3.21.23.patch")
sha256sums=('fce43bf443f5569b00a8deae735394ea0b16f6c3f96867a17ded50775ffcdd12'
            'c5b9a2db05ec2d98fb8e7b59ee942adfc0cd223e06567fc49ad1bb4acf5a011a')
b2sums=('9ca887fadfc6c8380f15d07e57bc32b2142c0f0262b834a2ab76d931dcbc33e45be467c6670dafc070c4f5c098a9a299a195d0f66369ce7c5855a13017fa5f88'
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
