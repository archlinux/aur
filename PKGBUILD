# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ovirt_exporter'
pkgver='0.9.2'
pkgrel='1'
pkgdesc='Exporter for oVirt engine metrics'
arch=('x86_64' 'i686')
_uri='github.com/czerwonk'
url="https://${_uri}/${pkgname}"
license=('MIT')
makedepends=('go')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz"
	"${pkgname}"
	"${pkgname}.service"
	"${pkgname}.sysusers")
sha256sums=('fc0082bfd1e97dc976453550983f32a880792d93fac22db72e1d83992673715b'
            'dddb55bc9a696c56814ce4d34f6254469bf215c59629b3225546775f680a13c3'
            'fbe1800ff7dc0ce36292f4abe88141099ae0b8c245903f76a8f41ff2c6a81c0b'
            '2747fabb4e56b808361eb7dd7acf9729ab8973d1ebe2f857dd56f6c71f71e45f')
backup=("etc/conf.d/${pkgname}")

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  mkdir -p "${GOPATH}/src/${_uri}"
  ln -snf "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/${_uri}/${pkgname}"
}

build() {
  cd "${GOPATH}/src/${_uri}/${pkgname}"
  GOOS=linux go build
}

package() {
  install -Dm755 "${GOPATH}/src/${_uri}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}" "${pkgdir}/etc/conf.d/${pkgname}"
  install -Dm644 "${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
