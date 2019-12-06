# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Maintainer: Mansour Behabadi <mansour@oxplot.com>
# Maintainer: Tilman Vatteroth <tilman.vatteroth@udo.edu>

pkgname=upmpdcli
pkgver=1.4.5
pkgrel=2
pkgdesc="A UPnP Media Renderer front-end for the Music Player Daemon (MPD)"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url="http://www.lesbonscomptes.com/upmpdcli/"
license=('GPL2')
depends=('python' 'libmpdclient' 'libupnpp>=0.17.0' 'libmicrohttpd' 'jsoncpp')
makedepends=('python-setuptools' 'libmpdclient' 'libupnpp>=0.17.0' 'libmicrohttpd' 'jsoncpp' 'python-requests' 'recoll' 'python-bottle' 'python-mutagen' 'aspell-en' 'id3lib' 'python-waitress' 'sqlite')
optdepends=('python2: OpenHome Radio Service' 'python-requests: enable search' 'recoll: enable search' 'python-bottle: enable uprcl media server' 'python-mutagen: enable uprcl media server' 'mutagen: enable uprcl media server' 'aspell-en' 'id3lib' 'python-waitress: enable uprcl media server' 'sqlite')
install=upmpdcli.install
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/$pkgname-$pkgver.tar.gz" 'upmpdcli.service')
sha256sums=('af0c13b6ab8720d98451307010c33462e9a3f50178bae82c593fd2dd12e31b0e' '53da5e4e40a1987e3c137270b315f8c0ba9521539c563e75e254f48449ce0ae9' )
backup=('etc/upmpdcli.conf')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 systemd/upmpdcli.service ${pkgdir}/usr/lib/systemd/system/upmpdcli.service
  sed '/\[Service\]/a User=upmpdcli' -i ${pkgdir}/usr/lib/systemd/system/upmpdcli.service
  sed -i '/^After/ s/$/ mpd.service/' ${pkgdir}/usr/lib/systemd/system/upmpdcli.service
  install -Dm644 $srcdir/upmpdcli.service ${pkgdir}/usr/lib/systemd/user/upmpdcli.service
  chmod 644 ${pkgdir}/etc/upmpdcli.conf
}
