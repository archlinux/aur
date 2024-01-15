# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='fastgron-git'
_pkgname='fastgron'
pkgver=0.7.7.r6.g5d5998f
pkgrel=1
pkgdesc='High-performance JSON to GRON (greppable, flattened JSON) converter (development version)'
arch=('x86_64' 'aarch64')
url='https://github.com/adamritter/fastgron'
license=('MIT')
depends=('curl' 'gcc-libs' 'glibc')
makedepends=('cmake' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
noextract=("$_pkgname")
sha256sums=('SKIP')
options=('lto')

pkgver() {
  cd "$_pkgname"

  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "${CARCH:-unknown}" in
    'x86_64' | 'i386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  export CFLAGS="${CFLAGS} -DNDEBUG"
  export CXXFLAGS="${CXXFLAGS} -DNDEBUG"

  cmake -B build -S "${_pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
}

build() {
  cmake --build build
}

check() {
  make -C build test
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -vDm0644 "$_pkgname/GRON.md"   "$pkgdir/usr/share/doc/$pkgname/GRON.md"
  install -vDm0644 "$_pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -vDm0644 "$_pkgname/LICENSE"   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# eof
