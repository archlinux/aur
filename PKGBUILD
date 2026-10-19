# Maintainer: jetomev <jetomev@gmail.com>
# Co-developer: Claude (Anthropic)

pkgname=mindforge
pkgver=0.1.10
pkgrel=1
pkgdesc="A working agreement between you and your AI assistant that does not decay: tiered context, explicit triggers, a closeout that can't be forgotten. Any Linux distribution, no desktop needed: a terminal tool (bash)"
arch=('any')
url="https://github.com/jetomev/mindforge"
license=('MIT')
depends=('bash' 'git' 'coreutils' 'grep' 'sed' 'gawk')
optdepends=('github-cli: checks that a queued task'"'"'s issue is still open (rot check R8)'
            'libnotify: a desktop notification when a session needs you'
            'python: the tie alert, mindforge tone (a Stop hook)'
            'libpulse: the chime sound (paplay)'
            'pipewire: the chime sound (pw-play)')
checkdepends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha256sums=('c2448ecf89bab8cc013e2633502a640d8052763ade50d9ff6c1a7e1a82db4da6'
            'SKIP')
# Javier (jetomev) release-signing key — import via:
#   curl -s https://github.com/jetomev.gpg | gpg --import
validpgpkeys=('32E1D2AB9380BFD6BFE3BC1EAC2A3407CC070F9E')

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # 293 checks in a sandbox (its own HOME and state; gh stubbed, no network); the builder's files untouched
    bash testing/run-tests.sh
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 bin/mindforge "${pkgdir}/usr/bin/mindforge"
    # the starting files the README's Install copies into ~/.config and ~/.claude
    install -dm755 "${pkgdir}/usr/share/${pkgname}"
    cp -r templates "${pkgdir}/usr/share/${pkgname}/"
    install -m644 config.example always.example rules.example persona.example scope.example "${pkgdir}/usr/share/${pkgname}/"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    cp -r docs "${pkgdir}/usr/share/doc/${pkgname}/"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
