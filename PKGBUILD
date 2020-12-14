# Maintainer: Arne Beer <privat@arne.beer>

pkgname=pueue-bin
pkgver='0.9.0'
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
         '9d8d47f1c40e2a422e2adb8807788648'
         'ae09d5195132065463f8e1793bf0359b'
         '5e29c92edf8c4dfe90cda870a7e6c51e')

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
