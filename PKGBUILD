# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Steve Skydev <steve@skycoin.net>
pkgname=skycoin
projectname=skycoin
pkgdesc="Skycoin Cryptocurrency Wallet"
pkgoption1="gui-standalone-linux-x64"
pkgoption2="gui-standalone-linux-arm"
pkgver='0.25.1'
pkggopath="github.com/$projectname/$pkgname"
pkgrel=2
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=()
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')

#detect architecture & adjust source & checksums accordingly
case "$CARCH" in
	arm*) _pkgarch="$pkgoption2"
		sha256sums+=('e1a4a92e05aaa3c04d860650934f2f578e051ab65a77fdd326574b6d8b397d2a')
		;;
  aarch64*) _pkgarch="$pkgoption2"
    sha256sums+=('e1a4a92e05aaa3c04d860650934f2f578e051ab65a77fdd326574b6d8b397d2a')
    ;;
	x86_64) _pkgarch="$pkgoption1"
		sha256sums+=('831133fb15dd2affe8b9b6363a9cf586d20c90c01f9bd92cb479f8e0724ebb12')
		;;
esac

source+=("https://downloads.skycoin.net/wallet/$pkgname-$pkgver-$_pkgarch.tar.gz")

build() {
  msg 2 'creating launcher scripts skycoin-wallet & skycoin-wallet-nohup'
  mkdir -p $srcdir/$pkgname-scripts
  cd $srcdir/$pkgname-scripts
  echo -e '#!/bin/bash \n #launch skycoin wallet \n export GOBIN=/usr/lib/skycoin/go/bin \n export GOPATH=GOBIN=/usr/lib/skycoin/go \n skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static/ -launch-browser=true -enable-all-api-sets=true -enable-gui=true -rpc-interface=false -log-level=debug' > $pkgname-wallet
  chmod +x $pkgname-wallet
  echo -e '#!/bin/bash \n #launch skycoin wallet with nohup \n export GOBIN=/usr/lib/skycoin/go/bin \n export GOPATH=GOBIN=/usr/lib/skycoin/go \n nohup skycoin -gui-dir=/usr/lib/skycoin/skycoin/src/gui/static -launch-browser=true -enable-all-api-sets=true -enable-gui=true -log-level=debug > /dev/null 2>&1 &echo "skycoin wallet has started"' > $pkgname-wallet-nohup
  chmod +x $pkgname-wallet-nohup
}

package() {
msg2 'installing files'
install -Dm755 $srcdir/$pkgname-$pkgver-$_pkgarch/$pkgname $pkgdir/usr/lib/$projectname/go/bin/$pkgname
mkdir -p $pkgdir/usr/bin
ln -rTsf $pkgdir/usr/lib/$projectname/go/bin/$pkgname $pkgdir/usr/bin/$pkgname
chmod 755 $pkgdir/usr/bin/$pkgname
cp -r $srcdir/$pkgname-$pkgver-$_pkgarch $pkgdir/usr/lib/$projectname/$pkgname
skycoinscripts=$( ls $srcdir/$pkgname-scripts )
for i in $skycoinscripts; do
cp $srcdir/$pkgname-scripts/$i $pkgdir/usr/bin/$i
done
}
