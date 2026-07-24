# Maintainer: John O'Donnell <mail@johnodonnell.xyz>
pkgname=gjallarhorn-git
_pkgname=gjallarhorn
pkgver=r66.fad2d11
pkgrel=1
pkgdesc="From-scratch Odin web framework, ORM and template engine, with a nest-style scaffolding CLI"
arch=('x86_64')
url="https://github.com/Lvcky-gg/Gjallarhorn"
license=('MIT')
# The `gjallarhorn` command needs the Odin compiler at runtime: `gjallarhorn run`
# and `gjallarhorn build` exec `odin` directly, and `new` / `generate` scaffold
# projects you compile with it. Odin lives in [extra].
depends=('odin')
makedepends=('git' 'odin')
optdepends=('openssl: TLS support in generated apps (build with -define:GJ_TLS=true)'
            'docker-compose: local Postgres for the ORM')
provides=('gjallarhorn')
conflicts=('gjallarhorn')
# The CLI is a stripped release binary; skip the (empty) debug split.
options=('!debug')
source=("$_pkgname::git+https://github.com/Lvcky-gg/Gjallarhorn.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	# The CLI is a standalone Odin program (cli/). Output to `gjallarhorn.bin` — a
	# plain `-out:gjallarhorn` would collide with the gjallarhorn/ library dir.
	odin build cli -out:gjallarhorn.bin -o:speed
}

package() {
	cd "$srcdir/$_pkgname"

	# The `gjallarhorn` command.
	install -Dm755 gjallarhorn.bin "$pkgdir/usr/bin/gjallarhorn"

	# The framework source, which `gjallarhorn new` vendors into a project. The CLI
	# looks here (see library_source() in cli/main.odin); GJALLARHORN_LIB overrides.
	install -dm755 "$pkgdir/usr/share/gjallarhorn"
	cp -r gjallarhorn "$pkgdir/usr/share/gjallarhorn/gjallarhorn"

	install -Dm644 license.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
