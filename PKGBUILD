# Maintainer: Markus Maiwald <markus@maiwald.work>
pkgname=forge-code-bin
_name="forge-code"
pkgver=2.11.5
pkgrel=1
pkgdesc="AI-enabled pair programmer — Claude, GPT, O Series, Grok, Deepseek, Gemini. #1 on tbench.ai terminal benchmark."
arch=('x86_64')
url="https://forgecode.dev/"
license=('Apache')
install=$pkgname.install
depends=(
    'gcc-libs'
    'glibc'
    'gmp'
    'libssh2'
    'nss'
    'openssl'
    'zlib'
)
optdepends=(
    'zsh: ZSH plugin for : prefix command integration'
    'fzf: Interactive conversation picker (:conversation)'
    'bash: Required for interactive setup'
    'apparmor: Mandatory Access Control hardening profile'
)
provides=("$_name" "forge")
conflicts=("$_name" "forge-code-git" "forge")
options=('!debug' '!strip')
_baseurl=https://github.com/tailcallhq/forgecode/releases/download/v${pkgver}
source=(
    "forge::${_baseurl}/forge-x86_64-unknown-linux-gnu"
    "forge.desktop"
    "forge-code.sh"
    "forge-code.zsh"
    "forge-code.bash"
    "check-version.sh"
    "LICENSE"
    "forge.apparmor"
)
sha256sums=('ee4f86ebe77d52bb9d60b0a22d3dcc3d8e119af8345012741c90254819ce1364'
            'd780a4cf24b5dc6ae1741ecca42c32804fcde0472ebeed15aec0bce459f75e60'
            '0277ad00659d54ef81056a964dee9f330b27e609e3aa0add116d2ed080062a3d'
            '5c7f103a6458872aed46de82dff6781879a6cec475effad322066032cb415bcb'
            'b68de97a220603a741f103012fc11dad763194186c98cdd98dd6ad2ebf789a59'
            'd807c9f64030f20a89a0b03eab3a6559fe604a1350ac1a39ad6166acc9639703'
            '3c9f90350449325ae2b1355d6aae26df25be58f1cfcb8ed6a44b9c4b10c663f9'
            'edb591fdb72c84099fcdede43c6462cd008962a2b0a255339e7740661f5d933e')

package() {
    # Binary — installed as both forge (canonical) and forge-code (AUR name)
    install -Dm755 forge "$pkgdir/usr/bin/forge"
    ln -sf forge "$pkgdir/usr/bin/forge-code"

    # Launcher — handles non-TTY (desktop shortcut) invocations
    install -Dm755 "forge-code.sh" "$pkgdir/usr/bin/forge-code-launcher"
    ln -sf forge-code-launcher "$pkgdir/usr/bin/forge-code-launcher-real"

    # Desktop entry
    install -Dm644 forge.desktop \
        "$pkgdir/usr/share/applications/forge-code.desktop"

    # ZSH plugin — intercepts : prefix commands at any shell prompt
    # Two install locations for compatibility across plugin managers
    install -Dm644 "forge-code.zsh" \
        "$pkgdir/usr/share/zsh/plugins/$_name/$_name.zsh"
    install -Dm644 "forge-code.zsh" \
        "$pkgdir/usr/share/zsh/site-functions/_${_name}"

    # Bash completion
    install -Dm644 "forge-code.bash" \
        "$pkgdir/usr/share/bash-completion/completions/$_name"

    # AppArmor hardening profile (permissive until user enforces)
    install -Dm644 forge.apparmor \
        "$pkgdir/usr/share/apparmor/profiles/forge-code.apparmor"

    # License
    install -Dm644 LICENSE \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Version check script for cron/automation
    install -Dm755 check-version.sh \
        "$pkgdir/usr/share/$pkgname/check-version.sh"
}

# vim: set ts=4 sw=4 et:
