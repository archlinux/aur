# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mansour Behabadi <mansour@oxplot.com>
# Contributor: Tilman Vatteroth <tilman.vatteroth@udo.edu>

pkgname=upmpdcli
pkgver=1.5.17
pkgrel=2
pkgdesc="A UPnP Media Renderer front-end for the Music Player Daemon (MPD)"
arch=(i686 x86_64 arm armv7h armv6h aarch64)
url="https://www.lesbonscomptes.com/upmpdcli/"
license=(GPL2)
depends=(python libmpdclient libupnpp libmicrohttpd jsoncpp)
makedepends=(python-setuptools python-requests python-bottle python-mutagen aspell-en id3lib python-waitress sqlite)
optdepends=(aspell-en id3lib sqlite
            'python-requests: enable search'
            'python-bottle: enable uprcl media server'
            'python-mutagen: enable uprcl media server'
            'python-waitress: enable uprcl media server'
            'recoll: enable uprcl media server')
install=upmpdcli.install
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/$pkgname-$pkgver.tar.gz"
        'upmpdcli.service')
sha256sums=('a60b508d20064783f40ac8d2d260b92bd0b2367c6a0ca67c69019f3890bc642d'
            '53da5e4e40a1987e3c137270b315f8c0ba9521539c563e75e254f48449ce0ae9')
backup=('etc/upmpdcli.conf')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --sysconfdir=/etc --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 systemd/upmpdcli.service "${pkgdir}"/usr/lib/systemd/system/upmpdcli.service
  sed '/\[Service\]/a User=upmpdcli' -i ${pkgdir}/usr/lib/systemd/system/upmpdcli.service
  sed -i '/^After/ s/$/ mpd.service/' ${pkgdir}/usr/lib/systemd/system/upmpdcli.service
  install -Dm644 "${srcdir}"/upmpdcli.service "${pkgdir}"/usr/lib/systemd/user/upmpdcli.service
  chmod 644 "${pkgdir}"/etc/upmpdcli.conf
}
