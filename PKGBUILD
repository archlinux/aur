# Maintainer: melchips <truphemus dot francois at gmail dot com>
# Contributor: atie H. <atie.at.matrix@gmail.com>
# Contributor: L42y <423300@gmail.com>
# Contributor: gesh <gesh@gesh.uni.cx>

pkgname=sparkleshare-git
_gitname=SparkleShare
pkgver=2.0.1.r115.g69b0736f
pkgrel=1
pkgdesc="An open-source clone of Dropbox, written in C-sharp"
arch=('i686' 'x86_64')
url="http://www.sparkleshare.org/"
license=('LGPL')
depends=('mono' 'gtk-sharp-3' 'intltool'
'webkit2-sharp' 'notify-sharp-3' 'desktop-file-utils' 'webkitgtk-sharp-git'
'soup-sharp' 'dbus-sharp')
makedepends=('git' 'meson' 'ninja')
options=('!libtool')
provides=('sparkleshare')
conflicts=('sparkleshare')
source=("$_gitname"::'git+https://github.com/hbons/SparkleShare.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    # Use the unannotated tag of the last commit
    git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  rm -rf build
  # Delete reference to post-install script (updating icons cache and desktop database)
  sed -i 's/^meson\.add_install_script.*scripts\/post-install\.sh.*$//' meson.build

  meson --prefix='/usr' build
}

build() {
  cd "$srcdir/$_gitname"

  msg2 "Starting ninja..."
  ninja -C build
}

package() {
    cd ${srcdir}/${_gitname}
    DESTDIR="${pkgdir}" MESON_INSTALL_PREFIX="${pkgdir}" ninja -C build install

    install -m755 -d ${pkgdir}/usr/share/sparkleshare/html
    install -m755 -d ${pkgdir}/usr/share/sparkleshare/pixmaps
}
