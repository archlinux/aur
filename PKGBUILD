# Maintainer: clague <https://github.com/clague>
pkgname=aetherprompt-git
_pkgname=aetherprompt
pkgver=0.1.1
pkgrel=1
pkgdesc="Wayland passphrase prompt (pinentry & ssh-askpass) styled after caelestia (git version)"
arch=('any')
url="https://github.com/clague/aetherprompt"
license=('GPL-3.0')
depends=(
    'bash'
    'coreutils'          # base64 (passphrase decoding)
    'python'
    'quickshell'         # QML runtime (also satisfied by quickshell-release-git)
    'qt6-m3shapes'       # MaterialShape import (M3Shapes)
    'caelestia-shell'    # provides the Caelestia.Config QML token library
)
makedepends=('git')
optdepends=(
    'gnupg: to use aetherprompt as gpg-agent pinentry'
    'openssh: SSH_ASKPASS support'
    'sudo: SUDO_ASKPASS support'
)
provides=("aetherprompt=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')
install="${pkgname}.install"

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${_pkgname}"

    # package-private payload: the CLI/QML app lives flat under /usr/lib/<pkg>
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 bin/aetherprompt "${pkgdir}/usr/lib/${_pkgname}/aetherprompt"
    install -Dm644 lib/sockrecv.py "${pkgdir}/usr/lib/${_pkgname}/lib/sockrecv.py"
    cp -a --no-preserve=ownership shell.qml components services "${pkgdir}/usr/lib/${_pkgname}/"

    # docs & license in their standard FHS locations
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    # single CLI entrypoint — no generic-name symlinks; SSH_ASKPASS /
    # SUDO_ASKPASS are configured to point at /usr/bin/aetherprompt
    # (see post_install hint)
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${_pkgname}/aetherprompt" "${pkgdir}/usr/bin/${_pkgname}"
}
