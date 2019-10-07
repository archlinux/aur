# Maintainer: Luke Street <luke.street@encounterpc.com>

pkgname=detex-git
pkgver=0.1.2alpha2.r7.g0a7d38c
pkgrel=1
pkgdesc="Library for manipulation of texture formats such as BC1/DXT1/S3TC, BC2-BC3, BC4/RGTC1, BC5/RGTC2, BC6 (BPTC_FLOAT), BC7 (BPTC), ETC1 and the ETC2 family, loading of KTX and DDS files"
arch=(x86_64)
url="https://github.com/inequation/detex"
license=('ISC')
depends=()
source=('shared.patch')
sha256sums=('SKIP')

makedepends+=('git')
source+=("${_gitname:=${pkgname%-git}}::${_giturl:-git+$url}")
for integ in $(get_integlist)
do
  typeset -n array="${integ}sums"
  array+=('SKIP')
done
provides+=("$_gitname=$pkgver")
conflicts+=("$_gitname")
pkgver() {
  cd ${_gitname:-$pkgname}
  git describe --long --tags 2>/dev/null | sed 's/[^[:digit:]]*\(.\+\)-\([[:digit:]]\+\)-g\([[:xdigit:]]\{7\}\)/\1.r\2.g\3/;t;q1'
  [ ${PIPESTATUS[0]} -ne 0 ] && \
printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_gitname"
  patch -Np1 -i "$srcdir"/shared.patch
}

build() {
  cd "$_gitname"
  make LIBRARY_CONFIGURATION=SHARED library
}

package() {
  cd "$_gitname"
  make LIBRARY_CONFIGURATION=SHARED \
    HEADER_FILE_INSTALL_DIR="$pkgdir"/usr/include \
    SHARED_LIB_DIR="$pkgdir"/usr/lib \
    install
}

# vim:set ts=2 sw=2 et:
