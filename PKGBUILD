# Maintainer: Spider.007 <aur@spider007.net>
pkgname=prysm
pkgver=1.0.0_alpha.19
pkgrel=1
pkgdesc="go implementation of the Ethereum 2.0 blockchain"
arch=('x86_64')
url="https://prysmaticlabs.com/"
license=(GPLv3)
options=('emptydirs')
makedepends=(
	go
)
source=(
	git+https://github.com/prysmaticlabs/prysm.git#tag=v${pkgver/_/-}
	prysm-validator@.service
	prysm-beacon-chain.service
	prysm-slasher.service
	prysm.sysusers
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir/usr/bin/" "$pkgdir/usr/lib/systemd/system" "$pkgdir/var/lib/prysm/validator"

	for target in beacon-chain validator slasher
	do
		cd $target && HOME=/tmp go build -trimpath . && cd ..

		install "$srcdir/$pkgname/$target/$target" "$pkgdir/usr/bin/prysm.$target"
	done

	install -Dm644 "$srcdir/prysm-beacon-chain.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 "$srcdir/prysm-slasher.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm644 "$srcdir/prysm-validator@.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "$srcdir/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"

}
