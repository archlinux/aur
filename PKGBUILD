# Maintainer: Tomas Sandven <tomas@sandven.email>
pkgname=yang-lsp
pkgver=0.7.2
pkgrel=1
pkgdesc="A language server for YANG"
arch=('any')
url="https://github.com/theia-ide/yang-lsp"
license=('Apache')
depends=("jdk11-openjdk")
source=("$pkgname-$pkgver.tar.gz::https://github.com/theia-ide/yang-lsp/archive/refs/tags/v$pkgver.tar.gz"
        'yang-language-server.template')
sha256sums=('269830b6adb013c7d6deedefc48bda96a87e359156d1a47cab11f4668cb50983'
            '124bc6ff66e9605155f08e73fe096957ed3da1a9c18c6f108d7c60f32ad32b50')

build() {
	export PATH="/usr/lib/jvm/java-11-openjdk/bin:$PATH"

	cd "$pkgname-$pkgver/yang-lsp"
	./gradlew --no-daemon build

	cd "$srcdir"
	tar -x -f "$pkgname-$pkgver/yang-lsp/io.typefox.yang.diagram/build/distributions/yang-language-server-$pkgver.tar"

	local BINPATH="/opt/yang-language-server-$pkgver/bin/yang-language-server"

	cat "yang-language-server.template" \
		| sed "s|YANG_LANGUAGE_SERVER|$BINPATH|g" \
		> "yang-language-server"
}

package() {
	cd "$pkgname-$pkgver"

	mkdir -p "$pkgdir/opt"
	mkdir -p "$pkgdir/usr/local/bin"

	cp -r "$srcdir/yang-language-server-$pkgver" "$pkgdir/opt/"

	install -D -m 755 \
		"$srcdir/yang-language-server" "$pkgdir/usr/local/bin/"
}
