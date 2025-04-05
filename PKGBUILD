# -*- sh -*-

#  Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Comtributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname='ngs-lang-git'
_pkgname="${pkgname/-git}"
pkgver=0.2.17.r0.g10a4a0da
pkgrel=2
epoch=1
pkgdesc='NGS: Next Generation Shell (built from latest git commit)'
arch=('x86_64')
url='https://github.com/ngs-lang/ngs'
license=('GPL-3.0-or-later')
makedepends=(
  'cmake'
  'git'
  'pandoc'
  'peg'
  'uthash'
)
depends=(
  'gc'
  'gcc-libs'
  'glibc'
  'json-c'
  'libffi'
  'pcre'
)
provides=('ngs' "$_pkgname")
conflicts=("${provides[@]}")
source=('git+https://github.com/ngs-lang/ngs.git')
options=('lto')
sha256sums=('SKIP')

pkgver() {
  cd 'ngs'

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  cd 'ngs'

  sed -i 's@VERSION 3\.0@VERSION 3.5@'                   CMakeLists.txt
  sed -i 's@^link_directories@#link_directories@g'       CMakeLists.txt
  sed -i 's@/usr/local/include /opt/homebrew/include@@g' CMakeLists.txt

  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" ..
}

build() {
  cd 'ngs/build'

  # RFC-0023
  # 🔗 https://rfc.archlinux.page/0023-pack-relative-relocs/
  #
  # ld(1) says: “Supported for i386 and x86-64.”
  case "Z${CARCH:-unknown}" in
    'Zx86_64' | 'Zi386' )
      export LDFLAGS="$LDFLAGS -Wl,-z,pack-relative-relocs"
    ;;
    * ) : pass ;;
  esac

  make
}

check() {
  cd 'ngs/build'

  ctest || true
}

package() {
  cd 'ngs/build'

  make install

  install -vDm0644 -t "$pkgdir/usr/share/doc/$pkgname/" \
    ../{CHANGELOG,readme}.md ../one-liners.txt

  cd "$pkgdir"

  rm -vrf usr/share/doc/NGS
}

# vim: ts=2 sw=2 et:
