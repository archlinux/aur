# Maintainer: kausban <mail at kausban com>
# Contributor: Ali Molaei <ali dot molaei at protonmail dot com>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>

# Minimal fork of https://aur.archlinux.org/packages/protonmail-bridge/
# Compiled with 'nogui' option
# Included is a user systemd service. Try: systemctl status --user bridge.service
# You can login and register accounts using the interactive cli: protonmail-bridge --cli
# Once you have everything configured and automated. You can enable and use bridge.service to run bridge in background.

# The following is an alternative way to run the bridge in interactive cli mode encapsulated within a named screen session.
# Can be added to bridge.service
# ExecStart=/usr/bin/screen -Dm -S bridgedaemon sh -c "sleep 5; protonmail-bridge -c"
# ExecStop=/usr/bin/screen -X -S bridgedaemon quit

pkgname=protonmail-bridge-nogui
pkgver=3.0.20
pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=('x86_64')
url="https://github.com/ProtonMail/proton-bridge"
license=('GPL3')
makedepends=('go' 'gcc' 'git')
depends=('libsecret')
optdepends=('org.freedesktop.secrets: Applications that support Freedesktop secrets api'
            'gnome-keyring: support for gnome keyring'
            'pass: support for password-store')
conflicts=('protonmail-bridge-bin' 'protonmail-bridge')
options=('!emptydirs' '!strip')
source=("git+https://github.com/ProtonMail/proton-bridge.git#tag=v${pkgver}"
        "bridge.service")
sha256sums=('SKIP'
            '6b2fd1e042b55dc6d0ffe5eb44e82ffd233452b4571ef571132600e7ec0d5d82')

prepare() {
    cd "${srcdir}"/proton-bridge/
    export PATH=$PATH:$(go env GOPATH)/bin/
    make clean
}

build() {
    cd "${srcdir}"/proton-bridge/
    export PATH=$PATH:$(go env GOPATH)/bin/
    make build-nogui
}

package() {
    install -Dm644 "${srcdir}"/bridge.service -t "${pkgdir}"/usr/lib/systemd/user/
    cd "${srcdir}"/proton-bridge/
    install -Dm644 ./LICENSE -t "${pkgdir}"/usr/share/licenses/"${pkgname}"/
    install -Dm644 ./Changelog.md -t "${pkgdir}"/usr/share/doc/"${pkgbame}"/
    install -Dm755 ./bridge "${pkgdir}"/usr/bin/protonmail-bridge
}
