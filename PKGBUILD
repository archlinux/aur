# Maintainer: redfish <redfish at galactica dot pw>
# Contributor: Lothar_m <lothar_m at riseup dot net>

pkgname='zeronet-git'
_gitname='ZeroNet'
_gitroot='https://github.com/HelloZeroNet/ZeroNet.git'
pkgver=0.3.5.r26.g5b821c4
pkgrel=1
arch=('any')
url="https://zeronet.io/"
depends=('python2>=2.7.10'
                'python2-gevent'
                'python2-msgpack'
                )
makedepends=('git')
license=('GPL2')
pkgdesc="Decentralized websites using Bitcoin crypto and the BitTorrent network."
provides=(zeronet)
conflicts=(zeronet)
source=("git://github.com/HelloZeroNet/ZeroNet.git"
        "zeronet.conf"
        "zeronet.service")
md5sums=('SKIP'
         '1c2281156533c912e407cf64f6a57e96'
         '35a1d8325701eb000a4c3a28b7499096')
install="zeronet.install"
backup=("etc/zeronet.conf")
options=(!strip) # attempt to strip binaries fromA dependent libs fial

pkgver() {
  cd "$srcdir/$_gitname"

  # Most recent unannotated tag reachable from last commit without 'v' prefix
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
        cd ${srcdir}
        msg "Connecting to GIT server...."

        if [ -d "$_gitname" ] ; then
                cd "$_gitname" && git pull origin master
                msg "The local files are updated."
        else
                git clone ${_gitroot}
        fi
        msg "GIT checkout done or server timeout"
}

package() {
   cd "$srcdir/$_gitname"

   mkdir -p "$pkgdir/opt/zeronet"

   # zeronet.py expects log directory to exist
   mkdir -p "$pkgdir/opt/zeronet/log"

   # There is no setup.py shipped, so brute-force copy
   cp -a "$srcdir/$_gitname/." "$pkgdir/opt/zeronet/"

   install -D -m644 "$srcdir/zeronet.conf" "$pkgdir/etc/zeronet.conf"
   install -D -m644 "$srcdir/zeronet.service" "$pkgdir/usr/lib/systemd/system/zeronet.service"

   # install license
   install -D -m644 "$srcdir/$_gitname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}