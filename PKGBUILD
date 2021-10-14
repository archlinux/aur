# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Aleksey Barinov

pkgname=beam-wallet-bin
pkgver=6.1.12023.4694
pkgrel=1
pkgdesc="Beam Desktop GUI Wallet"
arch=('x86_64')
license=('Apache')
url='https://beam.mw'
source=("$pkgname-$pkgver.tar::https://github.com/BeamMW/beam-ui/releases/download/beam-$pkgver/Beam-Wallet-$pkgver.tar"
        "$pkgname-$pkgver.tar.asc::https://github.com/BeamMW/beam-ui/releases/download/beam-$pkgver/linux-Beam-Wallet-$pkgver.tar.asc"
        'beam-wallet.sh')
sha256sums=('eb7a19a2169c23561e8d710e22849dcb4ae6a479b04d82102684c0b3f9dac811'
            'SKIP'
            'eb87b1db8013d2c6159e943d9f2420ce5a1b8b32e8a2a7c991efb717ce67faad')
validpgpkeys=('A6C62C9F55931860AFF83BBB997EAB9F3DF7F375')

PURGE_TARGETS=("opt/$pkgname/"{AppRun,BeamWallet.desktop,beam.png})

prepare() {
	"./Beam-Wallet-$pkgver.AppImage" --appimage-extract &> /dev/null
	cd squashfs-root
	sed -i "/Exec/s|/usr|/opt/$pkgname/usr|" BeamWallet.desktop
	echo "Path=/opt/$pkgname/" >> BeamWallet.desktop
}

package() {
	install -D beam-wallet.sh "$pkgdir/usr/bin/beam-wallet"
	cd squashfs-root
	install -Dm644 beam.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
	install -Dm644 BeamWallet.desktop "$pkgdir/usr/share/applications/beam-wallet.desktop"
	install -d "$pkgdir/opt/$pkgname/"
	rm -rf usr/share
	cp -a --no-preserve=ownership * "$pkgdir/opt/$pkgname/"
}
