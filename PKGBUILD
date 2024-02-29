# Maintainer: fossdd <fossdd@pwned.life>

pkgname=rustlog-git
_pkgname=${pkgname%-git}
pkgver=r176.0f402ea
pkgrel=1
pkgdesc="Twitch logging service inspired by justlog"
url='https://github.com/boring-nick/rustlog'
license=(unknown)
arch=(x86_64)
depends=()
makedepends=(cargo git yarn)
optdepends=("clickhouse: as database backend")
provides=($_pkgname)
conflicts=($_pkgname)
backup=("etc/$_pkgname/config.json")
options=('!lto')
source=("$pkgname::git+$url.git"
	"$pkgname-web::git+https://github.com/boring-nick/justlog.git?branch=frontend-only-new"
	"$_pkgname.service")
sha256sums=('SKIP'
            'SKIP'
            '96a554b27a5dcf2c11f5e01004b654af87bda0a01f1006f45f17e3a8e17a7e27')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $pkgname

	git submodule init
	git config submodule.web.url "$srcdir/$pkgname-web"
	git -c protocol.file.allow=always submodule update

	yarn --cwd web install --ignore-optional

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"

	# Default configuration
	sed -i 's/rustlog/default/g' "$srcdir/$pkgname/config.dist.json" # change to default clickhouse DB
}

build() {
	cd $pkgname

	yarn --cwd web build

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release --all-features
}

package() {
	cd "$pkgname"

	# backend
	install -Dm755 "target/release/$_pkgname" -t "$pkgdir/usr/bin/"

	# config
	# TODO: move file to /etc/$_pkgname.json
	mv "config.dist.json" "config.json"
	install -Dm644 "config.json" -t "$pkgdir/etc/$_pkgname/"

	# docs
	install -Dm644 'README.md' -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'docs/CONFIG.md' -t "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm644 'docs/MIGRATION.md' -t "$pkgdir/usr/share/doc/$pkgname/"

	# systemd integration
	install -Dm644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	mkdir "$pkgdir/usr/lib/sysusers.d/" "$pkgdir/usr/lib/tmpfiles.d/"
	echo "u $_pkgname - '$_pkgname user' / /usr/bin/nologin" > "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	echo "Z /etc/$_pkgname 0755 $_pkgname $_pkgname" > "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
}
