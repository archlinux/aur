# Maintainer: Kyle Manna <kyle(at)kylemanna(dot)com>
pkgname=storj-uplink
_basename=storj
pkgver=1.119.8
pkgrel=1
pkgdesc="Storj Tardigrade Uplink"
arch=('x86_64')
url="https://github.com/storj/storj"
license=('AGPL-3.0')
makedepends=('git' 'go')  # 'git' is needed for fetching from Git
# Pull from the exact tag corresponding to pkgver:
source=("git+https://github.com/${_basename}/${_basename}.git#tag=v${pkgver}")
sha512sums=('b2fdb9ff7160da92e48a9be28f76fba67bf6f01a2fd463f209b2439b741a848cbe239714083400f7f728105454cc7e12ef03b0e05dc09a846193668703881513')

prepare() {
    cd "${_basename}"
    mkdir -p build
}

build() {
    cd "${_basename}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # Build using the release script
    scripts/release.sh build -o build ./cmd/uplink
}

package() {
    cd "${_basename}"
    install -Dm755 build/uplink "${pkgdir}/usr/bin/uplink"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
