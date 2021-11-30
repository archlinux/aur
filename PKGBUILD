# Maintainer: Maarten de Boer <maarten@cloudstek.nl>

pkgname=('teleport-git' 'teleport-client-git')
pkgver=r7049.38b24f680
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=('glibc')
makedepends=('go>=1.16.0', 'git' 'rust')
provides=('tctl' 'tsh')
install=teleport.install

_go_srcpath="go/src/github.com/gravitational"

source=("${pkgname}::git+https://github.com/gravitational/teleport.git"
        "teleport.service"
        "teleport@.service"
        "teleport.install")

sha256sums=('SKIP'
            '10ac25cea1b5c193d7f968ca28a1da0e54b847f29c2a0186b46fd853194be38a'
            '4bc17fdde981f91c5d9972ae0555ee5e8b63a6b67e007c28f83ada80823980fd'
            'ce2dd61cae3c0c3684e7e629f98b77551e66ddedca2194250a34f0efbc674f3a')

pkgver() {
  cd "${srcdir}/${_go_srcpath}"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    install -dm755 "${srcdir}/go/src/github.com"

    if [ -d "${srcdir}/${pkgname}" ]; then
        rm -Rf "${srcdir}/${_go_srcpath}"
        mv "${srcdir}/${pkgname}" "${srcdir}/${_go_srcpath}"
    fi
}

build() {
    cd "${srcdir}/${_go_srcpath}"

    export GOPATH="${srcdir}/go"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export ADDFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    # Build
    PATH="${PATH}:${HOME}/.cargo/bin" make full

    # Make sure go path is writable so it can be cleaned up
    chmod -R u+w "${srcdir}/go"
}

package_teleport-git() {
    install=teleport.install
    replaces=('teleport-client' 'teleport-client-git')

    cd "${srcdir}/${_go_srcpath}"

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

package_teleport-client-git() {
    replaces=('teleport' 'teleport-git')

    cd "${srcdir}/${_go_srcpath}"

    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"
}
