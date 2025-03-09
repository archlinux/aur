# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="crc"
pkgver=2.48.0
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
)
makedepends=(
    'git'
    'go'
)
source=("$pkgname-$pkgver::git+$url.git#tag=v$pkgver")
b2sums=('00e0caaeaf83643331fd2a10453600c8af3a835a57ac79ab9914ce1219606a337c9542a6ef3c5ae0faeb22410f260e39f19d8aeb4672bd8f95355ff2c3bd7ea3')

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
