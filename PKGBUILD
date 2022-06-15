# Maintainer:  Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kevin Majewski < kevin.majewski02 AT gmail.com >

pkgname='xdg-desktop-portal-git'
_pkgname="${pkgname%-git}"
pkgver=1.14.1.r33.gfe9c5a1
pkgrel=1
epoch=1
pkgdesc='Desktop integration portals for sandboxed apps'
url="https://github.com/flatpak/${_pkgname}"
arch=('x86_64')
license=('LGPL2.1')
depends=(
  'fuse3'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'json-glib'
  'pipewire'
  'systemd-libs'
)
makedepends=(
  'docbook-xsl'
  'geoclue'
  'git'
  'flatpak'
  'libportal'
  'python'
  'systemd'
  'xmlto'
)
optdepends=(
  'geoclue: for location portal'
)
# checkdepends=(
#   'epiphany'
#   'gedit'
#   'gvfs'
# ) # disable if not used in check()
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("git+https://github.com/flatpak/${_pkgname}")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  # Generate git tag based version. Count only proper (v)#.#* [#=number] tags.
  local _gitversion=$(git describe --long --tags --match '[v0-9][0-9.][0-9.]*' | sed -e 's|^v||' | tr '[:upper:]' '[:lower:]') 

  # Format git-based version for pkgver
  echo "${_gitversion}" | sed \
    -e 's|^\([0-9][0-9.]*\)-\([a-zA-Z]\+\)|\1\2|' \
    -e 's|\([0-9]\+-g\)|r\1|' \
    -e 's|-|.|g'
}

prepare() {
  cd "${_pkgname}"
  NOCONFIGURE=1 ./autogen.sh

  export CFLAGS+=" ${LDFLAGS}"    # otherwise the build ignores LDFLAGS
  ./configure --prefix='/usr' --libexecdir='/usr/lib'
}

build() {
  cd "${_pkgname}"
  make
}

package() {
  depends+=(
    'rtkit'
    'xdg-desktop-portal-impl' 
  )
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
