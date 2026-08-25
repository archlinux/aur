# Maintainer: winlogon <walker84837 at gmail dot com>

pkgname=ktlsp-bin
_tag=v1.4.0-rc1
pkgver=1.4.0rc1
pkgrel=1
pkgdesc="A community-maintained fork of fwcd/kotlin-language-server, providing Kotlin support via LSP"
arch=('any')
url="https://codeberg.org/winlogon/ktlsp"
license=('MIT')
depends=('java-runtime=21')
provides=('ktlsp' 'kotlin-language-server')
conflicts=('ktlsp' 'kotlin-language-server' 'kotlin-language-server-bin'
	'kotlin-language-server-git')
source=("${pkgname}-${_tag}-server.zip::${url}/releases/download/${_tag}/server.zip"
	"LICENSE.txt::${url}/raw/tag/${_tag}/LICENSE.txt")
sha256sums=('27d33f2879d12076174741488721896098e8494f5d906f99ef1c85d6159d42b7'
	'1690b72b5a2beb330c98c0715929bf789cb8d91670c29ff2e4abcdae84329136')

prepare() {
	# As of 1.4.0-rc1, ktlsp does not yet carry the maintainer's copyright line. It's inserted here
	# until it makes it in the next upstream release. Adding it to the v1.4.0-rc1 tag would require
	# rewriting history.
	grep -q '^Copyright (c).*winlogon' "$srcdir/LICENSE.txt" ||
		sed -i '/^Copyright (c) 2018 fwcd$/a Copyright (c) 2026 winlogon' \
			"$srcdir/LICENSE.txt"
}

package() {
	install -d "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
	cp -r "$srcdir/server" "$pkgdir/usr/share/java/$pkgname"
	ln -srf \
		"$pkgdir/usr/share/java/$pkgname/bin/kotlin-language-server" \
		"$pkgdir/usr/bin/kotlin-language-server"
	install -Dm644 "$srcdir/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
