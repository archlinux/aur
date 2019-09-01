# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=skycoin-bin
pkgname1=skycoin
projectname=skycoin
pkgdesc="Skycoin Cryptocurrency Wallet; binary release"
pkgoption1="gui-standalone-linux-x64"
pkgoption2="gui-standalone-linux-arm"
pkgver='0.0.0'
pkggopath="github.com/$projectname/$pkgname1"
pkgrel=1
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=()
sha256sums=('BINARY RELEASE POSSIBLY COMPROMISED ; DISABLING UNTIL FURTHER NOTICE')
#t.me/Skycoin for inquiries

#detect architecture & adjust source & checksums accordingly
#case "$CARCH" in
#	arm*) _pkgarch="$pkgoption2"
#		sha256sums+=('aa2b0441f8fae3880179b1fac12466c058ded1326abbe9388e9d2141035437d1')
#		;;
#  aarch64*) _pkgarch="$pkgoption2"
#    sha256sums+=('aa2b0441f8fae3880179b1fac12466c058ded1326abbe9388e9d2141035437d1')
#    ;;
#	x86_64) _pkgarch="$pkgoption1"
#		sha256sums+=('e06678954e5d45a3b4bbf3dd7e928a454a70887fccccadb4f21d4652e3a6a2ca')
#		;;
#esac

#source+=("https://downloads.skycoin.net/wallet/$pkgname1-$pkgver-$_pkgarch.tar.gz")

build() {
  msg 2 'creating launcher scripts skycoin-wallet & skycoin-wallet-nohup'
  mkdir -p $srcdir/$pkgname1-scripts
  cd $srcdir/$pkgname1-scripts
  echo -e '#!/bin/bash \n #launch skycoin wallet \n export GOBIN=/usr/lib/skycoin/go/bin \n export GOPATH=GOBIN=/usr/lib/skycoin/go \n skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static/ -launch-browser=true -enable-all-api-sets=true -enable-gui=true -rpc-interface=false -log-level=debug' > $pkgname1-wallet
  chmod +x $pkgname1-wallet
  echo -e '#!/bin/bash \n #launch skycoin wallet with nohup \n export GOBIN=/usr/lib/skycoin/go/bin \n export GOPATH=GOBIN=/usr/lib/skycoin/go \n nohup skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static -launch-browser=true -enable-all-api-sets=true -enable-gui=true -log-level=debug > /dev/null 2>&1 &echo "skycoin wallet has started"' > $pkgname1-wallet-nohup
  chmod +x $pkgname1-wallet-nohup
}

package() {
msg2 'installing files'
install -Dm755 $srcdir/$pkgname1-$pkgver-$_pkgarch/$pkgname1 $pkgdir/usr/lib/$projectname/go/bin/$pkgname1
mkdir -p $pkgdir/usr/bin
ln -rTsf $pkgdir/usr/lib/$projectname/go/bin/$pkgname1 $pkgdir/usr/bin/$pkgname1
chmod 755 $pkgdir/usr/bin/$pkgname1
cp -r $srcdir/$pkgname1-$pkgver-$_pkgarch $pkgdir/usr/lib/$projectname/$pkgname1
skycoinscripts=$( ls $srcdir/$pkgname1-scripts )
for i in $skycoinscripts; do
cp $srcdir/$pkgname1-scripts/$i $pkgdir/usr/bin/$i
done
}
