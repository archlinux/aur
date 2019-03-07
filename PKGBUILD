# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Adam S Levy <adam@aslevy.com>


pkgname='telegraf'
pkgver='1.10.0'
pkgrel='1'
pkgdesc='Plugin-driven server agent for reporting metrics into InfluxDB'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://influxdb.org/'
license=('MIT')
makedepends=('go' 'git')
backup=('etc/telegraf/telegraf.conf')
install="${pkgname}.install"
source=("https://github.com/influxdata/${pkgname}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('83eedb62c771ef3854f79fcd6fbb7ecb4ddabf7b1aa45bcc11e9c6a1f1553ac6'
            'b8494d35b868a256eace5f7baa7caa9d8561ee506aded3c47bd6b2ee031b0745'
            'ef54a27c036f11c44f32a42c81787dd0253f84e77170c2e8f9e268aca8773c33'
            'acf95397a51077b7684e8e4f4db7266c42cf82f24bc969ef2bc112a0f914f4cd'
            '95284d1e92f812c4c301cd1f35692850ae127397e33b910a5af7f54bbeb8986e')

prepare() {
  export GOPATH="${srcdir}/gopath"
  export GOBIN="${GOPATH}/bin"
  export GOFLAGS="-gcflags=all=-trimpath=${PWD} -asmflags=all=-trimpath=${PWD} -ldflags=-extldflags=-zrelro -ldflags=-extldflags=-znow"
  export TELEGRAFPATH="${GOPATH}/src/github.com/influxdata/${pkgname}"
  mkdir -p ${TELEGRAFPATH%/*}
  ln -fsT ${srcdir}/${pkgname}-${pkgver} \
    ${GOPATH}/src/github.com/influxdata/${pkgname}
  cd ${TELEGRAFPATH}
  go get -v -u github.com/golang/dep/cmd/dep
  ${GOBIN}/dep ensure -v -vendor-only
}

build() {
  cd ${TELEGRAFPATH}
  go install -ldflags="-X main.version=${pkgver}" ./...
}

package() {
  # binary
  install -D -m755 "${GOBIN}/telegraf" "${pkgdir}/usr/bin/telegraf"

  # configuration files
  install -dD -m755 "${pkgdir}/etc/telegraf/telegraf.d"
  ${GOBIN}/telegraf -sample-config > "${pkgdir}/etc/telegraf/telegraf.conf"

  # license
  install -Dm644 "${TELEGRAFPATH}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # service
  install -D -m644 "${srcdir}/${pkgname}.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"

  # systemd user and home directory
  install -D -m644 "${srcdir}/${pkgname}.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -D -m644 "${srcdir}/${pkgname}.tmpfiles" \
    "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
