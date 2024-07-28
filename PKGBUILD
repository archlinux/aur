# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="crc"
pkgname="${_pkgname}-git"
pkgver=2.39.0.r8.gdb4810b
pkgrel=1
pkgdesc="A tool that manages local OpenShift 4.x cluster, optimized for testing and development purposes"
arch=('any')
url="https://github.com/crc-org/${_pkgname}"
license=('Apache-2.0')
makedepends=('git' 'go')
depends=('glibc' 'gpgme' 'firewalld' 'libvirt' 'networkmanager' 'qemu-base')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
provides=("${_pkgname}=${pkgver%%.r*}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions"
  go mod download
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -v -tags "$(grep -E '^BUILDTAGS :=' Makefile | sed 's/.*= //')" -o "build/${_pkgname}" -ldflags "\
    -X ${url#https://}/v2/pkg/${_pkgname}/version.crcVersion=${pkgver%%.r*} \
    -X ${url#https://}/v2/pkg/${_pkgname}/version.ocpVersion=$(grep -E '^OPENSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
    -X ${url#https://}/v2/pkg/${_pkgname}/version.okdVersion=$(grep -E '^OKD_VERSION \?=' Makefile | sed 's/.*= //') \
    -X ${url#https://}/v2/pkg/${_pkgname}/version.microshiftVersion=$(grep -E '^MICROSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
    -X ${url#https://}/v2/pkg/${_pkgname}/version.commitSha=$(git rev-parse --short=6 HEAD) \
    -X ${url#https://}/v2/pkg/${_pkgname}/segment.WriteKey=$(grep -oP '(?<=WriteKey=)[^ ]+' Makefile)" \
    ./"cmd/${_pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${_pkgname}" completion "${_sh}" > "completions/${_pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test -tags "$(grep -E '^BUILDTAGS :=' Makefile | sed 's/.*= //')" -ldflags "\
#     -X ${url#https://}/v2/pkg/${_pkgname}/version.crcVersion=${pkgver%%.r*} \
#     -X ${url#https://}/v2/pkg/${_pkgname}/version.ocpVersion=$(grep -E '^OPENSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
#     -X ${url#https://}/v2/pkg/${_pkgname}/version.okdVersion=$(grep -E '^OKD_VERSION \?=' Makefile | sed 's/.*= //') \
#     -X ${url#https://}/v2/pkg/${_pkgname}/version.microshiftVersion=$(grep -E '^MICROSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
#     -X ${url#https://}/v2/pkg/${_pkgname}/version.commitSha=$(git rev-parse --short=6 HEAD)" \
#     . ./pkg/... ./cmd/...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.adoc"       "${pkgdir}/usr/share/doc/${_pkgname}/README.adoc"
  install -Dm644 "LICENSE"           "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${_pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${_pkgname}"
  install -Dm644 "${_pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${_pkgname}.fish"
  install -Dm644 "${_pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"
  install -Dm644 "${_pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${_pkgname}.ps1"
}
