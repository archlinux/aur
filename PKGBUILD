# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=lib32-libarchive
_name="${pkgname#lib32-}"
pkgver=3.7.7
pkgrel=2
pkgdesc="Multi-format archive and compression library - 32bit"
arch=(x86_64)
url="https://libarchive.org"
_url=https://github.com/libarchive/libarchive
license=(
  BSD-2-Clause
  BSD-4-Clause-UC
  'Apache-2.0 OR CC0-1.0 OR OpenSSL'
)
depends=(
  $_name=$pkgver
  lib32-acl
  lib32-bzip2
  lib32-glibc
  lib32-libxml2
  lib32-lz4
  lib32-openssl
  lib32-xz
  lib32-zlib
  lib32-zstd
)
makedepends=(
  git
)
provides=(libarchive.so)
source=($_name::git+$_url.git?signed#tag=v$pkgver)
sha256sums=('5f34ae74d1a780a7147f255903a04b475f674ea48252f3a059fb27d67eb083a9')
validpgpkeys=(
  DB2C7CF1B4C265FAEF56E3FC5848A18B8F14184B  # Martin Matuska <martin@matuska.org>
)

_backports=(
  # upstream/patch/3.7
  "v${pkgver}..eddb9fcf93974f1ecca14fcfa4f67992f25bb790"

  # fix CVE-2025-1632 and CVE-2025-25724 (#2532)
  'c9bc934e7e91d302e0feca6e713ccc38d6d01532'
)

_reverts=(
)

prepare() {
  # extract licenses
  # NOTE: some license files are missing: https://github.com/libarchive/libarchive/issues/2385
  sed -n '43,65p' $_name/COPYING > BSD-2-Clause.txt
  sed -n '33,62p' $_name/$_name/archive_read_support_filter_compress.c > BSD-4-Clause-UC.txt

  cd $_name

  local _c _l
  for _c in "${_backports[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git cherry-pick --mainline 1 --no-commit "${_c}"
  done
  for _c in "${_reverts[@]}"; do
    if [[ "${_c}" == *..* ]]; then _l='--reverse'; else _l='--max-count=1'; fi
    git log --oneline "${_l}" "${_c}"
    git revert --mainline 1 --no-commit "${_c}"
  done

  autoreconf -fiv
}

build() {
  local configure_options=(
    --build=i686-pc-linux-gnu
    --disable-bsdcat
    --disable-bsdcpio
    --disable-bsdtar
    --disable-bsdunzip
    --disable-static
    --libdir=/usr/lib32
    --libexecdir=/usr/lib32
    --includedir=/usr/include/${_name}32
    --prefix=/usr
    --program-suffix="-32"
    --without-nettle
  )

  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd $_name
  ./configure "${configure_options[@]}"
  make
}

check() {
  make -k check -C $_name
}

package() {
  make DESTDIR="$pkgdir/" install-libLTLIBRARIES install-pkgconfigDATA -C $_name
  install -vDm 644 ./*.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
