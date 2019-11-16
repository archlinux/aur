# Maintainer: Musee "lae" Ullah <lae(at)idolactiviti(dot)es>

pkgname=drpcli-git
_gitname=provision
pkgver=v4.1.2.r14.g630c3438
pkgrel=1
pkgdesc="Command-line client for Digital Rebar Provision, an API-driven DHCP/PXE/TFTP provisioning system. (development version)"
arch=('x86_64')
url="https://github.com/digitalrebar/provision"
license=('Apache')
provides=('drpcli')
conflicts=('drpcli')
optdepends=('jq: for parsing and syntax colouring JSON responses'
            'bash-completion: tab completion')
makedepends=('go' 'git')
source=(git+https://github.com/digitalrebar/provision.git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_gitname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_gitname}"
    . tools/version.sh
    export CGO_ENABLED=0
    export GO111MODULE=on
    export VERFLAGS="-s -w \
        -X github.com/digitalrebar/provision/v4.RSMajorVersion=$MajorV \
        -X github.com/digitalrebar/provision/v4.RSMinorVersion=$MinorV \
        -X github.com/digitalrebar/provision/v4.RSPatchVersion=$PatchV \
        -X github.com/digitalrebar/provision/v4.RSExtra=$Extra \
        -X github.com/digitalrebar/provision/v4.BuildStamp=$(date -u '+%Y-%m-%d_%I:%M:%S%p')"
    cd cmds/drpcli
    go build -ldflags "${VERFLAGS}" -o "${srcdir}/drpcli"
    "${srcdir}/drpcli" autocomplete "${srcdir}/drpcli.definitions"
}

package() {
    install -Dm755 "${srcdir}/drpcli" "${pkgdir}/usr/bin/drpcli"
    install -Dm644 "${srcdir}/drpcli.definitions" "${pkgdir}/usr/share/bash-completion/completions/drpcli"
}
