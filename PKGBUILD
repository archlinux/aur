pkgname='vault'
pkgdesc='A tool for managing secrets'
pkgver='0.9.0'
pkgrel='1'
url='https://vaultproject.io/'
license=('MPL')
arch=('i686' 'x86_64')
makedepends=('gox' 'go')
depends=('glibc')
conflicts=("${pkgname}-git")
install='vault.install'
backup=('etc/vault.hcl')
source=("https://github.com/hashicorp/vault/archive/v${pkgver}.tar.gz"
        'vault.service'
        'vault.hcl')
sha512sums=('c5755bd8a696764af2375ac51b955759ece36796e6c138e6fc3e8abd487c10ac41c8927501234e0cdfcd448021254b2f09097d8e00a6278b44f971d8b8442da6'
            '5dfa4775e2dc43bb3db8090a0ffa436d2c83245d7777476ef3f3c0f0b1799114b34c02dbb3780ab0ec889fa7e40057c0934884c1d092ec42cda5d3407162672e'
            '46106cc76151eef2dd5e4b2caa6a96aae4d6ce1ecbf977dcc8667a3f6c829cbea95133622adafcb15cdfaa066ecc94c73c983e7613ee2f6573694981569729fe')

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
	go generate $(go list ./... | grep -v vendor)
	gox -verbose -osarch="$(go env GOOS)/$(go env GOARCH)" -output=_build/vault .
}

package () {
	cd "${pkgname}-${pkgver}"
	install -Dm755 _build/vault "${pkgdir}/usr/bin/vault"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/vault.hcl" "${pkgdir}/etc/vault.hcl"
	install -Dm644 "${srcdir}/vault.service" \
		"${pkgdir}/usr/lib/systemd/system/vault.service"
	for file in README.md CHANGELOG.md ; do
		install -Dm644 "${file}" "${pkgdir}/usr/share/doc/${pkgname}/${file}"
	done
}
