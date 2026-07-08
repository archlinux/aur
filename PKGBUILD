# Maintainer:
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Det <thatone>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

_pkgname="xf86-input-libinput"
pkgname="$_pkgname-git"
pkgver=1.5.0.r8.gac86267
pkgrel=1
pkgdesc="Generic input driver for the X.Org server based on libinput"
url="https://gitlab.freedesktop.org/xorg/driver/xf86-input-libinput"
license=('MIT')
arch=('x86_64')

depends=(
  'glibc'
  'libinput'
)
makedepends=(
  'X-ABI-XINPUT_VERSION=24.4'
  'git'
  'libx11'
  'libxi'
  'xorg-server-devel'
  'xorgproto'
)

provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  'xorg-server<1.19.0'
  'X-ABI-XINPUT_VERSION<24'
  'X-ABI-XINPUT_VERSION>=25'
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() (
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^xf86-[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
)

build() {
  local _config_options=(
    --prefix=/usr
    --disable-static
  )

  cd "$_pkgsrc"
  ./autogen.sh "${_config_options[@]}"

  [ -f libtool ] && sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool

  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
