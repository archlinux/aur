# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue-bin
pkgver='0.5.1'
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
conflicts=('pueue-git' 'pueue')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=(
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/systemd.pueued.service"
    "pueue-linux-amd64-${pkgver}::https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueue-linux-amd64"
    "pueued-linux-amd64-${pkgver}::https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueued-linux-amd64"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Nukesor/pueue/master/LICENSE"
)
md5sums=('c4c2767651d310f0db7f078846e1b8a4'
         '1db5816ab5d8b3dfa82265c4e3508480'
         '1d51624c91039c836239bd5288a220e4'
         '5e29c92edf8c4dfe90cda870a7e6c51e')

build() {
    # Build shell completion files for pueue client
    chmod +x pueue-linux-amd64-$pkgver
    #pueue-linux-amd64-${pkgdir} completions zsh ./
    ./pueue-linux-amd64-$pkgver completions bash ./
    ./pueue-linux-amd64-$pkgver completions fish ./
}

package() {
    install -Dm755 "pueue-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/pueue"
    install -Dm755 "pueued-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/pueued"

    # Place systemd user service
    install -Dm644 "systemd.pueued.service" "${pkgdir}/usr/lib/systemd/user/pueued.service"

    # Install zsh completions file
    # Zsh is broken for now
    # install -Dm644 "utils/completions/_pueue" "${pkgdir}/usr/share/zsh/site-functions/_pueue"
    install -Dm644 "pueue.bash" "${pkgdir}/usr/share/bash-completion/completions/pueue.bash"
    install -Dm644 "pueue.fish" "${pkgdir}/usr/share/fish/completions/pueue.fish"

    # Install License
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/pueue/LICENSE"
}
