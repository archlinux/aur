pkgname=website-stalker
pkgver=0.27.0
pkgrel=1
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv6h' 'armv7h' 'riscv64')
url="https://github.com/EdJoPaTo/${pkgname}"
license=('LGPL-2.1-or-later')
depends=('gcc-libs')
optdepends=('git: git commit support')
makedepends=('cargo')
provides=("${pkgname}")
options=('!lto')

source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('c5f831d32206b945eb497bff1bc277092ff617f199b9346c0a20a689720c747e')

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	cargo build --release --frozen
}

check() {
	cd "$pkgname-$pkgver"
	cargo run --release --frozen -- --help
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 target/release/$pkgname -t "${pkgdir}/usr/bin/"
	install -Dm644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "target/completions/${pkgname}.bash" -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 "target/completions/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm644 "target/completions/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions/"

	for man in target/manpages/*; do
		install -Dm644 "$man" -t "${pkgdir}/usr/share/man/man1/"
	done

	install -Dm644 "systemd/system/service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "systemd/system/timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
	install -Dm644 "systemd/system/sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm644 "systemd/system/tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dm644 "systemd/user/service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
	install -Dm644 "systemd/user/timer" "${pkgdir}/usr/lib/systemd/user/${pkgname}.timer"
}
