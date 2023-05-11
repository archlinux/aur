# Maintainer: fuero <fuerob@gmail.com>
_pkgname=bashhub-server
pkgname=${_pkgname}-git
pkgver=0.2.5.r13.c49226d
pkgrel=2
pkgdesc='a private cloud alternative for bashhub-client with some added features like regex search.'
arch=('x86_64')
_repo_prefix='github.com/nicksherron'
_repo_name="${_pkgname}"
url="https://${_repo_prefix}/${_repo_name}"
source=(
	"${_repo_name}::git+https://${_repo_prefix}/${_repo_name}"
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
sha256sums=(
  'SKIP'
  'b27591dddef43b8fa47be5608e1ea8dc87db64adc74c953ee4210d3edbc84310'
  '29509b7609074e4702d1c0cdaf2ce7d52a781723554456b35ae1a44a1fb2632f'
  'a55dd07223e10313102367abc613dd2c20805523f58dd3784d88919e468506a8'
  'cf6edcba4624a403da488b7f3457ca5e742b9013f1cd9da3f225ea675f70c5b7'
)

backup=("etc/default/${_pkgname}")

pkgver() {
  cd "${srcdir}/${_repo_name}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

prepare () {
  mkdir -p "${srcdir}/src/${_repo_prefix}"
  ln -snf "${srcdir}/${_repo_name}" "${srcdir}/src/${_repo_prefix}/${_repo_name}"
}

clean() {
  # Clean up symlink
  rm -f "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  rm -f "${_repo_name}.bin"
}

build () {
  cd "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  export GOPATH="${srcdir}/go"
  export GOBIN="${GOPATH}/bin"
  export PATH="${GOBIN}:${PATH}"
  go build -x -v \
	-buildmode=pie \
	-pkgdir=$(mktemp -d -p $(pwd)) \
	-ldflags "\
		  -linkmode=external \
		  -extldflags '${LDFLAGS}' \
		  -X main.commit=$(git rev-parse --short HEAD) \
		  -X main.date=$(date -u +%Y%m%d.%H%M%S) \
		  -X main.version=$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)\
	         " \
	-o "${_repo_name}.bin"
}

check () {
  cd "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  export GOPATH="${srcdir}/go"
  export GOBIN="${GOPATH}/bin"
  export PATH="${GOBIN}:${PATH}"

  go test -v ./...
}

package () {
  cd "${srcdir}/src/${_repo_prefix}/${_repo_name}"
  install -Dm 755 "${srcdir}/src/${_repo_prefix}/${_repo_name}/${_repo_name}.bin" "${pkgdir}/usr/bin/${_repo_name}"
  install -Dm 644 "${srcdir}/src/${_repo_prefix}/${_repo_name}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done

  install -Dm 644 "${srcdir}/${_pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 "${srcdir}/${_pkgname}.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
  install -Dm 644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf"
  install -Dm 644 "${srcdir}/${_pkgname}.environment" "${pkgdir}/etc/default/${_pkgname}"
}
