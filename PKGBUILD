# Maintainer:
# Contributor: Vincent Grande <shoober420@gmail.com>
# Contributor: Alexander Baldeck <alexander@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_gitname="libxcb"
_pkgname="lib32-$_gitname"
pkgname="$_pkgname-git"
pkgver=1.17.0.r4.gdaf2c53
pkgrel=1
pkgdesc="X11 client-side library (32-bit)"
url="https://gitlab.freedesktop.org/xorg/lib/libxcb"
license=('X11')
arch=('x86_64')

depends=(
  'lib32-libxau'
  'lib32-libxdmcp'
  'libxcb-git'
)
makedepends=(
  'autoconf'
  'gcc-multilib'
  'git'
  'libxslt'
  'pkgconfig'
  'python'
  'xorg-util-macros'
  'xorgproto'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_gitname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags \
    | sed -E 's/^[^0-9]+//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"

  export CC="gcc -m32 -mstackrealign"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  local _config_options=(
    --prefix='/usr'
    --enable-xinput
    --enable-xkb
    --disable-static
    --libdir=/usr/lib32
    --with-doxygen=no
  )

  ./autogen.sh "${_config_options[@]}"
  make
}

package() {
  cd "$_pkgsrc"
  make DESTDIR="${pkgdir:?}" install
  rm -rf "${pkgdir}"/usr/{include,share}

  mkdir -p "$pkgdir/usr/share/licenses"
  ln -s libxcb "$pkgdir/usr/share/licenses/lib32-libxcb"
}
