# Maintainer: Ferdinand Bachmann <theferdi265@gmail.com>
# Contributor: Maxime Gauduin <alucryd@gmail.com>
# Contributor: Gordin <gordin@koeln.ccc.de>

pkgname=wit-git
pkgver=3.05a.r10.fc1c0b8
pkgrel=2
pkgdesc='Wiimms ISO Tools (git version)'
arch=(x86_64)
url=https://wit.wiimm.de
license=(GPL2)
depends=(
  bzip2
  fuse2
  glibc
  libncursesw.so
  zlib
  openssl
)
makedepends=(
  clang
  git
)
optdepends=(
  'bash: Update titles lists'
  'wget: Update titles lists'
)
conflicts=(wit)
provides=(wit)
install=wit.install
source=(
  git+https://github.com/Wiimm/wiimms-iso-tools.git
  wit-makefile.patch
  wit-no-exec-stack.patch
  wit-titles.patch
  wit-makefile-version.patch
)
b2sums=('SKIP'
        '07ef47d202fd8465eb7cec3901dadf2429a71ce9ca66ea77a635ede9be6c1597ec3ea910e69c8a7478d372fc07eb93b6c3406f5f0bacacd0b3e4f73bd7ecbb46'
        'a9e615aac8ebafcf98079160f3e2140e1389e42baf7896a2fd845133e47ebcea9199eef847b84732d4dc4fec6107f45e96fb4ab3d4acf5421c88e02f3564eb62'
        '4e241a0c37fd2a082d4285d3685833e3805e35db829961183df02bb426d5679b62f8985f59604512b2615002faa28a9d8947ca9c6fc86a025bee5ab7bbf1bcf7'
        'd412e4aaa485a0288f567aac67f4abf7ec4d9bcbe8f4d9b0f580e629727468b60dd98dbba13b1cb2492722cc6f1822751c82317de1fcf2fcbf5dd515ed888334')

prepare() {
  cd wiimms-iso-tools

  patch -Np1 -i ../wit-makefile.patch
  patch -Np1 -i ../wit-no-exec-stack.patch
  patch -Np1 -i ../wit-titles.patch
  patch -Np1 -i ../wit-makefile-version.patch
}

pkgver() {
    cd wiimms-iso-tools/project
    printf "%s.r%s.%s" "$(make version)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

_not() {
  if "$@"; then
    return 1
  else
    return 0
  fi
}

_array_contains() {
  local haystack="$1[@]"
  local needle="$2"

  for value in "${!haystack}"; do
    if [[ "$value" == "$needle" ]]; then
      return 0
    fi
  done

  return 1
}

_incompatible_flags=( "-fvar-tracking-assignments" )
_clang_remove_incompatible_flags() {
  local newflags=
  for flag in $CFLAGS; do
    if _not _array_contains _incompatible_flags "$flag"; then
      newflags="$newflags $flag"
    fi
  done

  export CFLAGS="$newflags"
}

build() {
  _clang_remove_incompatible_flags
  make INSTALL_PATH="${pkgdir}/usr" CC=clang -C wiimms-iso-tools/project tools
  make INSTALL_PATH="${pkgdir}/usr" CC=clang -C wiimms-iso-tools/project doc
}

package() {
  _clang_remove_incompatible_flags
  make INSTALL_PATH="${pkgdir}/usr" CC=clang -C wiimms-iso-tools/project install
  install -Dm 644 wiimms-iso-tools/project/doc/*.txt -t "${pkgdir}"/usr/share/doc/wit/
}

# vim: ts=2 sw=2 et:
