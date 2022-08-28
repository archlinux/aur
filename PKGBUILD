# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Dmitriy Morozov <archlinux@foxcub.org>

pkgname=avida
pkgver=2.14.0
pkgrel=2
pkgdesc="A software platform to study evolution of digital organisms"
arch=('i686' 'x86_64')
url="https://github.com/devosoft/avida"
license=('GPL3' 'custom')
depends=('gcc-libs' 'ncurses')
makedepends=('cmake' 'git')
source=("avida-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
"apto::git+https://github.com/dmbryson/apto.git"
"documentation::git+https://github.com/devosoft/avida.wiki.git"
'avida.patch'
'apto.patch'
        )
sha256sums=('65f141a0835d251f6d51dc6c949d34fd1db799512c805516caa3cac68fc73062'
            'SKIP'
            'SKIP'
            'ee332d5ee62b88be57592d5fb512c086284b3ebc93c57bb71c6d1751932bae1f'
            '76789e7fccce71edf676bbb3c5a7724c3cf2abf18ebf3a747dbe6b43cc7ad0c8')

prepare(){
    cd "${srcdir}"
    cd avida-$pkgver
    patch --strip=1 < ../${pkgname}.patch
    # Fix depreciation -mno-fused-madd
    # sed -i 's|-mno-fused-madd|-std=c89|g' avida-core/CMakeLists.txt
    cd ../apto
    patch --strip=1 < ../apto.patch
    cd ..
    cp -rf apto/* avida-$pkgver/libs/apto
    rm -rf avida-$pkgver/libs/pdcurses
    cp -rf documentation/* avida-$pkgver/documentation
}

build() {
  cd "$srcdir"
  test -d out && rm -rf out
  mkdir out
  cd out
  # disable unit tests for apto
  # console interface ON
  cmake ../avida-$pkgver -DCMAKE_INSTALL_PREFIX=/usr  \
    -DAPTO_UNIT_TESTS=OFF  \
    -DAVD_UNIT_TESTS=OFF \
    -DAVD_GUI_NCURSES=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd $srcdir/out
  make install DESTDIR="$pkgdir"

  # Install documentation and Apto license
  cd "$srcdir/avida-$pkgver"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r documentation/* "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 libs/apto/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_APTO"

  install -d ${pkgdir}/usr/bin
  mv ${pkgdir}/usr/work/{avida,avida-viewer} ${pkgdir}/usr/bin
  mv ${pkgdir}/usr/work ${pkgdir}/usr/lib/${pkgname}
}
