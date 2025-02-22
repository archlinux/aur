# Maintainer: 30p87 <30p87@30p87.de>

pkgname=iocaine-git
pkgver=r78.9af7e4a
pkgrel=1
pkgdesc='The deadliest poison known to AI'
arch=('any')
url='https://iocaine.madhouse-project.org/any'
license=('MIT')
makedepends=('cargo')
optdepends=('nginx: when using nginx as reverse proxy'
			'caddy: when using caddy as reverse proxy')
source=('git+https://git.30p87.de/30p87/iocaine.git'
		'nginx_filter.conf'
		'nginx_component.conf'
		'sysusers.conf'
		'tmpfiles.conf'
		'systemd.service.patch')
sha256sums=('SKIP'
            '008464028dc45c0ced3d8649ca36e016181e638548508a6ecf17ee7ce8195bd2'
            '7c4aedcaaa00b6e297d5a7057cfba0c827c69a2552535f1c68fe3dc29b007dd0'
            'd98c03791baff0fbd59261de5f0e38e592e3a4f2014d3dbf135567771ccf8193'
            '7761fab52173f5f0cfeb8678bcbf9e4c297fcb6282acb13c604b6cba4f760f9b'
            'e9bd15719d958299e3cc5be57a4c46644e417d6a86c9fcef55cb48102f082262')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "${pkgname%-git}"
	patch -p1 -i "${srcdir}/systemd.service.patch"
}

build() {
	cd "${pkgname%-git}"
	cargo build -r
}

package() {
	cd "${pkgname%-git}"
	# Binary
	install -Dm755 "target/release/iocaine" "${pkgdir}/usr/bin/iocaine"

	# Docs/Example configs
	install -Dm644 "data/etc/config.toml" "${pkgdir}/usr/share/doc/${pkgname}/config.toml"
	install -Dm644 "${srcdir}/nginx_filter.conf" "${pkgdir}/usr/share/doc/${pkgname}/nginx/iocaine_filter.conf"
	install -Dm644 "${srcdir}/nginx_component.conf" "${pkgdir}/usr/share/doc/${pkgname}/nginx/iocaine.component"

	# Systemd/Arch integration
	install -Dm644 "data/iocaine.service" "${pkgdir}/usr/lib/systemd/system/iocaine.service"
	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/iocaine.conf"
	install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/iocaine.conf"

	# License
	install -Dm755 "LICENSES/MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
