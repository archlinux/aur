# Maintainer: 30p87 <30p87@30p87.de>
pkgname='piped-proxy-git'
pkgver=r306.79f27fb
pkgrel=1
pkgdesc='A proxy for Piped written in Rust, meant to superseed http3-ytproxy'
arch=('x86_64')
url='https://github.com/TeamPiped/piped-proxy'
license=('AGPL-3.0')
groups=('piped-git')
makedepends=('git' 'cargo')
options=('!lto')
source=('git+https://github.com/TeamPiped/piped-proxy.git'
		'systemd.service'
		'sysusers.conf')
sha256sums=('SKIP'
            'c80505c894cef5d364bd79722487a68a836858ed6a79fb82326a2eb787edde77'
            'f04ddc4d9bf5a114e302fec532e7874c7d3c9d58e81103f17649a0d0228bb096')

pkgver() {
	cd piped-proxy
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd piped-proxy
	sed -i 's|use std::{env, io};|use std::{env, io, fs, os::unix::fs::PermissionsExt};|' src/main.rs
	sed -i 's|server.run().await|if utils::get_env_bool("UDS") { fs::set_permissions(env::var("BIND_UNIX").unwrap_or_else(\|_\| "./socket/actix.sock".to_string()), fs::Permissions::from_mode(0o777)).unwrap(); }\n    server.run().await|' src/main.rs
}

build() {
	cd piped-proxy
	cargo build --release
}

package() {
	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/piped-proxy.conf"
	install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/piped-proxy.service"

	install -Dm644 "${srcdir}/piped-proxy/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm755 "${srcdir}/piped-proxy/target/release/piped-proxy" "${pkgdir}/usr/bin/piped-proxy"

#chown -R root:root "${pkgdir}${dest}"
#chmod -R u+rw,g+r,o+r "${pkgdir}${dest}"
#find "${pkgdir}${dest}" -type d -exec chmod u+x,g+x,o+x {} \;
}
