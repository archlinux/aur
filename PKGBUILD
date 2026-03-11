# Maintainer: 30p87 <30p87@30p87.de>

pkgname=iocaine
pkgver=3.2.1
pkgrel=1
pkgdesc='The deadliest poison known to AI'
arch=('any')
url='https://iocaine.madhouse-project.org/'
license=('MIT')
makedepends=('cargo' 'just')
optdepends=('nginx: when using nginx as reverse proxy'
			'caddy: when using caddy as reverse proxy')
backup=('etc/iocaine/config.kdl')
conflicts=('iocaine-git')
options=('!lto')
source=("git+https://git.madhouse-project.org/iocaine/iocaine.git#tag=iocaine-${pkgver}"
		'nginx_filter.conf'
		'nginx_component.conf'
		'sysusers.conf'
		'tmpfiles.conf'
		'systemd.service.patch')
sha256sums=('3f5b5383f9a8e918fb4e22217d1712e46a402de0b9eb62ab4b8cbcb540e7c3c5'
            '008464028dc45c0ced3d8649ca36e016181e638548508a6ecf17ee7ce8195bd2'
            '3ba1d429be28b8291861aca9b91564ab4db4f83aa7d955ed102d090259d46b5b'
            'd98c03791baff0fbd59261de5f0e38e592e3a4f2014d3dbf135567771ccf8193'
            '7761fab52173f5f0cfeb8678bcbf9e4c297fcb6282acb13c604b6cba4f760f9b'
            'db27e8edfb7180611333ad260713bfaa9d104366c7231bf45db8e5a466b621dc')

prepare() {
	cd "${pkgname}"
	patch -p1 -i "${srcdir}/systemd.service.patch"
}

build() {
	cd "${pkgname}"
	just update assets
	cargo build -r
}

package() {
	cd "${pkgname}"
	# Binary
	install -Dm755 "target/release/iocaine" "${pkgdir}/usr/bin/iocaine"

	# Dirs
	install -dm755 "${pkgdir}/usr/share/webapps/iocaine"

	# Docs/Example configs
	install -Dm644 "data/defaults/config.kdl" "${pkgdir}/etc/iocaine/config.kdl"
	install -Dm644 "${srcdir}/nginx_filter.conf" "${pkgdir}/usr/share/doc/${pkgname}/nginx/iocaine_filter.conf"
	install -Dm644 "${srcdir}/nginx_component.conf" "${pkgdir}/usr/share/doc/${pkgname}/nginx/iocaine.component"

	# Systemd/Arch integration
	install -Dm644 "data/iocaine.service" "${pkgdir}/usr/lib/systemd/system/iocaine.service"
	install -Dm644 "${srcdir}/sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/iocaine.conf"
	install -Dm644 "${srcdir}/tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/iocaine.conf"

	# License
	install -Dm755 "LICENSES/MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
