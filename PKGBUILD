# Maintainer: forvkusa <forvkusa+aur at csie dot ntu dot edu dot tw>

pkgname=hackmd-cli
pkgver=2.5.0
pkgrel=1
pkgdesc='The HackMD Command Line Tool'
arch=('any')
url='https://github.com/hackmdio/hackmd-cli'
license=('MIT')
depends=('nodejs>=24')
makedepends=('pnpm')

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
	'21b32e3bc1bf2ed839454f0cf14472da7284c91783422c27b62ac5963b4b29fe'
)

prepare() {
	cd "$pkgname-$pkgver"
	pnpm install --frozen-lockfile --ignore-scripts
}

build() {
	cd "$pkgname-$pkgver"
	local build_home="$srcdir/build-home"

	mkdir -p "$build_home"
	pnpm run build
	HOME="$build_home" pnpm exec oclif manifest
}

check() {
	cd "$pkgname-$pkgver"
	local test_home="$srcdir/test-home"

	mkdir -p "$test_home"
	HOME="$test_home" pnpm run test:unit
}

package() {
	cd "$pkgname-$pkgver"
	local appdir="$pkgdir/usr/lib/node_modules/@hackmd/$pkgname"

	CI=true pnpm prune --prod --ignore-scripts

	install -d "$appdir/bin" "$pkgdir/usr/bin"
	cp -a lib node_modules "$appdir/"
	install -Dm755 bin/run "$appdir/bin/run"
	install -Dm644 package.json "$appdir/package.json"
	install -Dm644 oclif.manifest.json "$appdir/oclif.manifest.json"
	ln -s "../lib/node_modules/@hackmd/$pkgname/bin/run" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

	HOME="$srcdir/test-home" "$pkgdir/usr/bin/$pkgname" --version | grep -F "@hackmd/hackmd-cli/$pkgver "
}
