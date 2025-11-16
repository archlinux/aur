# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname=crc-git
pkgver=2.56.0.r8.g883d43e
pkgrel=1
pkgdesc="CRC is a tool to help you run containers. It manages local VMs to run a OpenShift 4.x cluster, Microshift or Podman optimized for testing and development purposes"
arch=('x86_64')
url="https://github.com/crc-org/${pkgname%-git}"
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
source=("$pkgname::git+$url.git")
b2sums=('SKIP')

pkgver() {
    cd "$pkgname" || exit
    git describe --long --tags --abbrev=7 | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname" || exit
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -v -tags "$(grep -E '^BUILDTAGS :=' Makefile | sed 's/.*= //')" -o "build/${pkgname}" -ldflags "\
        -X ${url#https://}/v2/pkg/${pkgname%-git}/version.crcVersion=${pkgver:0:-12} \
        -X ${url#https://}/v2/pkg/${pkgname%-git}/version.ocpVersion=$(grep -E '^OPENSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
        -X ${url#https://}/v2/pkg/${pkgname%-git}/version.okdVersion=$(grep -E '^OKD_VERSION \?=' Makefile | sed 's/.*= //') \
        -X ${url#https://}/v2/pkg/${pkgname%-git}/version.microshiftVersion=$(grep -E '^MICROSHIFT_VERSION \?=' Makefile | sed 's/.*= //') \
        -X ${url#https://}/v2/pkg/${pkgname%-git}/version.commitSha=$(git rev-parse --short=6 HEAD) \
        -X ${url#https://}/v2/pkg/${pkgname%-git}/segment.WriteKey=$(grep -oP '(?<=WriteKey=)[^ ]+' Makefile)" \
        ./"cmd/${pkgname%-git}"
}

package() {
    cd "$pkgname" || exit
    install -Dm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
