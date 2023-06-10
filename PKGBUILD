# Maintainer: Beini <bane at iki dot fi>
# Contributor: lilydjwg <lilydjwg@gmail.com>

_pkgname=cld2
pkgname=${_pkgname}-git
pkgver=r152.b56fa78
pkgrel=1
epoch=1
pkgdesc='Probabilistically detects over 80 languages in Unicode UTF-8 text, either plain text or HTML/XML'
arch=('x86_64')
url='https://github.com/CLD2Owners/cld2'
license=('Apache')
provides=('cld2')
conflicts=('cld2' 'cld2-hg' 'cld2-svn')
replaces=('cld2-hg' 'cld2-svn')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake')
source=('git+https://github.com/CLD2Owners/cld2.git'
       'CMakeLists.txt')
b2sums=('SKIP'
        '1e5d8282a8a88735cb2114766efbee1747fe3817fcfae48c74366f3094c348c9850fa89bc6f94e4a009b01de8b3256a974d652694206e2e6d691dcef6334a0ee')

prepare() {
  cp "$srcdir/CMakeLists.txt" "$srcdir/$_pkgname/"
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  # -std=c++98 is needed for gcc-6
  # https://github.com/CLD2Owners/cld2/issues/47
  CXXFLAGS="$CXXFLAGS -std=c++98 -Wl,--as-needed" cmake \
    -B build \
    -S "$_pkgname" \
    -DCMAKE_BUILD_TYPE:STRING='None' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCMAKE_INSTALL_LIBDIR:PATH='lib'
  cmake --build build
}

check() {
  cd build
  # Tests from: internal/compile_and_test_all.sh
  echo "this is some english text" | ./compact_lang_det_test_chrome_2
  echo "this is some english text" | ./compact_lang_det_test_chrome_16
  ./cld2_unittest_chrome_2 > /dev/null
  ./cld2_unittest_avoid_chrome_2 > /dev/null
  echo "this is some english text" | ./compact_lang_det_test_full
  ./cld2_unittest_full > /dev/null
  ./cld2_unittest_full_avoid > /dev/null
  ./cld2_dynamic_data_tool --dump cld2_data.bin
  ./cld2_dynamic_data_tool --verify cld2_data.bin
  echo "this is some english text" | ./compact_lang_det_dynamic_test_chrome --data-file cld2_data.bin
  ./cld2_dynamic_unittest --data-file cld2_data.bin > /dev/null
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir/$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
