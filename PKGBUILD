# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=mindforge
pkgver=0.1.7
pkgrel=1
pkgdesc="A working agreement between you and your AI assistant that does not decay: tiered context, explicit triggers, a closeout that can't be forgotten. Any Linux distribution, no desktop needed: a terminal tool (bash)"
arch=('any')
url="https://github.com/jetomev/mindforge"
license=('GPL3')
depends=('bash' 'git' 'coreutils' 'grep' 'sed' 'gawk')
optdepends=('github-cli: checks that a queued task'"'"'s issue is still open (rot check R8)'
            'libnotify: a desktop notification when a session needs you'
            'python: the brief'"'"'s project table'
            'libpulse: the chime sound (paplay)'
            'pipewire: the chime sound (pw-play)')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('42acba0a397b156070461c2161f9d361ee7ef6e8a96a6afa5af55d5cda9cbd3e'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # 180 checks in a sandbox (its own HOME and state; gh stubbed, no network); the builder's files untouched
    bash testing/run-tests.sh
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 bin/mindforge "${pkgdir}/usr/bin/mindforge"
    # the starting files the README's Install copies into ~/.config and ~/.claude
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r templates "${pkgdir}/usr/share/${pkgname}/"
    install -m644 config.example always.example rules.example persona.example "${pkgdir}/usr/share/${pkgname}/"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
