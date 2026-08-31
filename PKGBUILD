# Maintainer: Mike Boiko <mike@boiko.ca>

pkgname=twg-cli-bin
pkgver=1.2.7
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

_bunver=1.3.14

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
	'40d2d11e6a805449e5d230df31d42442b67506d8b0882524385a4e1b1ee33de8'
	'a063908ae08b7852ca10939bbdc6ceed3ddabce8fb9402dce83d65d73b36e6c7'
)
sha256sums_aarch64=('0dc52105a66f8c3b0a0e52c8cc196eb33d24b4776cc57a69cf78b2b4740052ec')

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
