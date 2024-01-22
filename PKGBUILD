# Maintainer: BrainDamage

pkgname=mautrix-discord
pkgver=0.6.5
pkgrel=1
pkgdesc="A Matrix-Discord puppeting bridge based on discordgo"
arch=('x86_64' 'aarch64')
license=('GPL3')
makedepends=('go')
depends=('libolm')
url="https://github.com/mautrix/discord"
source=("${pkgname}-${pkgver}::${url}/archive/v${pkgver}.tar.gz" "${pkgname}.service" "${pkgname}.sysusers" "${pkgname}.tmpfiles")
sha256sums=('fd08227805af6f93d6b316f49a6d953bcac82d9d89d7977c92f670a12e7eb695'
            '17e5414d8355b9c7a503d6e166abf41640c6247fb168de94850d1b67c6a0fa33'
            'ebb8d96fd415ec2957a2eddda5fcfa32b9e889bcc7531ad4962afeadc5887852'
            '34d758c0a05da759107aaabc6dbcbe0acc3f3881391412f4f6f355b253641eb9')
backup=("etc/${pkgname}/config.yaml")

_dirname="${pkgname#mautrix-}-${pkgver}"

build() {
	cd "${srcdir}/${_dirname}"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-extldflags \"${LDFLAGS}\"" \
		-o "${pkgname}" .
}

# template start; name=install_bin; version=1;
package() {
	cd "${srcdir}/${_dirname}"
	find . -mindepth 1 -type f -iname "${pkgname}" -executable \
		-exec install -Dvm 755 -t "${pkgdir}/usr/bin" {} +
	find . -maxdepth 1 -iname 'README*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" {} +
	find . -maxdepth 1 -iname 'LICENSE*' \
		-exec install -Dvm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" {} +

	install -Dvm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -Dvm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -Dvm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

	install -Dvm 640 example-config.yaml "${pkgdir}/etc/${pkgname}/config.yaml"
}
