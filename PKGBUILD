# Maintainer: Nicolas Quiénot < niQo at aur >
# Contributor: Alan Orth <alan.orth@gmail.com>

pkgname=dmapd
pkgver=0.0.72
pkgrel=1
pkgdesc="Serve DAAP (iTunes) and DPAP (iPhoto) shares from Linux"
arch=('i686' 'x86_64')
url="http://www.flyn.org/projects/dmapd/"
license=('GPL')
depends=('libdmapsharing>=2.9.21' 'graphicsmagick' 'libexif' 'vips>=7.36' 'gst-plugins-base-libs')
makedepends=()
optdepends=('gst-plugins-ugly: Extra media codecs')
options=('!libtool')
backup=('etc/dmapd.conf')
source=("http://www.flyn.org/projects/$pkgname/$pkgname-$pkgver.tar.gz")
install=dmapd.install
md5sums=('0fe290d1bf003296b1ed9dfcc0108d6f')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install

  # fix username in default config
  sed -i 's/User=dmapd/User=daemon/' distro/dmapd.conf

  # create cache directories
  install -d ${pkgdir}/var/cache/dmapd || return 1
  install -d ${pkgdir}/var/cache/dmapd/DAAP || return 1
  install -d ${pkgdir}/var/cache/dmapd/DPAP || return 1

  # copy distribution files
  install -D -m 0644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" || return 1
  install -D -m 0644 distro/dmapd.conf ${pkgdir}/etc/dmapd.conf || return 1
  install -D -m 0755 distro/dmapd.service ${pkgdir}/usr/lib/systemd/system/dmapd.service || return 1
}

