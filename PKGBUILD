# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crc"
pkgver=2.49.0
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
b2sums=('efa9422dade13fca1b079aeca4d71e65510088c1d6f1db33cc142eeeaa4ed1f12f028368e638db7cf0e1b482c2119d4a0ff64d10de526e9c0becb0b62e6ac8bf')

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
