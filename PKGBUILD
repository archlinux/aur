# Maintainer: Musee "lae" Ullah <lae(at)lae(dot)is>

pkgname=drpcli-tip
pkgver=3.7.3.128.911784fb
pkgrel=1
pkgdesc="Command-line client for Digital Rebar Provision, an API-driven DHCP/PXE/TFTP provisioning system. (Latest unstable release)"
arch=('x86_64')
url="https://github.com/digitalrebar/provision"
license=('Apache')
provides=('drpcli')
conflicts=('drpcli')
optdepends=('jq: for parsing and syntax colouring JSON responses'
            'bash-completion: tab completion')
source=("dr-provision.zip::https://github.com/digitalrebar/provision/releases/download/tip/dr-provision.zip")
sha256sums=($(wget -qO- https://github.com/digitalrebar/provision/releases/download/tip/dr-provision.sha256 | awk '/dr-provision.zip$/ {print $1}'))

pkgver() {
    ${srcdir}/bin/linux/amd64/drpcli version | grep -oP "v\K(\d+\.){2}\d+-|tip-\K\d+-[\da-f]{8}" | tr -d $'\n' | tr '-' .
}

build() {
    mv ${srcdir}/bin/linux/amd64/drpcli ${srcdir}/
    ${srcdir}/drpcli autocomplete ${srcdir}/drpcli.definitions
}

package() {
    install -Dm755 "${srcdir}/drpcli" "${pkgdir}/usr/bin/drpcli"
    install -Dm644 "${srcdir}/drpcli.definitions" "${pkgdir}/usr/share/bash-completion/completions/drpcli"
}
