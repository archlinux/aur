# Maintainer: Spider.007 <aur@spider007.net>
pkgname=prysm
pkgver=1.0.0_alpha.8
pkgrel=1
_bazelver=3.0.0
pkgdesc="go implementation of the Ethereum 2.0 blockchain"
arch=('x86_64')
url="https://prysmaticlabs.com/"
license=(GPLv3)
makedepends=(
	# for bazel
	'java-environment=11' 'libarchive' 'zip' 'unzip'
	# for prysm
	go
)
source=(
	https://releases.bazel.build/$_bazelver/release/bazel-$_bazelver-linux-$CARCH # SUCKS

	git+https://github.com/prysmaticlabs/prysm.git#tag=v${pkgver/_/-}
	prysm-validator.service
	prysm-beacon-chain.service
)
noextract=("bazel-$_bazelver-linux-$CARCH")

sha256sums=('3efb903ef885339a271445a9940642df704f97297fbe268f131d4fe36b02ea80'
			'SKIP'
            'SKIP'
            'SKIP')

package() {
	cd "$srcdir/$pkgname"

	# YES THIS SUCKS. Installing bazel-3.0.0 from the repo doesn't work
	# so we must run untrusted java programs to build golang programs..
	chmod +x $srcdir/${source[0]##*/}
	bazel=$srcdir/${source[0]##*/}

	mkdir -p $pkgdir/usr/bin/ $pkgdir/usr/lib/systemd/system
	for target in beacon-chain validator
	do
		$bazel build //$target

		install "$srcdir/$pkgname/bazel-bin/$target/linux_amd64_stripped/$target" "$pkgdir/usr/bin/prysm.$target"
	done

	install -dm755 "$pkgdir/var/lib/prysm/beacon-chain"
	install -Dm644 "$srcdir/prysm-validator.service" "$pkgdir/usr/lib/systemd/system/prysm-validator.service"
	install -Dm644 "$srcdir/prysm-beacon-chain.service" "$pkgdir/usr/lib/systemd/system/prysm-beacon-chain.service"

#	$bazel clean
}
