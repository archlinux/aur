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
pkgver=2.0.0.r6.gb0c7970d
pkgrel=1
pkgdesc="Libva support for partially hardware accelerated encode and decode on Haswell and newer"
url="https://github.com/kcning/intel-hybrid-driver"
license=('MIT')
arch=('x86_64')

depends=(
  'libva'
  'libcmrt' # AUR
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
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
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
