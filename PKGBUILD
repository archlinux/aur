# Maintainer: winlogon <walker84837 at gmail dot com>

pkgname=ktlsp-git
pkgver=r1768.478e33a6
pkgrel=1
pkgdesc="A community-maintained fork of fwcd/kotlin-language-server, providing Kotlin support via LSP"
arch=('any')
url="https://codeberg.org/winlogon/ktlsp.git"
license=('MIT')
depends=('java-runtime=21')
makedepends=('java-environment=21' 'git')
provides=('ktlsp' 'kotlin-language-server')
conflicts=('ktlsp' 'ktlsp-bin' 'kotlin-language-server'
	'kotlin-language-server-bin' 'kotlin-language-server-git')
source=("${pkgname%-git}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${pkgname%-git}"
	# As of 1.4.0-rc1, ktlsp does not yet carry the maintainer's copyright line. It's inserted here
	# until it makes it in the next upstream release. Adding it to the v1.4.0-rc1 tag would require
	# rewriting history.
	grep -q '^Copyright (c).*winlogon' LICENSE.txt ||
		sed -i '/^Copyright (c) 2018 fwcd$/a Copyright (c) 2026 winlogon' \
			LICENSE.txt
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
	./gradlew :server:installDist --no-daemon
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -d "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
	cp -r server/build/install/server "$pkgdir/usr/share/java/$pkgname"
	ln -srf \
		"$pkgdir/usr/share/java/$pkgname/bin/kotlin-language-server" \
		"$pkgdir/usr/bin/kotlin-language-server"
	install -Dm644 LICENSE.txt \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
