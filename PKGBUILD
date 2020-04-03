# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue-bin
pkgver='0.3.0'
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
conflicts=('pueue-git' 'pueue')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=(
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/systemd.pueued.service"
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueue-linux-amd64"
    "https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueued-linux-amd64"
    "https://github.com/Nukesor/pueue/blob/master/LICENSE"
)
md5sums=('c4c2767651d310f0db7f078846e1b8a4'
         'bad7a31ba0f137104247baa50094f56e'
         '605826c6a023207239c6b8e985a3a206'
         'cfb9b65ddd163f9ac40ba8856d0e641d')

build() {
    # Build shell completion files for pueue client
    chmod +x pueue-linux-amd64
    #pueue-linux-amd64 completions zsh ./
    ./pueue-linux-amd64 completions bash ./
    ./pueue-linux-amd64 completions fish ./
}

package() {
    install -Dm755 "pueue-linux-amd64" "${pkgdir}/usr/bin/pueue"
    install -Dm755 "pueued-linux-amd64" "${pkgdir}/usr/bin/pueued"

    # Place systemd user service
    install -Dm644 "systemd.pueued.service" "${pkgdir}/usr/lib/systemd/user/pueued.service"

    # Install zsh completions file
    # Zsh is broken for now
    # install -Dm644 "utils/completions/_pueue" "${pkgdir}/usr/share/zsh/site-functions/_pueue"
    install -Dm644 "pueue.bash" "${pkgdir}/usr/share/bash-completion/completions/pueue.bash"
    install -Dm644 "pueue.fish" "${pkgdir}/usr/share/fish/completions/pueue.fish"

    # Install License
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/pueue/LICENSE"
}
