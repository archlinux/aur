# Maintainer:
# Contributor: dreieck

# Supported Platforms | Features
# --------------------+--------------
# Haswell       (HSW) | vp8enc
# Bay Trail M   (BYT) | vp8enc
# Broadwell     (BRW) | vp9dec vp9enc
# Braswell      (BSW) | vp8enc vp9dec

# The libva-intel-driver package isn't compiled with support for loading
# this driver.  To use this driver's features with non hybrid codecs,
# recompile libva-intel-driver with the --enable-hybrid-codec
# or install the libva-intel-driver-hybrid package from the AUR

## useful links
# https://01.org/linuxmedia/vaapi
# https://github.com/kcning/intel-hybrid-driver

_pkgname=intel-hybrid-codec-driver
pkgname="$_pkgname-git"
pkgver=2.0.0.r1.gcfb3b718
pkgrel=1
pkgdesc="Libva support for partially hardware accelerated encode and decode on Haswell and newer"
url="https://github.com/kcning/intel-hybrid-driver"
license=('MIT')
arch=('x86_64')

depends=(
  'libva'
  'libcmrt'
)
optdepends=(
  'libva-intel-driver-hybrid: To be able to use the full hw codecs with hybrid codecs'
)
makedepends=(
  'autoconf'
  'automake'
  'git'
)
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("$_pkgname")

install="$_pkgname.install"

_pkgsrc="kcning.intel-hybrid-driver"
source=(
  "$_pkgsrc"::"git+$url.git"
  'gcc10-fix.patch'
  'fix-vadriverinit-1.patch'
  'fix-vadriverinit-2.patch'
)
sha256sums=(
  'SKIP'
  '90c01a1771f90007b001057edd4ada66751e54ccc380b3d87672694ab7ea92cb'
  '5359cfa322403bad1a20dc55de290c5f5c2f8d56afeba9c4a84dfc35cc89ec8b'
  'acb0acf2a83632358ccb3b02a4b74184149312863fa15bab4686df41abb1fd9b'
)

prepare() {
  cd "$_pkgsrc"
  patch -Np1 -F100 --follow-symlinks -i "$srcdir/gcc10-fix.patch"
  patch -Np1 -F100 --follow-symlinks -i "$srcdir/fix-vadriverinit-1.patch"
  patch -Np1 -F100 --follow-symlinks -i "$srcdir/fix-vadriverinit-2.patch"

  autoreconf -v --install
}

pkgver() {
  cd "$_pkgsrc"

  local _ref_ver=2.0.0
  local _ref_hash=edead0c17e2818bc0fee0ea644f85ab81bbe6f7a
  local _revision=$(git rev-list --count --cherry-pick $_ref_hash...HEAD)
  local _commit=$(git rev-parse --short=8 HEAD)

  printf '%s.r%s.g%s' "${_ref_ver:?}" "${_revision:?}" "${_commit:?}"
}

build() {
  cd "$_pkgsrc"

  local _configure_options=(
    --prefix=/usr
    --enable-drm
    --enable-x11
    --enable-wayland
    --disable-static
    --enable-shared
  )

  ./configure "${_configure_options[@]}"
  make
}

package() {
  cd "$_pkgsrc"
  make install DESTDIR="$pkgdir"

  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
