# Maintainer: Spider.007 <aur@spider007.net>
# Maintainer: chengxuncc <chengxuncc@gmail.com>

pkgname=prysm
pkgver=4.0.3
pkgrel=1
pkgdesc="Prysm is an Ethereum proof-of-stake client written in Go."
arch=('x86_64' 'arm64')
url="https://prysmaticlabs.com/"
license=(GPLv3)
source=(
	prysm-beacon-chain.service
	prysm-client-stats.service
	prysm-validator.service
)

sha256sums=('fc52438b1319fb1e61c85c6d96abce83009c3898e517051f140093944b45f2e3'
            'cc19fe37cd80972e3a214f5de577b315996e428c8e93cb362c5beb8204d8a173'
            '143147f19424a17147d342d1ac4006d8a154dbbb9e4b5a2f8e594d43e90bd305')

downloadBinary() {
	binary=$1
	prysmArch=${arch/x86_64/amd64}
	prysmArch=${prysmArch/aarch64/arm64}
	file="$binary-v${pkgver}-linux-$prysmArch"
	echo "https://prysmaticlabs.com/releases/$file"
	curl -f -L "https://prysmaticlabs.com/releases/$file" -o "$file"
	echo "https://prysmaticlabs.com/releases/$file.sha256"
	curl -f -L "https://prysmaticlabs.com/releases/$file.sha256" -o "$file.sha256"
	sha256sum -c "$file.sha256" || (echo "Failed to verify Prysm $binary binary" && exit 1)
	mv "$file" "$binary"
	chmod +x "$binary"
}

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/usr/bin/"

	for target in beacon-chain validator client-stats
	do
		downloadBinary $target
		install "$target" "$pkgdir/usr/bin/prysm-$target"
	done

	install -Dm644 "prysm-beacon-chain.service" -t "$pkgdir/usr/lib/systemd/user"
	install -Dm644 "prysm-validator.service" -t "$pkgdir/usr/lib/systemd/user"
	install -Dm644 "prysm-client-stats.service" -t "$pkgdir/usr/lib/systemd/user"
}
