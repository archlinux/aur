# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-ide
pkgver=0.7.45
pkgrel=1
epoch=1
pkgdesc='An agentic AI IDE with spec-driven development from prototype to production'
arch=('x86_64')
url='https://kiro.dev/'
# By downloading and using Kiro, you agree to the following:
#   AWS Customer Agreement: https://aws.amazon.com/agreement/
#   AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
#   Service Terms: https://aws.amazon.com/service-terms/
#   Privacy Notice: https://aws.amazon.com/privacy/
license=('LicenseRef-Kiro')
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
    'nspr'
    'nss'
    'pango'
    'systemd-libs'
)
conflicts=('kiro')
options=('!debug' '!strip')
_baseurl=https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed/$pkgver/deb
source=("$pkgname-$pkgver.deb::$_baseurl/$pkgname-$pkgver-stable-linux-x64.deb"
        "$pkgname-$pkgver-deb-signature.bin::$_baseurl/signature.bin"
        "$pkgname-certificate.pem::$_baseurl/certificate.pem"
        "Kiro-LICENSE.txt")
b2sums=('70b56e6c3e457144b0c4a410705d930bbcb3f0635692935ed2a16b2d7b913321603a06bb79f714f6859be0898e2d72a1d9284c8dafbe44b624d2600411a3f228'
        '6d115d52cdece1e76bbc58fbffa0a4842a76120db6c3cca68947172a873f3a593c08fd3af018e07ffeb27f78fa46912fb48ad0c8c797ed261993f9dfcfd9d6e4'
        '09676f21f9b2821f7fb789fde98f1825f53d1df64ab74932ec2117f6cf06985bc5795ea7a016d90e9318035b2dd7c2f9706dccf44eb4cd092e4268a5f4760a26'
        '4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')

verify() {
    cd "$SRCDEST"
    openssl x509 -pubkey -noout -in $pkgname-certificate.pem > kiro-pubkey.pem
    openssl dgst -sha256 -verify kiro-pubkey.pem -signature $pkgname-$pkgver-deb-signature.bin \
        $pkgname-$pkgver.deb
}

prepare() {
    tar -xpf data.tar.xz
    sed -i -e 's|/usr/share/kiro|/opt/Kiro|g' -e 's|Icon=code-oss|Icon=kiro|g' \
        usr/share/applications/*.desktop
}

package() {
    cd usr/share

    install -dm755 "$pkgdir/opt/Kiro"
    cp -a kiro/* "$pkgdir/opt/Kiro"

    install -dm755 "$pkgdir/usr/bin/"
    ln -s /opt/Kiro/bin/kiro "$pkgdir/usr/bin/kiro"

    install -Dm644 "$srcdir/Kiro-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    ln -s /opt/Kiro/LICENSES.chromium.html "$pkgdir/usr/share/licenses/LICENSES.chromium.html"

    install -Dm644 appdata/kiro.appdata.xml "$pkgdir/usr/share/metainfo/kiro.appdata.xml"
    install -Dm644 applications/kiro.desktop "$pkgdir/usr/share/applications/kiro.desktop"
    install -Dm644 applications/kiro-url-handler.desktop "$pkgdir/usr/share/applications/kiro-url-handler.desktop"
    install -Dm644 pixmaps/code-oss.png "$pkgdir/usr/share/pixmaps/kiro.png"
    install -Dm644 mime/packages/kiro-workspace.xml "$pkgdir/usr/share/mime/packages/kiro-workspace.xml"
    install -Dm644 bash-completion/completions/kiro "$pkgdir/usr/share/bash-completion/completions/kiro"
    install -Dm644 zsh/vendor-completions/_kiro "$pkgdir/usr/share/zsh/site-functions/_kiro"
}
