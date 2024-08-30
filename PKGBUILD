# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crc"
pkgver=2.41.0
pkgrel=1
pkgdesc="Manage local OpenShift 4.x cluster, optimized for testing and development purposes"
arch=('x86_64')
url="https://github.com/crc-org/${pkgname}"
license=('Apache-2.0')
makedepends=('git' 'go')
depends=('glibc' 'gpgme' 'firewalld' 'libvirt' 'networkmanager' 'qemu-base')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${url}#tag=v${pkgver}")
sha256sums=('3464b8e4318eb8875c5acc5b6bdff98c7cf927514a26b764fda4104b5d4cd85a')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  mkdir -p "build" "completions"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -v -tags "$(grep -E '^BUILDTAGS :=' Makefile | sed 's/.*= //')" -o "build/${pkgname}" -ldflags "\
    -X ${url#https://}/v2/pkg/${pkgname}/version.crcVersion=${pkgver} \
    -X ${url#https://}/v2/pkg/${pkgname}/version.ocpVersion=$(grep -E '^OPENSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
    -X ${url#https://}/v2/pkg/${pkgname}/version.okdVersion=$(grep -E '^OKD_VERSION \?=' Makefile | sed 's/.*= //') \
    -X ${url#https://}/v2/pkg/${pkgname}/version.microshiftVersion=$(grep -E '^MICROSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
    -X ${url#https://}/v2/pkg/${pkgname}/version.commitSha=$(git rev-parse --short=6 HEAD) \
    -X ${url#https://}/v2/pkg/${pkgname}/segment.WriteKey=$(grep -oP '(?<=WriteKey=)[^ ]+' Makefile)" \
    ./"cmd/${pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test -tags "$(grep -E '^BUILDTAGS :=' Makefile | sed 's/.*= //')" -ldflags "\
#     -X ${url#https://}/v2/pkg/${pkgname}/version.crcVersion=${pkgver} \
#     -X ${url#https://}/v2/pkg/${pkgname}/version.ocpVersion=$(grep -E '^OPENSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
#     -X ${url#https://}/v2/pkg/${pkgname}/version.okdVersion=$(grep -E '^OKD_VERSION \?=' Makefile | sed 's/.*= //') \
#     -X ${url#https://}/v2/pkg/${pkgname}/version.microshiftVersion=$(grep -E '^MICROSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
#     -X ${url#https://}/v2/pkg/${pkgname}/version.commitSha=$(git rev-parse --short=6 HEAD)" \
#     . ./pkg/... ./cmd/...
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "README.adoc"      "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
  install -Dm644 "LICENSE"          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "completions"
  install -Dm644 "${pkgname}.bash"       "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "${pkgname}.fish"       "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
  install -Dm644 "${pkgname}.zsh"        "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
  install -Dm644 "${pkgname}.powershell" "${pkgdir}/usr/share/powershell/Completions/${pkgname}.ps1"
}
