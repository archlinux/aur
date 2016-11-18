# Maintainer: redfish <redfish at galactica dot pw>
# Contributor: Lothar_m <lothar_m at riseup dot net>

pkgname='zeronet-git'
_gitname='ZeroNet'
_gitroot='https://github.com/HelloZeroNet/ZeroNet.git'
pkgver=0.5.0
pkgrel=1
arch=('any')
url="https://zeronet.io/"
depends=('python2>=2.7.10'
                'python2-gevent'
                'python2-msgpack'
                )
optdepends=('tor>=0.2.7.6: anonymity')
makedepends=('git')
license=('GPL2')
pkgdesc="Decentralized websites using Bitcoin crypto and the BitTorrent network."
provides=(zeronet)
conflicts=(zeronet)
source=("git://github.com/HelloZeroNet/ZeroNet.git"
        "zeronet.conf"
        "zeronet.service")
md5sums=('SKIP'
         'c5216860cfc435a4861c55fd3933391c'
         'b7733fe1d55d954f3eb7c04cf9e73e0d')
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
   mkdir -p "$pkgdir/var/lib/zeronet"
   mkdir -p "$pkgdir/var/log/zeronet"

   # There is no setup.py shipped, so brute-force copy
   cp -a "$srcdir/$_gitname/." "$pkgdir/opt/zeronet/"

   install -D -m644 "$srcdir/zeronet.conf" "$pkgdir/etc/zeronet.conf"
   install -D -m644 "$srcdir/zeronet.service" "$pkgdir/usr/lib/systemd/system/zeronet.service"

   # install license
   install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
