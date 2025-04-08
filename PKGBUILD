# Maintainer: mekyt <hello at mek dot yt>

pkgname='openfga'
pkgver=1.8.9
pkgrel=0
pkgdesc='Relationship-based access control'
arch=('x86_64')
url='https://github.com/openfga/openfga'
license=('Apache-2.0')
depends=('glibc')
makedepends=(
  'go'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/openfga/openfga/archive/refs/tags/v${pkgver}.tar.gz"
  'openfga.service'
  'config.yaml'
  'sysusers.conf'
  'tmpfiles.conf'
)
b2sums=(
  'c90b1282483264a342eb2c608c77e38d651303efe3ad4d1cbe0c1386148d02662d98cb624e9e28651cf53abe32b934a5ecef530b847a86f56cce0f61f240feda'
  '7c755f75f83a8b06e6afea225a203c672d186e314d6f347c1949488743b47684b4078452857b8e430a736a8d62c2fb74a330abe2d39a25b031af08ebc29f83d9'
  '0cf0c6824d844a53af528c4ac15785140299f9b1c6a3304940710d3f07a7a3346c74780e4bf80770bc15a61166d21b4b3db460d2770f9a9775cdfd8d77293a1e'
  '1cba873bfeed213bc702c20106c284f3d93d54e23578754fbd67babfe1ff2861d29a0a563b45e58d2d0ebc063de8d0ff57ec3650f7f6b09952b8939b96615ed0'
  '91de9f416bc8eb033ac57eb4f8064eb21414a568217725dbee2ae3cd787c4788950b66f327d8614c7afe53c57faa1cb82d1a4644d7d0678be33258bf284f8e2b'
)

build() {
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export EXTRA_GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export LDFLAGS="-X github.com/openfga/openfga/internal/build.Version=${pkgver} -X github.com/openfga/openfga/internal/build.ProjectName=${pkgname}"

    cd "${pkgname}-${pkgver}"

    go run ./cmd/openfga completion bash > "${pkgname}.bash"
    go run ./cmd/openfga completion fish > "${pkgname}.fish"
    go run ./cmd/openfga completion zsh > "_${pkgname}"

    go build -o ./openfga ./cmd/openfga
}

package() {
    install -vDm644 "${pkgname}.service" -t "${pkgdir}/usr/lib/systemd/system/"
	install -vDm644 sysusers.conf "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -vDm644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"

    install -vDm664 "config.yaml" -t "${pkgdir}/etc/${pkgname}"

    cd "${pkgname}-${pkgver}"

    install -vDm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -vDm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    
	install -vDm644 "${pkgname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
	install -vDm644 "${pkgname}.fish" -t "${pkgdir}/usr/share/fish/vendor_completions.d/"
	install -vDm644 "_${pkgname}" -t "${pkgdir}/usr/share/zsh/site-functions/"
}
