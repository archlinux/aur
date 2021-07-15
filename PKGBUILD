# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor: Aleksey Barinov

pkgname=beam-wallet-bin
pkgver=6.0.11647.433
pkgrel=1
pkgdesc="Beam Desktop GUI Wallet"
arch=('x86_64')
license=('Apache')
url='https://beam.mw'
source=("$pkgname-$pkgver.tar::https://github.com/BeamMW/beam-ui/releases/download/beam-6.0.11647.4336/Beam-Wallet-$pkgver.tar"
        "$pkgname-$pkgver.tar.asc::https://github.com/BeamMW/beam-ui/releases/download/beam-6.0.11647.4336/Beam-Wallet-$pkgver.tar.asc"
        'beam-wallet.sh')
sha256sums=('ebeac2f165f8ec723cfe1cfc4c3e0a902c3f75f6cfc46ab804938868acd6c3eb'
            'SKIP'
            'eb87b1db8013d2c6159e943d9f2420ce5a1b8b32e8a2a7c991efb717ce67faad')
validpgpkeys=('9FEC539DB8E4EA8B')

prepare() {
	"./BeamWallet-${pkgver}6.AppImage" --appimage-extract &> /dev/null
	cd squashfs-root
	sed -i "/Exec/s/\/usr/\/opt\/$pkgname\/usr/" BeamWallet.desktop
	echo "Path=/opt/$pkgname/" >> BeamWallet.desktop
}

package() {
	install -Dm755 beam-wallet.sh "$pkgdir/usr/bin/beam-wallet"
	cd squashfs-root
	install -Dm644 beam.png -t "$pkgdir/usr/share/icons/hicolor/256x256/apps/"
	install -Dm644 BeamWallet.desktop "$pkgdir/usr/share/applications/beam-wallet.desktop"
	rm beam.png BeamWallet.desktop AppRun
	install -d "$pkgdir/opt/$pkgname/"
	rm -rf usr/share
	cp -a --no-preserve=ownership * "$pkgdir/opt/$pkgname/"
}
