# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=garlic-git
_pkgname=garlic
pkgver=r167.adb4b1f
pkgrel=1
pkgdesc="The world's fastest APK (android)/Java open source decompiler/ELF analyzer, written in C"
arch=('x86_64')
url="https://github.com/neocanable/garlic"
license=('Apache-2.0')
makedepends=('cmake' 'git')
depends=('glibc')
source=("${pkgname}::git+https://github.com/neocanable/garlic.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # upstream disables -Wformat while Arch's makepkg.conf sets
  # -Wformat-security -Werror=format-security; gcc errors on the
  # ignored option, so neutralize the -Werror form.
  export CFLAGS="${CFLAGS} -Wno-error=format-security"
  cmake -B build -S "$srcdir/${pkgname}" -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  install -Dm755 build/${_pkgname} "$pkgdir/usr/bin/${_pkgname}-decompiler"
}
