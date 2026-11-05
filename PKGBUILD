# Maintainer: Mike Boiko <mike@boiko.ca>

pkgname=twg-cli-bin
pkgver=1.4.3
pkgrel=1
pkgdesc='Atlassian Teamwork Graph CLI (baseline-compatible prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://developer.atlassian.com/cloud/twg-cli/'
license=('Apache-2.0')
depends=('glibc')
makedepends=('python')
provides=('twg-cli')
conflicts=('twg' 'twg-cli')
options=('!strip' '!debug')

_bunver=1.4.4

source=(
	'twg-baseline-patcher.py'
	'twg-cli-LICENSE::https://raw.githubusercontent.com/atlassian/twg-cli/main/LICENSE'
)
source_x86_64=("twg-linux-x64-v${pkgver}::https://teamwork-graph.atlassian.com/cli/twg-linux-x64-v${pkgver}" "bun-linux-x64-baseline-v${_bunver}.zip::https://github.com/oven-sh/bun/releases/download/bun-v${_bunver}/bun-linux-x64-baseline.zip")
source_aarch64=("twg-linux-arm64-v${pkgver}::https://teamwork-graph.atlassian.com/cli/twg-linux-arm64-v${pkgver}")

sha256sums=(
	'3f655ca11770a6194f728f8fe52a37efb00c033a83863e0f76975518367f8545'
	'007879788b4d4a258cf924e4177a9f4f808b4aec5c2fd6ac65c09b526c07177f'
)
sha256sums_x86_64=(
	'f86458f43efaa5332bbee90d535643fdf6dc113982e272637bdfff1512f594a1'
	'e0446eb55995772eb9894bebae9a6be368d985a8b9271ee124486f9946eedd76'
)
sha256sums_aarch64=('bac5d8b219df1f2a7ba71f97f1df6cba45e5b2f12b235fdeb973b763126e3e96')

prepare() {
	if [[ "$CARCH" == x86_64 ]]; then
		python "$srcdir/twg-baseline-patcher.py" \
			"$srcdir/twg-linux-x64-v${pkgver}" \
			"$srcdir/bun-linux-x64-baseline-v${_bunver}.zip" \
			"$srcdir/twg-linux-x64-v${pkgver}-baseline"
	fi
}

package() {
	local binary

	if [[ "$CARCH" == x86_64 ]]; then
		binary="twg-linux-x64-v${pkgver}-baseline"
	else
		binary="twg-linux-arm64-v${pkgver}"
	fi

	install -Dm755 "$srcdir/$binary" "$pkgdir/usr/bin/twg"
	install -Dm644 "$srcdir/twg-cli-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
