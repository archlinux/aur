# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue-bin
pkgver='0.12.0'
pkgrel=1
arch=('any')
pkgdesc='A command scheduler for shells'
license=('MIT')
conflicts=('pueue-git' 'pueue')
provides=('pueue')
url='https://github.com/nukesor/pueue'
source=(
    "pueued-systemd-service-${pkgver}::https://github.com/Nukesor/pueue/releases/download/v${pkgver}/systemd.pueued.service"
    "pueue-linux-amd64-${pkgver}::https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueue-linux-x86_64"
    "pueued-linux-amd64-${pkgver}::https://github.com/Nukesor/pueue/releases/download/v${pkgver}/pueued-linux-x86_64"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Nukesor/pueue/master/LICENSE"
)
md5sums=('c4c2767651d310f0db7f078846e1b8a4'
         '1e205940fd051eb8441d0e163c333884'
         'db7e7515a28e19d8883bef7e8ee478dc'
         '9a93f8a6f92f46744e37db490def1f6d')

build() {
    # Build shell completion files for pueue client
    chmod +x pueue-linux-amd64-$pkgver
    ./pueue-linux-amd64-$pkgver completions zsh ./
    ./pueue-linux-amd64-$pkgver completions bash ./
    ./pueue-linux-amd64-$pkgver completions fish ./
}

package() {
    install -Dm755 "pueue-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/pueue"
    install -Dm755 "pueued-linux-amd64-${pkgver}" "${pkgdir}/usr/bin/pueued"

    # Place systemd user service
    install -Dm644 "pueued-systemd-service-${pkgver}" "${pkgdir}/usr/lib/systemd/user/pueued.service"

    # Install zsh completions file
    install -Dm644 "_pueue" "${pkgdir}/usr/share/zsh/site-functions/_pueue"
    install -Dm644 "pueue.bash" "${pkgdir}/usr/share/bash-completion/completions/pueue.bash"
    install -Dm644 "pueue.fish" "${pkgdir}/usr/share/fish/completions/pueue.fish"

    # Install License
    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/pueue/LICENSE"
}
