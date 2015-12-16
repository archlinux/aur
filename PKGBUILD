pkgname='vault'
pkgdesc='A tool for managing secrets'
pkgver='0.4.0'
pkgrel='2'
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64')
makedepends=('godep' 'go')
depends=('glibc' 'libcap')
conflicts=("${pkgname}-git")
install='vault.install'
source=("https://github.com/hashicorp/vault/archive/v${pkgver}.tar.gz"
        'vault.service'
		'vault.hcl')
sha512sums=('b4433e5a37ce696622caeef18b8b508daac1f8c0a58ddd23804b80d36e4ef99764b4ac9360b64384bf26a74b61e6f9dcd82887aa4f62db8682f28556676e6593'
            'a97d10208fd99b29cf532c9b5882fe1bbb3faee1d1d706f95a9c379fef461c65a9f16c8530438920024e69871ebd8c7329e6b65025ad65092950bfb74ce393b3'
            '8c064aa5dcca84822c1fa85e9d0ff520df46f794b2e9c689a9b4f81f74279387b3aebc08b3ca26cf786c2fcf1a330e765bf5a511074c24f87e5346672346ba1c')

_srcpath='src/github.com/hashicorp/vault'
prepare () {
	if [[ ! -r ${_srcpath} ]] ; then
		mkdir -p "$(dirname "${_srcpath}")"
		ln -s "$(pwd)/${pkgname}-${pkgver}" "${_srcpath}"
	fi
}

build () {
	export GOPATH="${srcdir}:$(pwd)"
	cd "${_srcpath}"
	go generate ./...
	godep go build -v -x -o "${srcdir}/vault"
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${srcdir}/vault" "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
	for file in README.md CHANGELOG.md ; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
}
