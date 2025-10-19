# Maintainer: Zine Yu <zine.xlws@gmail.com>

pkgname=buck2-bin
pkgver=2025.10.15
pkgrel=1
pkgdesc="Build system, successor to Buck"
arch=('x86_64' 'aarch64')
url="https://github.com/facebook/buck2"
license=('Apache' 'MIT')
depends=('dotslash')
makedepends=('curl' 'jq')
source=('buck2-launcher.sh')
sha256sums=('153e6ebb32d8e014ce7e0b625663f3f5f36dc29e16fc7d6b253190ae739b9ce1')

pkgver() {
	_version=$(curl -sSL https://api.github.com/repos/facebook/buck2/releases | jq -r '.[1].tag_name')
	echo "${_version//-/.}"
}

prepare() {
	_version=$(curl -sSL https://api.github.com/repos/facebook/buck2/releases | jq -r '.[1].tag_name')
	_json_url="https://github.com/facebook/buck2/releases/download/${_version}/buck2"

	echo "Downloading dotslash configuration for version ${_version}..."
	curl -fL -o "buck2-${_version}.dotslash.json" "$_json_url"
}

package() {
	cd "$srcdir"

	_version=$(curl -sSL https://api.github.com/repos/facebook/buck2/releases | jq -r '.[1].tag_name')
	_dotslash_file="buck2-${_version}.dotslash.json"

	if [[ ! -f "$_dotslash_file" ]]; then
		echo "Dotslash configuration file not found: $_dotslash_file"
		exit 1
	fi

	install -dm755 "$pkgdir/usr/lib/$pkgname"

	install -Dm644 "$_dotslash_file" \
		"$pkgdir/usr/lib/$pkgname/buck2.dotslash.json"

	install -Dm755 "buck2-launcher.sh" "$pkgdir/usr/bin/buck2"

	install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
	curl -fL -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE" \
		"https://raw.githubusercontent.com/facebook/buck2/main/LICENSE-APACHE" || {
		echo "Warning: Failed to download Apache license"
	}
	curl -fL -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT" \
		"https://raw.githubusercontent.com/facebook/buck2/main/LICENSE-MIT" || {
		echo "Warning: Failed to download MIT license"
	}

	install -dm755 "$pkgdir/var/cache/$pkgname"
}
