# Maintainer:
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Det <thatone>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Laurent Carlier <lordheavym@gmail.com>

_pkgname="xf86-input-libinput"
pkgname="$_pkgname-git"
pkgver=1.4.0.r0.g46af622
pkgrel=1
pkgdesc="Generic input driver for the X.Org server based on libinput"
url="http://xorg.freedesktop.org/"
license=('MIT')
arch=('x86_64')

depends=(
  'glibc'
  'libinput'
)
makedepends=(
  'X-ABI-XINPUT_VERSION=24.4'
  'libx11'
  'libxi'
  'xorg-server-devel'
  'xorgproto'
)
conflicts=(
  'xorg-server<1.19.0'
  'X-ABI-XINPUT_VERSION<24'
  'X-ABI-XINPUT_VERSION>=25'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package

  _pkgsrc="$_pkgname-${pkgver%%.r*}"
  _pkgext="tar.xz"
  source+=(
    "$_pkgsrc.$_pkgext"::"https://xorg.freedesktop.org/releases/individual/driver/$_pkgsrc.$pkgext"{,.sig}
  )
  sha256sums+=(
    '3a3d14cd895dc75b59ae2783b888031956a0bac7a1eff16d240dbb9d5df3e398'
    'SKIP'
  )
  validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF') # Peter Hutterer (Who-T) <office@who-t.net>

  _config_cmd="configure"

  pkgver() {
    echo "${pkgver%%.r*}"
  }
else
  # git package
  url="https://gitlab.freedesktop.org/xorg/driver/xf86-input-libinput"

  makedepends+=('git')

  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  _config_cmd="autogen.sh"

  pkgver() (
    set -o pipefail

    cd "$_pkgsrc"
    git describe --long --tags 2>/dev/null \
      | sed -E 's/^xf86-[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g' \
    || printf "r%s.%s" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short=7 HEAD)"
  )
fi

build() {
  local _config_options=(
    --prefix=/usr
    --disable-static
  )

  cd "$_pkgsrc"
  ./"${_config_cmd:?}" "${_config_options[@]}"

  [ -f libtool ] && sed -e 's/ -shared / -Wl,-O1,--as-needed\0/g' -i libtool

  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir:?}" install

  install -Dm644 COPYING "${pkgdir:?}/usr/share/licenses/${pkgname}/LICENSE"
}
