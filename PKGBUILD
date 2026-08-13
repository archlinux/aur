# Maintainer: 30p87 <aur@30p87.de>

pkgname='piped-proxy-git'
_componentname="${pkgname%'-git'}"
_componentnameshort="${_componentname#'piped-'}"
pkgver=r556.f48bbdd
pkgrel=1
pkgdesc='A proxy for Piped written in Rust, meant to superseed http3-ytproxy'
arch=('x86_64')
url='https://github.com/TeamPiped/piped-proxy'
license=('AGPL-3.0')
groups=('piped-git')
makedepends=('git' 'cargo')
options=('!lto')
source=("git+${url}"
		'config.env'
		'nginx.conf'
		'sysusers.conf'
		'systemd.service'
		'systemd-restart.service'
		'systemd-restart.timer')
sha256sums=('SKIP'
            '770849963cdb08afbd105257a31705f0ed2f672ab0db505a3e1e92ea6b5703e1'
            '901b0498701f09476fd41b1601eb6ef4e5933ddf131308c1dcda4c7afcbb99b5'
            'eb122e1cf5149be5e89a2ebfb158f29f305427cb8b2061d6728c53ad1d1b89d4'
            'c344a5c826e047808511f17a789bb7dd4252a7a2bde7c16a14c87d47a2fd0501'
            'cebf88d702e304ff5b154002a6896b55b03c94ac4b3f0fe531beee84c9b7e884'
            '3d0431299afffa91a242a49b4fe0ce868b027312fb6a5d6ef170d40405cce9f9')

pkgver() {
	cd piped-proxy
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd piped-proxy
	sed -i 's|use std::{env, io};|use std::{env, io, fs, os::unix::fs::PermissionsExt};|' src/main.rs
	sed -i 's|server.run().await|if utils::get_env_bool("UDS") { fs::set_permissions(env::var("BIND_UNIX").unwrap_or_else(\|_\| "./socket/actix.sock".to_string()), fs::Permissions::from_mode(0o660)).unwrap(); }\n    server.run().await|' src/main.rs
}

build() {
	cd piped-proxy
	cargo build --release
}

package() {
	install -Dm644 "${srcdir}/config.env" "${pkgdir}/etc/webapps/piped/${_componentnameshort}.env"

	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${_componentname}.conf"
	install -Dm644 "${srcdir}/systemd.service" "${pkgdir}/usr/lib/systemd/system/${_componentname}.service"
	install -Dm644 "${srcdir}/systemd-restart.service" "${pkgdir}/usr/lib/systemd/system/${_componentname}-restart.service"
	install -Dm644 "${srcdir}/systemd-restart.timer" "${pkgdir}/usr/lib/systemd/system/${_componentname}-restart.timer"

	install -Dm644 "${srcdir}/piped-proxy/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/nginx.conf" "${pkgdir}/usr/share/doc/piped/${_componentnameshort}/nginx.conf"

	install -Dm755 "${srcdir}/piped-proxy/target/release/piped-proxy" "${pkgdir}/usr/bin/piped-proxy"
}
