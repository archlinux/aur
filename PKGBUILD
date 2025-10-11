# Maintainer: fuero <fuerob@gmail.com>
pkgname=bashhub-server
# renovate: datasource=github-releases depName=nicksherron/bashhub-server
pkgver=0.2.5
pkgrel=4
pkgdesc='a private cloud alternative for bashhub-client with some added features like regex search.'
arch=('x86_64')
url='https://github.com/nicksherron/bashhub-server'
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	"${pkgname}.service"
	"${pkgname}.sysusers"
	"${pkgname}.tmpfiles"
	"${pkgname}.environment"
)
license=('Apache-2.0')
depends=('glibc')
makedepends=('git' 'go-pie')
conflicts=("${pkgname}")
provides=("${pkgname}")
sha256sums=('ca174ceb9fa3f0e1c6e9256e165c3366bf047d6c4ca080e25bb6854f3956fb08'
            'b27591dddef43b8fa47be5608e1ea8dc87db64adc74c953ee4210d3edbc84310'
            '29509b7609074e4702d1c0cdaf2ce7d52a781723554456b35ae1a44a1fb2632f'
            'a55dd07223e10313102367abc613dd2c20805523f58dd3784d88919e468506a8'
            'cf6edcba4624a403da488b7f3457ca5e742b9013f1cd9da3f225ea675f70c5b7')

backup=("etc/default/${pkgname}")

build () {
  local _x _commit
  _commit=$(bsdcat "${pkgname}-${pkgver}.tar.gz" | git get-tar-commit-id)
  _x=(
    date="$(date -u +%Y%m%d.%H%M%S)"
    version="${pkgver}"
    commit="${_commit:?}"
  )

  export CGO_ENABLED=1
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="${GOFLAGS} -buildmode=pie -trimpath -modcacherw -mod=readonly"
  export GO111MODULE=on

  # Support -debug package
  if [[ " ${OPTIONS[*]} " =~ " debug " ]]
  then
    export GOFLAGS="${GOFLAGS//-trimpath/}"
    export GOPATH="${srcdir}"
  fi

  cd "${pkgname}-${pkgver}"
  mkdir bin

  go build -v \
    -ldflags="${_x[*]/#/-X=main.} -linkmode external" \
    -o bin/ \
    ./...
}

check () {
  cd "${pkgname}-${pkgver}"
  # Test broken on build server
  #go test -short ./...
}

package () {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "bin/${pkgname}" -t "${pkgdir}/usr/bin"

  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done

  install -Dm 644 "${srcdir}/${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/${pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 "${srcdir}/${pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm 644 "${srcdir}/${pkgname}.environment" "${pkgdir}/etc/default/${pkgname}"
}
