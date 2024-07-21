# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crc"
pkgver=2.38.0
pkgrel=2
pkgdesc="A tool that manages local OpenShift 4.x cluster, optimized for testing and development purposes"
arch=('any')
url="https://github.com/crc-org/${pkgname}"
license=('Apache-2.0')
makedepends=('git' 'go')
depends=('glibc' 'gpgme' 'firewalld' 'libvirt' 'networkmanager' 'qemu-base')
optdepends=('bash-completion: for shell auto-completion'
            'zsh-completions: for shell auto-completion')
_pkgsrc="${pkgname}-${pkgver}"
source=("${_pkgsrc}::git+${url}#tag=v${pkgver}")
sha256sums=('0e689d454ad8b91f8fa477d59619bcce43b76dc670d23f7a1bfff2c89ac8db0c')

VERSION_VARIABLES="-X ${url#https://}/v2/pkg/${pkgname}/version.crcVersion=2.38.0 \
                   -X ${url#https://}/v2/pkg/${pkgname}/version.ocpVersion=4.15.17 \
                   -X ${url#https://}/v2/pkg/${pkgname}/version.okdVersion=4.15.0-0.okd-2024-02-23-163410 \
                   -X ${url#https://}/v2/pkg/${pkgname}/version.microshiftVersion=4.15.17 \
                   -X ${url#https://}/v2/pkg/${pkgname}/version.commitSha=$(git rev-parse --short=6 HEAD)"
RELEASE_VERSION_VARIABLES="-X ${url#https://}/v2/pkg/${pkgname}/segment.WriteKey=cvpHsNcmGCJqVzf6YxrSnVlwFSAZaYtp"

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
  export LDFLAGS="${LDFLAGS:-} \
                  ${VERSION_VARIABLES} \
                  ${GO_EXTRA_LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -tags "containers_image_openpgp" -o "build/${pkgname}" "./cmd/${pkgname}"

  for _sh in bash fish zsh powershell; do
    ./"build/${pkgname}" completion "${_sh}" > "completions/${pkgname}.${_sh}"
  done
}

# check() {
#   cd "${srcdir}/${_pkgsrc}"
#   go test --tags "build containers_image_openpgp" -v -ldflags="${VERSION_VARIABLES}" . ./pkg/... ./cmd/...
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
