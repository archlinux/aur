# Maintainer: Skycoder42 <skycoder42.de@gmx.de>
_pkgbase=libcorrect
pkgbase=$_pkgbase-git
pkgname=($pkgbase $_pkgbase-compat-git)
pkgver=r115.f5a28c7
pkgrel=2
pkgdesc="C library for Convolutional codes and Reed-Solomon"
arch=('x86_64' 'aarch64')
url="https://github.com/quiet/libcorrect"
license=('BSD')
makedepends=('git' 'cmake')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("git+$url.git"
        "$_pkgbase.pc")
sha256sums=('SKIP'
            '0f09957ae764e59f61344b48c7ecb5aad3a9a1024e57c21707e62e61f023627b')

pkgver() {
  cd "$_pkgbase"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  # build without shim
  mkdir -p "$_pkgbase/build"
  cd "$_pkgbase/build"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
  cd ../..
  
  # build with shim
  mkdir -p "$_pkgbase/build-shim"
  cd "$_pkgbase/build-shim"

  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
  make shim
}

#check() {
#  cd "$_pkgbase/build"
#  make check
#  cd ../..
#  cd "$_pkgbase/build-shim"
#  make check
#}

package_libcorrect-git() {
  cd "$_pkgbase/build"
  make DESTDIR="$pkgdir" install
  
  cd ..
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  cd ..
  install -D -m644 "$_pkgbase.pc" "$pkgdir/usr/lib/pkgconfig/$_pkgbase.pc"
}

package_libcorrect-compat-git() {
  provides=("$_pkgbase" 'libfec')
  conflicts=("$_pkgbase" 'libfec')
  
  cd "$_pkgbase/build-shim"
  make DESTDIR="$pkgdir" install
  
  cd ..
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
  cd ..
  install -D -m644 "$_pkgbase.pc" "$pkgdir/usr/lib/pkgconfig/$_pkgbase.pc"
}
