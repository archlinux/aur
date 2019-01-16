# Maintainer:  Frederic Bezies <fredbezies at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>
# Contributor: Stein Krauz <steinkrauz@yahoo.com>
# Contributor: Jan Jezek <honzin.jezek@gmail.com>
# Contributor: Skunnyk <skunnyk@archlinux.fr>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>

_pkgname=squeeze
pkgname=${_pkgname}-git
epoch=1
pkgver=0.4.90.r592.g993cdd6
pkgrel=1
pkgdesc="Archive manager for the Xfce Desktop Environment (git checkout)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
makedepends=('git' 'xfce4-dev-tools' 'gtk-doc' 'intltool')
depends=('gtk2' 'libxfce4util' 'dbus-glib')
optdepends=('lzop: Compress/Decompress LZOP archives'
            'xz: Compress/Decompress XZ archives')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%.r*}")
options=('!libtool')
source=("${_pkgname}::git://git.xfce.org/apps/squeeze")
sha256sums=('SKIP')

pkgver(){
  cd "${_pkgname}"
  _p=$( git describe --long --tags | sed -r "s:^${_pkgname}.::;s/^v//;s/([^-]*-g)/r\1/;s/-/./g" )
  _maj=$( grep -m 1 squeeze_version_major configure.in.in | sed 's:.*\[\([0-9]*\)\].*:\1:' )
  _min=$( grep -m 1 squeeze_version_minor configure.in.in | sed 's:.*\[\([0-9]*\)\].*:\1:' )
  _mic=$( grep -m 1 squeeze_version_micro configure.in.in | sed 's:.*\[\([0-9]*\)\].*:\1:' )
  echo "${_maj}.${_min}.${_mic}${_p/*\.r/.r}"
}

prepare() {
  cd "${_pkgname}"
  # Doesn't seem like anything really uses xfconf
  sed -i '/XDT_CHECK_PACKAGE(\[XFCONF\]/d' configure.in.in
  sed -i '/$(XFCONF_LIBS)/d' src/Makefile.am squeeze-cli/Makefile.am
  
  [ ! -d m4 ] && mkdir m4
}
  

build(){
  cd "${_pkgname}"

  mv configure.in.in configure.ac.in
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --bindir=/usr/bin \
    --libdir=/usr/lib \
    --disable-debug

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR=$pkgdir install
}

