# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfconf
pkgname=${_pkgname}-devel
pkgver=4.13.7
pkgrel=3
pkgdesc="A simple client-server configuration storage and query system"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4util' 'dbus')
makedepends=('perl-extutils-depends' 'perl-extutils-pkgconfig' 'glib-perl'
             'intltool' 'gtk-doc' 'chrpath' 'python') #for gdbus-codegen
#optdepends=('xfconf4.12: Legacy xfconf libraries')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
       'xfconf-warn.sh'
       'xfconf-warn.hook')
sha256sums=('5deb13fc48a4116f5ebdee5c21d0fd3deb85bec2f69602beb3c3adb4f85e5bde'
            'dffa297eb6ef0fbe56c37b7396186cb85e1dd6249d28e2fc0b8fc5254926bcb7'
            '0cfbfecb042dabe5a6e80ac96ce863db12e0c38a7cedb66e2bfbe9a5463469a7')
#install='xfconf.install'

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
  find "$pkgdir" -name Xfconf.so -exec chrpath -d {}  \;

  install -Dm755 "${srcdir}"/xfconf-warn.sh "${pkgdir}"/usr/bin/xfconf-warn

  install -Dm644 "${srcdir}"/xfconf-warn.hook "${pkgdir}"/usr/share/libalpm/hooks/xfconf-warn.hook
}

