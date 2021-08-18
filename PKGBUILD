# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='skydive'
pkgver='0.28.0'
pkgrel='1'
pkgdesc='Real-time network topology and protocols analyzer'
arch=('x86_64' 'i686')
url="https://${pkgname}.network"
license=('Apache')
makedepends=('go' 'libpcap' 'libxml2' 'protobuf' 'libvirt' 'npm')
source=("https://github.com/${pkgname}-project/${pkgname}/archive/v${pkgver}.tar.gz"
	"${pkgname}.tmpfiles"
	"${pkgname}.sysusers")
sha256sums=('e68cf9b764f236142bcfb8cb16f65f6667c442b887d96ee5fadd514a86d6a496'
            '5d3b4f628a485363ec47897054b2d4a84ef680b9db93562a58e42971f5597bc3'
            'acbccbc4dace958b4d7eeeb3879e6f80fe798ffb5e7be5375008970f6ee30c34')
options=('!buildflags')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export PATH="${GOPATH}/bin:$PATH"
  mkdir -p "${GOPATH}/src/github.com/${pkgname}-project"
  mv "${srcdir}/${pkgname}-${pkgver}" "${GOPATH}/src/github.com/${pkgname}-project/${pkgname}"
}

build() {
  cd "${GOPATH}/src/github.com/${pkgname}-project/${pkgname}"
  make
}

package() {
  export GOPATH="${srcdir}/gopath"
  export PATH="${GOPATH}/bin:$PATH"
  cd "${GOPATH}"
  install -Dm0755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  cd "${GOPATH}/src/github.com/${pkgname}-project/${pkgname}"
  install -Dm0644 "contrib/systemd/${pkgname}-agent.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-agent.service"
  install -Dm0644 "contrib/systemd/${pkgname}-analyzer.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}-analyzer.service"
  install -Dm0644 "etc/${pkgname}.yml.default" "${pkgdir}/etc/${pkgname}/${pkgname}.yml"
  cd "${srcdir}"
  install -Dm644 "${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm644 "${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
