# Maintainer: Maarten de Boer <maarten@cloudstek.nl>

pkgname=teleport-git
pkgver=r6397.7443451d5
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=()
makedepends=('go>=1.14.0', 'git')
provides=('tctl' 'tsh')
install=teleport.install

source=("${pkgname}::git+https://github.com/gravitational/teleport.git"
        "teleport.service"
        "teleport@.service"
        "teleport.install")

sha256sums=('SKIP'
            '10ac25cea1b5c193d7f968ca28a1da0e54b847f29c2a0186b46fd853194be38a'
            '4bc17fdde981f91c5d9972ae0555ee5e8b63a6b67e007c28f83ada80823980fd'
            'ce2dd61cae3c0c3684e7e629f98b77551e66ddedca2194250a34f0efbc674f3a')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    install -m755 -d "${srcdir}/go/src/github.com/gravitational"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/gravitational/teleport"
}

build() {
    export GOPATH="${srcdir}/go"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${GOPATH}/src/github.com/gravitational/teleport"

    make

    rm -Rf "${srcdir}/go"
    unset GOPATH
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install binaries
    install -Dm755 build/teleport "${pkgdir}/usr/bin/teleport"
    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"

    # Install services
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/usr/lib/systemd/system/teleport.service"
    install -Dm644 ${srcdir}/teleport@.service "${pkgdir}/usr/lib/systemd/system/teleport@.service"

    # Copy example files
    install -dm755 "${pkgdir}/usr/share/teleport"
    cp -r examples "${pkgdir}/usr/share/teleport/"
}
