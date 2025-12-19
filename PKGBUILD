# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-ide
pkgver=0.8.0
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
b2sums=('a8cd96d30b6379d3281ec9449403eb9aeecf0ae2e643bf34d1c67576b10393a435f00cbf02e0ef8160801688da9fab2e35f9bb37ccc08e061a6d724a889e7308'
        '3df70e3f05bf6abb47a7ab784d3761e2a9271dc1711e3dc4340ec64bf1484e09dde5bf0b140e20dba625c51624080ec4e8df40d624b9508f5cfc8709210f722c'
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
