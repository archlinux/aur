# Maintainer: fuero <fuerob@gmail.com>
_pkgname=bashhub-server
_commit="02931595c5a674bb71306ac4506d50c01252fdfe"
pkgname=${_pkgname}
# renovate: datasource=github-releases depName=nicksherron/bashhub-server
pkgver=0.2.5
pkgrel=2
pkgdesc='a private cloud alternative for bashhub-client with some added features like regex search.'
arch=('x86_64')
_repo_prefix='github.com/nicksherron'
_repo_name="${_pkgname}"
url="https://${_repo_prefix}/${_repo_name}"
source=(
	"${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	${_pkgname}.service
	${_pkgname}.sysusers
	${_pkgname}.tmpfiles
	${_pkgname}.environment
)
license=('Apache')
depends=('glibc')
makedepends=('git' 'go-pie')
conflicts=(${_pkgname})
provides=(${_pkgname})
sha256sums=('ca174ceb9fa3f0e1c6e9256e165c3366bf047d6c4ca080e25bb6854f3956fb08'
            'b27591dddef43b8fa47be5608e1ea8dc87db64adc74c953ee4210d3edbc84310'
            '29509b7609074e4702d1c0cdaf2ce7d52a781723554456b35ae1a44a1fb2632f'
            'a55dd07223e10313102367abc613dd2c20805523f58dd3784d88919e468506a8'
            'cf6edcba4624a403da488b7f3457ca5e742b9013f1cd9da3f225ea675f70c5b7')

backup=("etc/default/${_pkgname}")

build () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build -x -v \
    -trimpath \
	-buildmode=pie \
    -mod=readonly \
    -modcacherw \
	-ldflags "\
		  -linkmode=external \
		  -extldflags '${LDFLAGS}' \
		  -X main.commit=${_commit} \
		  -X main.date=$(date -u +%Y%m%d.%H%M%S) \
		  -X main.version=$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)\
	         " \
	-o "${_repo_name}.bin"
}

check () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export GOPATH="${srcdir}/go"
  export GOBIN="${GOPATH}/bin"
  export PATH="${GOBIN}:${PATH}"

  go test -v ./...
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm 755 "${_repo_name}.bin" "${pkgdir}/usr/bin/${_repo_name}"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done

  install -Dm 644 "${srcdir}/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm 644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm 644 "${srcdir}/${_pkgname}.environment" "${pkgdir}/etc/default/${_pkgname}"
}
