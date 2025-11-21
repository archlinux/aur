# Maintainer: Markus Maiwald <markus@maiwald.work>
# Refactored by: Voxis Forge AI

pkgname=kiro-bin-hardened
_name="kiro"
pkgver=0.6.0
pkgrel=15
epoch=1
pkgdesc='The AI IDE for prototype to production (Hardened for High-Security/Corporate Environments)'
# Hardening: Strict permissions, AppArmor profile, and dependency enforcement.
arch=('x86_64')
url='https://kiro.dev/'
license=('LicenseRef-AWS-IPL')
install=$pkgname.install
makedepends=('openssl')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bash'
    'cairo'
    'dbus'
    'expat'
    'gcc-libs'
    'glib2'
    'glibc'
    'gtk3'
    'libcups'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxkbfile'
    'libxrandr'
    'mesa'
    'nodejs'
    'nspr'
    'nss'
    'pango'
    'perl'
    'python'
    'systemd-libs'
)
provides=("$_name")
conflicts=("$_name" "kiro-bin")
optdepends=(
    'apparmor: Mandatory Access Control (MAC) security framework'
)
options=('!debug' '!strip')
_baseurl=https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed/$pkgver/tar
source=(
    "$_name-$pkgver.tar.gz::$_baseurl/kiro-ide-$pkgver-stable-linux-x64.tar.gz"
    "$_name-certificate.pem::$_baseurl/certificate.pem"
    "$_name-$pkgver-signature.bin::$_baseurl/signature.bin"
    "$_name.desktop"
    "$_name-url-handler.desktop"
    "$_name-workspace.xml"
    "$_name.apparmor"
    "$_name-launcher.sh"
    "SECURITY.md"
)
b2sums=('8a9a239518b11067956c4f06e31872aacf14ddb67e45042ba39d94a3e64e6eff14d3704eb75903476cebd0dd04e15a53f0b325c28eea88f13f89f1ea731cfedd'
        '09676f21f9b2821f7fb789fde98f1825f53d1df64ab74932ec2117f6cf06985bc5795ea7a016d90e9318035b2dd7c2f9706dccf44eb4cd092e4268a5f4760a26'
        '71eba0af9577dc2a829830d85c3a51ec2e0860e85d706edd0f5e22586792a282d222623397c7949e3901ce487feeb3b983640cd99419e1b7c688e3e75ed63dbb'
        'b80cc3af371e692fefdbb4b860bd2a2a8d74838597c15cd438be1ff430b625fa91327d599f93819b94ac808df9700b4658c00274aa17623f5e4bec3d6a7131a8'
        '422c58da03ba192980e0f867ad01ff6605e11e109086fec8abe27379ecff03d692f123f2016b2b76aa2d73f4038d44bcb476e6a806bec4c613304b3159a96642'
        'bf76f34c64e272831da98a3642f827b159582fafb3918db9f7334ed7ed9eace747148d6f0f863d2a5f1e751b7d43f109e35a8ac7ee1985c09d7ea90b73a40455'
        '95bbdc9155b621c078dc0e3d01d9f0ce658932b77120c02feb014c846a6e84b79089a5c5a54a7d4662ddac0edeeaf0bfd71a2cca45c38ae8b66e8e9aa0be8ace'
        'SKIP'
        'SKIP')

verify() {
    cd "$SRCDEST"
    openssl x509 -pubkey -noout -in $_name-certificate.pem > kiro-pubkey.pem
    openssl dgst -sha256 -verify kiro-pubkey.pem -signature $_name-$pkgver-signature.bin \
        $_name-$pkgver.tar.gz
}

package() {
    mkdir -p "$pkgdir/opt/Kiro"
    cp -r Kiro/* "$pkgdir/opt/Kiro"

    # Per pkgrel=9 findings, DO NOT recursively chmod files.
    # Electron applications are sensitive to permission changes and ship with the
    # permissions they need. Changing them causes crashes.
    # The only required change is for the SUID sandbox.
    
    # 3. CRITICAL: chrome-sandbox must be SUID root (4755)
    # This is required for Electron's Layer 1 Sandbox to work.
    # Without this, the app is LESS secure as it cannot sandbox renderer processes.
    chmod 4755 "$pkgdir/opt/Kiro/chrome-sandbox"

    # Install launcher wrapper script (auto-detects Wayland/X11)
    install -Dm755 $_name-launcher.sh "$pkgdir/usr/bin/$_name"

    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/Kiro/resources/app/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    ln -s /opt/Kiro/resources/app/resources/linux/code.png "$pkgdir/usr/share/pixmaps/$_name.png"

    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"

    ln -s /opt/Kiro/resources/completions/bash/$_name \
        "$pkgdir/usr/share/bash-completion/completions/$_name"
    ln -s /opt/Kiro/resources/completions/zsh/_$_name \
        "$pkgdir/usr/share/zsh/site-functions/_$_name"

    install -Dm644 $_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 $_name-url-handler.desktop \
        "$pkgdir/usr/share/applications/$_name-url-handler.desktop"
    install -Dm644 $_name-workspace.xml "$pkgdir/usr/share/mime/packages/$_name-workspace.xml"

    # AppArmor Profile (Optional Security Enhancement)
    install -Dm644 $_name.apparmor "$pkgdir/usr/share/apparmor/$_name.apparmor"

    # Install Security Documentation
    install -Dm644 SECURITY.md "$pkgdir/usr/share/doc/$pkgname/SECURITY.md"
}
