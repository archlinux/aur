# Maintainer: redfish <redfish at galactica dot pw>
# Contributor: Lothar_m <lothar_m at riseup dot net>

pkgname='zeronet-git'
_gitname='ZeroNet'
_gitroot='https://github.com/HelloZeroNet/ZeroNet.git'
pkgver=0.6.5
pkgrel=1
arch=('any')
url="https://zeronet.io/"
depends=('python2' 'python2-gevent' 'python2-msgpack')
optdepends=('tor: anonymity')
makedepends=('git')
license=('GPL2')
pkgdesc="Decentralized websites using Bitcoin crypto and the BitTorrent network."
provides=(zeronet)
conflicts=(zeronet)
source=("git+https://github.com/HelloZeroNet/ZeroNet.git"
        "zeronet.conf"
        "zeronet.service")
install="zeronet.install"
backup=("etc/zeronet.conf")
options=(!strip) # attempt to strip binaries fromA dependent libs fial

pkgver() {
  cd "$srcdir/$_gitname"

  # Extract version and revision from src/Config.py and append commit
  echo -n $(grep -oP '(?<=self.version = ").+(?=")' src/Config.py).r$(grep -oP '(?<=self.rev = )\w+$' src/Config.py).g$(git rev-parse --short HEAD)
}

package() {
   cd "$srcdir/$_gitname"

   mkdir -p "$pkgdir/opt/zeronet"

   # There is no setup.py shipped, so brute-force copy
   cp -a "$srcdir/$_gitname/." "$pkgdir/opt/zeronet/"

   install -D -m644 "$srcdir/zeronet.conf" "$pkgdir/etc/zeronet.conf"
   install -D -m644 "$srcdir/zeronet.service" "$pkgdir/usr/lib/systemd/system/zeronet.service"

   # install license
   install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha256sums=('SKIP'
            'ea735e82dbb10a2c1fda7abfeb2f38c2429044d8254f9e2396c50cecb6f778f8'
            '22dfda6233d0477a63247ae3ebb2ccd0b8a181f1628bd2969a9f979f0b9e7ca8')
