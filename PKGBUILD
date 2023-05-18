pkgname=website-stalker
pkgver=0.20.0
pkgrel=3
pkgdesc="Track changes on websites via git"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname}"
license=('LGPL2.1')
depends=('gcc-libs' 'zlib')
optdepends=('git: git commit support')
makedepends=('cargo')
provides=("${pkgname}")

source=($pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz)
sha256sums=('cd613c830afd8f6f574b2884c9d9f68bcd57fb4340f7518df596533b85259b9f')

build() {
	cd $pkgname-$pkgver
	RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 target/release/$pkgname -t "${pkgdir}/usr/bin/"
	install -Dm644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "target/completions/${pkgname}.bash" -t "${pkgdir}/usr/share/bash-completion/completions/"
	install -Dm644 "target/completions/${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -Dm644 "target/completions/_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions/"

	install -Dm644 "systemd/system/service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dm644 "systemd/system/timer" "${pkgdir}/usr/lib/systemd/system/${pkgname}.timer"
	install -Dm644 "systemd/system/sysuser" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dm644 "systemd/system/tmpfile" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dm644 "systemd/user/service" "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
	install -Dm644 "systemd/user/timer" "${pkgdir}/usr/lib/systemd/user/${pkgname}.timer"
}
