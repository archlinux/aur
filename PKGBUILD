# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Refactored by: Voxis Forge <ai-mentor@internal>

pkgname=kiro-bin-hardened
_name="${pkgname%-bin-hardened}"
pkgver=0.6.0
pkgrel=1
epoch=1
pkgdesc="Spec-driven AI IDE from prototype to production. Hardened with strict permissions and verified dependencies."
arch=('x86_64')
url='https://kiro.dev/'
# By downloading and using Kiro, you agree to the following:
#   AWS Customer Agreement: https://aws.amazon.com/agreement/
#   AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
#   Service Terms: https://aws.amazon.com/service-terms/
#   Privacy Notice: https://aws.amazon.com/privacy/
license=('LicenseRef-AWS-IPL')
makedepends=('openssl')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bash'
    'cairo'
    'ca-certificates'
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
    'xdg-utils'
)
provides=("$_name")
conflicts=("$_name" "kiro-bin")
# !strip: Prevent stripping of signed binaries (breaks Electron)
# !emptydirs: Keep empty directories if they are needed
options=('!debug' '!strip' '!emptydirs')
_baseurl=https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed/$pkgver/tar
source=(
    "$_name-$pkgver.tar.gz::$_baseurl/kiro-ide-$pkgver-stable-linux-x64.tar.gz"
    "$_name-certificate.pem::$_baseurl/certificate.pem"
    "$_name-$pkgver-signature.bin::$_baseurl/signature.bin"
    "$_name.desktop"
    "$_name-url-handler.desktop"
    "$_name-workspace.xml"
)
b2sums=('8a9a239518b11067956c4f06e31872aacf14ddb67e45042ba39d94a3e64e6eff14d3704eb75903476cebd0dd04e15a53f0b325c28eea88f13f89f1ea731cfedd'
        '09676f21f9b2821f7fb789fde98f1825f53d1df64ab74932ec2117f6cf06985bc5795ea7a016d90e9318035b2dd7c2f9706dccf44eb4cd092e4268a5f4760a26'
        '71eba0af9577dc2a829830d85c3a51ec2e0860e85d706edd0f5e22586792a282d222623397c7949e3901ce487feeb3b983640cd99419e1b7c688e3e75ed63dbb'
        'b80cc3af371e692fefdbb4b860bd2a2a8d74838597c15cd438be1ff430b625fa91327d599f93819b94ac808df9700b4658c00274aa17623f5e4bec3d6a7131a8'
        '422c58da03ba192980e0f867ad01ff6605e11e109086fec8abe27379ecff03d692f123f2016b2b76aa2d73f4038d44bcb476e6a806bec4c613304b3159a96642'
        'bf76f34c64e272831da98a3642f827b159582fafb3918db9f7334ed7ed9eace747148d6f0f863d2a5f1e751b7d43f109e35a8ac7ee1985c09d7ea90b73a40455')

verify() {
    cd "$SRCDEST"
    openssl x509 -pubkey -noout -in $_name-certificate.pem > kiro-pubkey.pem
    openssl dgst -sha256 -verify kiro-pubkey.pem -signature $_name-$pkgver-signature.bin \
        $_name-$pkgver.tar.gz
}

package() {
    # 1. Preparation
    # --------------------------------------------------------------------------
    msg2 "Locating extracted directory..."
    local _extracted_dir
    _extracted_dir=$(find "$srcdir" -maxdepth 1 -type d -name "Kiro*" | head -n 1)

    if [ -z "$_extracted_dir" ]; then
        error "Could not find extracted directory 'Kiro*'."
        return 1
    fi

    # 2. Installation to /opt
    # --------------------------------------------------------------------------
    msg2 "Installing to /opt/kiro..."
    install -d "$pkgdir/opt/kiro"
    cp -r "$_extracted_dir"/* "$pkgdir/opt/kiro/"

    # 3. Hardening Protocol (Voxis Standard)
    # --------------------------------------------------------------------------
    msg2 "Applying hardening protocols..."

    # A. Base Permissions: 
    # Directories -> 755 (rwxr-xr-x)
    # Files       -> 644 (rw-r--r--)
    find "$pkgdir/opt/kiro" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/kiro" -type f -exec chmod 644 {} +

    # B. Executables:
    # Main binary -> 755
    if [ -f "$pkgdir/opt/kiro/Kiro" ]; then
        chmod 755 "$pkgdir/opt/kiro/Kiro"
    elif [ -f "$pkgdir/opt/kiro/kiro" ]; then
        chmod 755 "$pkgdir/opt/kiro/kiro"
    fi

    # C. Chrome Sandbox (Critical for Electron Security):
    # Must be 4755 (SUID root) if it exists
    if [ -f "$pkgdir/opt/kiro/chrome-sandbox" ]; then
        msg2 "Securing chrome-sandbox..."
        chmod 4755 "$pkgdir/opt/kiro/chrome-sandbox"
    fi

    # 4. System Integration
    # --------------------------------------------------------------------------
    msg2 "Creating system links and assets..."

    # Binary Symlink
    install -d "$pkgdir/usr/bin"
    if [ -f "$pkgdir/opt/kiro/Kiro" ]; then
        ln -s "/opt/kiro/Kiro" "$pkgdir/usr/bin/$_name"
    elif [ -f "$pkgdir/opt/kiro/kiro" ]; then
        ln -s "/opt/kiro/kiro" "$pkgdir/usr/bin/$_name"
    fi

    # Icon
    install -d "$pkgdir/usr/share/pixmaps"
    local _icon_path="$pkgdir/opt/kiro/resources/app/resources/linux/code.png"
    
    if [ -f "$_icon_path" ]; then
        ln -s "/opt/kiro/resources/app/resources/linux/code.png" "$pkgdir/usr/share/pixmaps/$_name.png"
    else
        # Fallback search
        local _found_icon
        _found_icon=$(find "$pkgdir/opt/kiro" -name "*.png" | head -n 1)
        if [ -n "$_found_icon" ]; then
            local _rel_path=${_found_icon#$pkgdir}
            ln -s "$_rel_path" "$pkgdir/usr/share/pixmaps/$_name.png"
        fi
    fi

    # License
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /opt/kiro/resources/app/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"

    # Shell Completions
    install -d "$pkgdir/usr/share/bash-completion/completions"
    install -d "$pkgdir/usr/share/zsh/site-functions"

    ln -s /opt/kiro/resources/completions/bash/$_name \
        "$pkgdir/usr/share/bash-completion/completions/$_name"
    ln -s /opt/kiro/resources/completions/zsh/_$_name \
        "$pkgdir/usr/share/zsh/site-functions/_$_name"

    # Desktop Integration
    install -Dm644 $_name.desktop "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 $_name-url-handler.desktop \
        "$pkgdir/usr/share/applications/$_name-url-handler.desktop"
    install -Dm644 $_name-workspace.xml "$pkgdir/usr/share/mime/packages/$_name-workspace.xml"
}
