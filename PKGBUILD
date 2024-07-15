# Maintainer: fuero <fuerob@gmail.com>
_pkgname=ssh-tpm-agent
_repo_name="${_pkgname}.git"
pkgname="${_pkgname}-git"
# renovate: pkgName=https://github.com/Foxboron/ssh-tpm-agent depName=ssh-tpm-agent-git
pkgver=0.5.0.r12.1a148c8
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver}")
pkgrel=1
pkgdesc='ssh-agent compatible agent using TPM backed keys'
arch=('x86_64')
url=https://github.com/Foxboron/ssh-tpm-agent
license=('MIT')
depends=('glibc')
makedepends=(
  'go'
  'git'
)
#source=("$url/archive/v$pkgver/${_pkgname}-$pkgver.tar.gz")
source=("${_repo_name}::git+${url}")
b2sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_repo_name}"
  set -euo pipefail
  git describe --long --tags 2> /dev/null \
    | sed "s/^[A-Za-z\.\-]*//;s/\([^-]*-\)g/r\1/;s/-/./g" \
  || printf "r%s.%s\n" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)" 
}

_go_build() {
  go build -x -v \
        ${GOFLAGS} \
        -pkgdir=$(mktemp -d -p $(pwd)) \
        -ldflags "\
                  -linkmode=external \
                  -extldflags '${LDFLAGS}' \
                  -X main.commit=$(git rev-parse --short HEAD) \
                  -X main.date=$(git log -1 --format=%cd --date=iso-strict) \
                  -X main.version=$(git describe --always --tags --abbrev=0).$(git rev-parse --short HEAD)\
                 " \
    -o "$1" \
    "$2"
}

build() {
  cd "${srcdir}/${_repo_name}"
  mkdir bin
  for i in agent keygen add hostkeys
  do
    _go_build "bin/ssh-tpm-${i}" "./cmd/ssh-tpm-${i}"
  done
}

check() {
  cd "${srcdir}/${_repo_name}"
  go test -v ./...
}

package () {
  cd "${srcdir}/${_repo_name}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  for _file in *.md
  do
    install -Dm644 "${_file}" "${pkgdir}/usr/share/doc/${pkgname}/$(basename ${_file})"
  done
}
