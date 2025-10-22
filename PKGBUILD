# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crc"
pkgver=2.55.1
pkgrel=1
pkgdesc="CRC is a tool to help you run containers. It manages local VMs to run a OpenShift 4.x cluster, Microshift or Podman optimized for testing and development purposes"
arch=('x86_64')
url="https://github.com/crc-org/${pkgname}"
license=('Apache-2.0')
depends=(
    'glibc'
    'gpgme'
    'firewalld'
    'libvirt'
    'networkmanager'
    'qemu-base'
    'podman'
)
makedepends=(
    'git'
    'go'
)
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
b2sums=('231256393f85a69f9e6e01c54ab69931f1d4a3d75abd4ccd7b4e588647584ccf1d7b171cf782bebf9acec7526a395282ffe78817e49c50dfdb5ed61fc0aa7895')

build() {
    cd "$pkgname-$pkgver" || exit
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
}

package() {
    cd "$pkgname-$pkgver" || exit
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
