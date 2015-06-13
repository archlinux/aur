# Contributor: Artyom Smirnov <smirnoffjr@gmail.com>
# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>

pkgname="notification-daemon-engine-ubuntu"
pkgver=0.4.0
pkgrel=4
pkgdesc="Ubuntu engine for notification-daemon (from Ubuntu patches)"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.galago-project.org/specs/notification/"
depends=('notification-daemon>=0.4' 'libsexy')
makedepends=('pkgconfig' 'gnome-common' 'autoconf' 'automake' 'libtool' 'intltool')
options=('!libtool' '!emptydirs')
install='notification-daemon-engine-ubuntu.install'
source=("http://www.galago-project.org/files/releases/source/notification-daemon/notification-daemon-${pkgver}.tar.bz2"
        "ubuntu_theme.patch"
	"libnotify.patch"
	"fix_makefile.patch")
md5sums=('e61eff9782551d81045bb53e8a801d58'
         '667a4255630bc9f3cfefcf1ecef56fd0'
	 'febf7bd932394b4131da4f4316bde266'
	 '5e04d7e67628fa4e999ee7105a2c1715')
build() {
  cd ${srcdir}/notification-daemon-${pkgver}
  patch -p1 < ${srcdir}/ubuntu_theme.patch
  patch -p1 < ${srcdir}/libnotify.patch
  patch -p1 < ${srcdir}/fix_makefile.patch
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib/notification-daemon \
              --localstatedir=/var --disable-static
  make
}

package() {
  cd ${srcdir}/notification-daemon-${pkgver}

  install -d -m755 ${pkgdir}/usr/lib/notification-daemon-1.0/engines/
  install -m755 src/themes/ubuntu/.libs/libubuntu.so ${pkgdir}/usr/lib/notification-daemon-1.0/engines/
}
