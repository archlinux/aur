pkgname='vault'
pkgdesc='A tool for managing secrets'
pkgver='0.2.0'
pkgrel=2
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64')
makedepends=('godep')
depends=('glibc')
conflicts=("${pkgname}-git")
install='vault.install'
source=("https://github.com/hashicorp/vault/archive/v${pkgver}.tar.gz"
        'vault.service'
		'vault.hcl')
sha512sums=('580c83382d62828202a878dfbee868226dbc70c995878dae5aba81927f05fae41476c25f4617bdfa7ba69582f5139b9de46baa4383081b8ed046991646d23743'
            'a97d10208fd99b29cf532c9b5882fe1bbb3faee1d1d706f95a9c379fef461c65a9f16c8530438920024e69871ebd8c7329e6b65025ad65092950bfb74ce393b3'
            '8c064aa5dcca84822c1fa85e9d0ff520df46f794b2e9c689a9b4f81f74279387b3aebc08b3ca26cf786c2fcf1a330e765bf5a511074c24f87e5346672346ba1c')

prepare () {
	mkdir -p "${pkgname}-${pkgver}/,build"
}

build () {
	cd "${pkgname}-${pkgver}"
	godep go build -x -v -o ,build/vault
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm755 ,build/vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
	for file in README.md CHANGELOG.md ; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
}
