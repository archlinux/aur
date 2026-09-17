#!/hint/bash -e
#
# Maintainer: Ľubomír 'the-k' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: d'Ronin <daronin@2600.com>
# Contributor: Hexchain Tong <richard0053@gmail.com>
# Contributor: Jack Lloyd <jack@randombit.net>

_commit=409ab8104c13c1b4c474bfddf4279535d614a668
pkgname=botan2
pkgver=2.19.5.r22.g409ab81
pkgrel=1
pkgdesc='Crypto library written in C++ (legacy version)'
arch=(x86_64)
url='https://botan.randombit.net/'
license=(BSD)
depends=(
  glibc
)
makedepends=(
  boost
  git
  python
  python-setuptools
  python-sphinx
)
optdepends=('python: for using botan2.py')
source=("git+https://github.com/randombit/botan.git#commit=${_commit}"
        boost-fixes.patch
)
sha256sums=('4463db93245898513733596f2791486a588186cd3f5c85085084d7b03652a37e'
            'c06c5e6ad6320a63dd3e5276ba4e093a62ef132e5938137f99b0b3c48a73accb')

declare -gA _depends=(
  [bzip2]="libbz2.so"
  [libgcc]="libgcc_s.so"
  [libstdc++]="libstdc++.so"
  [sqlite]="libsqlite3.so"
  [xz]="liblzma.so"
  [zlib]="libz.so"
)
makedepends+=(
  "${!_depends[@]}"
)

pkgver() {
  cd botan

  git describe \
    --abbrev=7 \
    --long \
    --tags |
    sed 's/-/.r/;s/-/./'
}

prepare() {
  cd botan

  patch -p0 -i ../boost-fixes.patch
}

build() {
  cd botan

  ./configure.py \
    --prefix=/usr \
    --with-bzip \
    --with-lzma \
    --with-zlib \
    --with-boost \
    --with-sqlite3 \
    --with-os-feature=getrandom \
    --build-targets=shared,tests
  make
}

check() {
  cd botan

  LD_LIBRARY_PATH="$PWD" ./botan-test
}

package() {
  # shellcheck disable=SC2206
  depends+=(
    ${_depends[@]}
  )

  : "${pkgdir:?}"

  DESTDIR="$pkgdir" make -C botan install
  install -Dm644 botan/license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

: "${arch[@]}"
: "${depends[@]}"
: "${license[@]}"
: "${makedepends[@]}"
: "${optdepends[@]}"
: "${pkgdesc}"
: "${pkgrel}"
: "${pkgver}"
: "${source[@]}"
: "${sha256sums[@]}"
: "${url}"
