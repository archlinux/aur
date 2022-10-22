# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=network-manager-sstp-gtk4
pkgver=1.3.1
pkgrel=1
pkgdesc="SSTP support for NetworkManager"
arch=('x86_64')
url="https://gitlab.gnome.org/GNOME/network-manager-sstp"
license=('GPL2')
depends=('gtk4' 'gtk3' 'libnma-gtk4' 'libnma' 'libsecret' 'sstp-client')
optdepends=('ppp')
makedepends=('intltool' 'ppp' 'python')
provides=("${pkgname%-gtk4}")
conflicts=("${pkgname%-gtk4}")
source=("https://gitlab.gnome.org/GNOME/network-manager-sstp/-/archive/release-$pkgver/network-manager-sstp-release-$pkgver.tar.bz2")
sha256sums=('20ff1422a8779b5825ea0198e0d4232a27ac9b15f2dcafc04124f26bef7864d6')

build() {
  pppd_version=(`pppd --version 2>&1 | awk '{print $3}'`)
  cd network-manager-sstp-release-$pkgver

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --with-pppd-plugin-dir=/usr/lib/pppd/$pppd_version \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib/NetworkManager \
    --with-libnm-glib=no \
    --enable-more-warnings=yes \
		--with-gtk4=yes
  # libnm-glib disabled due to missing libnm-gtk package
  # set_more_warnings being error by default, which adds -Werror

  make
}

package() {
  cd network-manager-sstp-release-$pkgver

  make DESTDIR="$pkgdir" dbusservicedir=/usr/share/dbus-1/system.d install
}
