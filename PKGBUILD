# Maintainer: kausban <mail at kausban com>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>

# Minimal fork of https://aur.archlinux.org/packages/protonmail-bridge/
# Compiled with 'nogui' option
# Included is a user systemd service. Try: systemctl status --user bridge.service
# You can login and register accounts using the interactive cli
# Names screen session accessible as: screen -R -S bridgedaemon

pkgname=protonmail-bridge-nogui
pkgver=1.2.6
pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://www.protonmail.com/bridge"
license=('GPL3')
makedepends=('go' 'gcc')
depends=('libsecret' 'screen')
optdepends=(
    'gnome-keyring: supported password manager (password manager is required)'
    'pass: supported password manager (password manager is required)'
)
conflicts=('protonmail-bridge-bin' 'protonmail-bridge')
options=('!emptydirs' '!strip')
source=("git://github.com/ProtonMail/proton-bridge.git"
	"bridge.service")
sha256sums=('SKIP'
            '07cc30765dd43307a995ac4f3aed5dee4d6af7e2bc32a21a1201d888a39603c0')

prepare() {
    cd ${srcdir}/proton-bridge/
    sed -i 's/pmapi_prod/pmapi_prod nogui/' Makefile
    export PATH=$PATH:$(go env GOPATH)/bin/
    make clean
    make build
}

package() {
    install -Dm644 "${srcdir}"/bridge.service -t "${pkgdir}"/usr/lib/systemd/user/
    cd "${srcdir}"/proton-bridge/cmd/Desktop-Bridge/deploy/linux
    install -Dm644 ./LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    install -Dm644 ./Changelog.md -t "${pkgdir}"/usr/share/doc/"${pkgbame}"/
    install -Dm755 ./proton-bridge "${pkgdir}"/usr/bin/protonmail-bridge
}
