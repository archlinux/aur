# Maintainer: fuero <fuerob@gmail.com>
_pkgname=ssh-tpm-agent
_repo_name="${_pkgname}.git"
pkgname="${_pkgname}-git"
# renovate: pkgName=https://github.com/Foxboron/ssh-tpm-agent depName=ssh-tpm-agent-git
pkgver=0.1.0.r12.6092d3f
pkgrel=1
pkgdesc='ssh-agent compatible agent using TPM backed keys'
arch=('x86_64')
url=https://github.com/Foxboron/ssh-tpm-agent
license=('MIT')
depends=('glibc')
makedepends=('go')
#source=("$url/archive/v$pkgver/${_pkgname}-$pkgver.tar.gz")
source=(
	"${_repo_name}::git+${url}"
)
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_repo_name}"
  (
    set -o pipefail
    git describe --long --tags 2> /dev/null | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" || 
    printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
  )
}

_go_build() {
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
    -o "$1" \
    "$2"
}

build() {
  cd "${srcdir}/${_repo_name}"
  _go_build "ssh-tpm-agent.bin" ./cmd/ssh-tpm-agent
  _go_build "ssh-tpm-keygen.bin" ./cmd/ssh-tpm-keygen
}

check() {
  cd "${srcdir}/${_repo_name}"
  go test -v ./...
}

package () {
  cd "${srcdir}/${_repo_name}"
  install -Dm 755 ssh-tpm-agent.bin "${pkgdir}/usr/bin/ssh-tpm-agent"
  install -Dm 755 ssh-tpm-keygen.bin "${pkgdir}/usr/bin/ssh-tpm-keygen"
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
