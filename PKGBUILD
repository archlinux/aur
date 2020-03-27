# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)
# Contributor: Nicolas Leclercq <nicolas.private@gmail.com>
# Contributor: Adam S Levy <adam@aslevy.com>


pkgname='telegraf'
pkgver='1.14.0'
pkgrel='1'
pkgdesc='Plugin-driven server agent for reporting metrics into InfluxDB'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url='http://influxdb.org/'
license=('MIT')
makedepends=('go' 'git')
backup=('etc/telegraf/telegraf.conf')
install="${pkgname}.install"
source=("https://github.com/influxdata/${pkgname}/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        "${pkgname}.install"
        "${pkgname}.service"
        "${pkgname}.sysusers"
        "${pkgname}.tmpfiles")
sha256sums=('8562f3bc3c9130fabc9c4dd68863b776ebbaaa9100d2d5a06b79959902b30a4f'
            'b8494d35b868a256eace5f7baa7caa9d8561ee506aded3c47bd6b2ee031b0745'
            'ef54a27c036f11c44f32a42c81787dd0253f84e77170c2e8f9e268aca8773c33'
            'acf95397a51077b7684e8e4f4db7266c42cf82f24bc969ef2bc112a0f914f4cd'
            '95284d1e92f812c4c301cd1f35692850ae127397e33b910a5af7f54bbeb8986e')

prepare() {
  export GOPATH="${srcdir}"

  mkdir -p "${GOPATH}/src/github.com/influxdata/"
  ln -fsT "${srcdir}/${pkgname}-${pkgver}" \
    "${GOPATH}/src/github.com/influxdata/${pkgname}"
  cd "${GOPATH}/src/github.com/influxdata/${pkgname}"
  go mod download -x
}

build() {
  export GOPATH="${srcdir}"

  cd "${GOPATH}/src/github.com/influxdata/${pkgname}"
  _LDFLAGS="-X main.version=${pkgver} -X main.branch=master -extldflags ${LDFLAGS}"
  go install -v -ldflags="$_LDFLAGS" -gcflags "all=-trimpath=${GOPATH}" -asmflags "all=-trimpath=${GOPATH}" "./..."
  go clean -modcache
}

package() {
  export GOBIN="${srcdir}/bin"

  # binary
  install -D -m755 "${GOBIN}/telegraf" "${pkgdir}/usr/bin/telegraf"

  # configuration files
  install -dD -m755 "${pkgdir}/etc/telegraf/telegraf.d"
  "${GOBIN}/telegraf" -sample-config > "${pkgdir}/etc/telegraf/telegraf.conf"

  # license
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" \
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
