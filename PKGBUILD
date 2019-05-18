# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfconf
pkgname=${_pkgname}-devel
pkgver=4.13.7
pkgrel=1
pkgdesc="A simple client-server configuration storage and query system"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
depends=('libxfce4util' 'dbus')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig' 'glib-perl'
             'intltool' 'gtk-doc' 'chrpath' 'python') #for gdbus-codegen
optdepends=('xfconf4.12: Legacy xfconf libraries')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=(https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('5deb13fc48a4116f5ebdee5c21d0fd3deb85bec2f69602beb3c3adb4f85e5bde')
install='xfconf.install'

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --with-perl-options=INSTALLDIRS="vendor" \
    --disable-debug \
    --enable-gsettings-backend
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # fix insecure rpath, https://bugs.archlinux.org/task/19980
  find "$pkgdir" -name Xfconf.so -exec chrpath -d {} +
}

