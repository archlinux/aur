# Contributor: Tom Nguyen <tom81094@gmail.com>
# Contributor: lyoko

_pkgbase='networkmanager-ssh'
pkgname="${_pkgbase}-git"
pkgver=r270.d7996e7
pkgrel=4
pkgdesc="OpenSSH VPN tunneling support for NetworkManager - git version, gtk4 port"
arch=('x86_64')
_repourl='https://github.com/NetworkManager/NetworkManager-ssh'
_repobranch='lr/gtk-4.0'
url="${_repourl}/tree/${_repobranch}"
license=('GPL2')
depends=(
  'at-spi2-core'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'graphene'
  'gtk3'      # still needed by auth_dialog; might become superfluous later
  'gtk4'
  'harfbuzz'
  'libnm'
  'libnma'    # still required by some components; might become superfluous later
  'libnma-gtk4'
  'libsecret'
  'networkmanager'
  'pango'
  'zlib'
)
makedepends=(
  'git'
  'intltool'
)
optdepends=(
  'nm-connection-editor: config GUI for GNOME'
)
provides=("${_pkgbase}")
conflicts=("${_pkgbase}")
source=("${_pkgbase}::git+${_repourl}.git#branch=${_repobranch}")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgbase}"
  echo 'executing autoreconf...'
  autoreconf -fvi
  echo 'autoreconf done.'
  echo
  echo 'executing configure...'
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --disable-static \
    --disable-dependency-tracking \
    --enable-more-warnings=no \
    --with-gtk4 \
    --without-libnm-glib
  echo 'configure done.'
}

build() {
  cd "${_pkgbase}"
  make
}

package() {
  depends+=('openssh')
  cd "${_pkgbase}"
  make DESTDIR="$pkgdir/" INSTALL="install -p" CP="cp -p" install
}
