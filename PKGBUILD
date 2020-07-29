# Maintainer: Jakub Janeczko <jjaneczk@gmail.org>

pkgname=network-manager-sstp-git
pkgver=1.2.6.r70.g735d8ca
pkgrel=1
pkgdesc="SSTP support for NetworkManager"
arch=('x86_64')
url="http://sstp-client.sourceforge.net/#Network_Manager_Plugin"
license=('GPL2')
depends=('gtk3' 'libnma' 'libsecret' 'sstp-client')
optdepends=('ppp')
makedepends=('git' 'intltool' 'ppp' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/enaess/network-manager-sstp")
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  pppd_version=(`pppd --version 2>&1 | awk '{print $3}'`)
  cd "$srcdir/${pkgname%-git}"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pppd-plugin-dir=/usr/lib/pppd/$pppd_version \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --with-libnm-glib=no
  # libnm-glib disabled due to missing libnm-gtk package

  make
}

package() {
  cd "$srcdir/${pkgname%-git}"

  make DESTDIR="$pkgdir" dbusservicedir=/usr/share/dbus-1/system.d install
}
