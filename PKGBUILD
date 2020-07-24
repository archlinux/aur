# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mansour Behabadi <mansour@oxplot.com>
# Contributor: Tilman Vatteroth <tilman.vatteroth@udo.edu>

pkgname=upmpdcli
pkgver=1.4.12
pkgrel=2
pkgdesc="A UPnP Media Renderer front-end for the Music Player Daemon (MPD)"
arch=(i686 x86_64 arm armv7h armv6h aarch64)
url="http://www.lesbonscomptes.com/upmpdcli/"
license=(GPL2)
depends=(python libmpdclient 'libupnpp>=0.17.0' libmicrohttpd jsoncpp)
makedepends=(python-setuptools python-requests recoll python-bottle python-mutagen aspell-en id3lib python-waitress sqlite)
optdepends=(aspell-en id3lib sqlite
            'python-requests: enable search'
            'recoll: enable search'
            'python-bottle: enable uprcl media server'
            'python-mutagen: enable uprcl media server'
            'python-waitress: enable uprcl media server')
install=upmpdcli.install
source=("http://www.lesbonscomptes.com/upmpdcli/downloads/$pkgname-$pkgver.tar.gz"
        "upmpdcli-streamproxy-cpp-fix.patch::https://framagit.org/medoc92/upmpdcli/-/commit/4fd8a07b560dcd4ad5706684d512d33707de3da0.patch"
        'upmpdcli.service')
sha256sums=('bffc78c140ad688987894ea5a1e162e6dcbc7dcae7d2cc322a894f5ea2a2f53b'
            '1004133922fa908b9c8990737bcd363345283649311eac6d3a7262289b5d1778'
            '53da5e4e40a1987e3c137270b315f8c0ba9521539c563e75e254f48449ce0ae9'
            )
backup=('etc/upmpdcli.conf')

prepare() {
  cd "$srcdir/${pkgname}-${pkgver}"
  patch -Np1 -i ../upmpdcli-streamproxy-cpp-fix.patch
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
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
