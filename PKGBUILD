# Maintainer: Jorge Israel Peña <jorge.israel.p@gmail.com>

pkgname=syncplay-git
pkgver=1.6.8.r8.g908c460
pkgrel=1
pkgdesc="synchronize watching movies on mplayer2, vlc, mpv, and mpc-hc on many computers"
arch=('any')
url="http://syncplay.pl/"
license=('Apache')
depends=('python' 'python-twisted')
optdepends=('pyside2: GUI' 'qt5-declarative: GUI' 'python-service-identity: TLS' 'python-certifi: TLS')
makedepends=('git')
provides=('syncplay')
conflicts=('syncplay')
backup=("etc/syncplay/server.conf")
source=("$pkgname"::'git://github.com/Syncplay/syncplay.git'
        syncplay@.service
        server.conf)
sha256sums=('SKIP'
            'bbbf8f9dfc36631b49ba7d0fe3f980066b30a544954680a677e5e8629b7e0a8b'
            'df3c7656024d60c59664c79f4890f7780a2c5b8b537ac61b017e16b3d4420808')

pkgver() {
  cd "$pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir

  # systemd unit and its config file
  install -Dm644 syncplay@.service ${pkgdir}/usr/lib/systemd/system/syncplay@.service
  install -Dm644 server.conf "$pkgdir"/etc/syncplay/server.conf

  cd $pkgname

  # actual program
  make DESTDIR="$pkgdir" install
}
