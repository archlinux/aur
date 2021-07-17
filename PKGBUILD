# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ovirt_exporter'
pkgver='0.9.1'
pkgrel='1'
pkgdesc='Exporter for oVirt engine metrics'
arch=('x86_64' 'i686')
url="https://github.com/czerwonk/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('ac7c4b5e470fcb2ea9c31c3e4098bb4402c492b20264bc3d7943a664c3fb4742'
            'dddb55bc9a696c56814ce4d34f6254469bf215c59629b3225546775f680a13c3'
            'fbe1800ff7dc0ce36292f4abe88141099ae0b8c245903f76a8f41ff2c6a81c0b'
            '2747fabb4e56b808361eb7dd7acf9729ab8973d1ebe2f857dd56f6c71f71e45f')
backup=("etc/conf.d/${pkgname}")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/github.com/czerwonk"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/github.com/czerwonk/${pkgname}"
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/czerwonk/${pkgname}"
  GOOS=linux go build
}

package() {
  pushd "${GOPATH}/src/github.com/czerwonk/${pkgname}"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  popd
  install -Dm644 "${pkgname}" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
