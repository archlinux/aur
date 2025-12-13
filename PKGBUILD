# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-ide
pkgver=0.7.45
pkgrel=1
epoch=1
pkgdesc='The AI IDE for prototype to production'
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
_baseurl=https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed/$pkgver/tar
source=(
    "$pkgname-$pkgver.tar.gz::$_baseurl/$pkgname-$pkgver-stable-linux-x64.tar.gz"
    "$pkgname-certificate.pem::$_baseurl/certificate.pem"
    "$pkgname-$pkgver-signature.bin::$_baseurl/signature.bin"
    "kiro.desktop"
    "kiro-url-handler.desktop"
    "kiro-workspace.xml"
    "Kiro-LICENSE.txt"
)
b2sums=('3dad69f765dfdca03666b4b1ef8a502b4112cfa007dfdd62b80f2d4e52604e2a8527982ae5b93b4e8889844f5107a8acecf91635c59db299f4aac9f4981bc40d'
        '09676f21f9b2821f7fb789fde98f1825f53d1df64ab74932ec2117f6cf06985bc5795ea7a016d90e9318035b2dd7c2f9706dccf44eb4cd092e4268a5f4760a26'
        '0a7b78dc712d986592621b3a635e14a2f4ba31e3e3484c261cfb189555e921f706d15a5a7f4f9812b87f5309d44e8d3776e2f469a2052fef5937abcedd80224b'
        'd7afb1d5c54c8789e21e0f598837af95f52ea6e8f99708d38c7166b926022ce88cfd246b5fc530f5f1dbfbde1b4633658e441af7356cdee289013e363bd7eab8'
        '7c4eca51844645ee6e642be3cdeb3120ebd4fe308d7f60236b2118536bf5717aff23bb71a308978e491275cdb2ef2e78a295d1554553add681071b909d72ac6b'
        'c422bc883f40209fb165740fdf339911de868acc8a72033730ac07e3c5fd76604737b7efe0b4f894b70520dbd214c5504bd34c284e7c1f0a4438f1f35eee0dbb'
        '4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')

verify() {
    cd "$SRCDEST"
    openssl x509 -pubkey -noout -in $pkgname-certificate.pem > kiro-pubkey.pem
    openssl dgst -sha256 -verify kiro-pubkey.pem -signature $pkgname-$pkgver-signature.bin \
        $pkgname-$pkgver.tar.gz
}

package() {
    install -dm755 "$pkgdir/opt/Kiro"
    cp -a Kiro/* "$pkgdir/opt/Kiro"
    chmod 4755 "$pkgdir/opt/Kiro/chrome-sandbox"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/Kiro/bin/kiro "$pkgdir/usr/bin/kiro"

    install -Dm644 Kiro-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 Kiro/LICENSES.chromium.html \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

    install -dm755 "$pkgdir/usr/share/pixmaps"
    ln -s /opt/Kiro/resources/app/resources/linux/code.png "$pkgdir/usr/share/pixmaps/kiro.png"

    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    ln -s /opt/Kiro/resources/completions/bash/kiro \
        "$pkgdir/usr/share/bash-completion/completions/kiro"
    ln -s /opt/Kiro/resources/completions/zsh/_kiro \
        "$pkgdir/usr/share/zsh/site-functions/_kiro"

    install -Dm644 kiro.desktop \
        "$pkgdir/usr/share/applications/kiro.desktop"
    install -Dm644 kiro-url-handler.desktop \
        "$pkgdir/usr/share/applications/kiro-url-handler.desktop"
    install -Dm644 kiro-workspace.xml \
        "$pkgdir/usr/share/mime/packages/kiro-workspace.xml"
}
