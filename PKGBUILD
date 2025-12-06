# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-bin
_name="${pkgname%-bin}"
pkgver=0.7.21
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
provides=("$_name")
conflicts=("$_name")
options=('!debug' '!strip')
_baseurl=https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed/$pkgver/tar
source=(
    "$_name-$pkgver.tar.gz::$_baseurl/kiro-ide-$pkgver-stable-linux-x64.tar.gz"
    "$_name-certificate.pem::$_baseurl/certificate.pem"
    "$_name-$pkgver-signature.bin::$_baseurl/signature.bin"
    "$_name.desktop"
    "$_name-url-handler.desktop"
    "$_name-workspace.xml"
    "Kiro-LICENSE.txt"
)
b2sums=('f581fdf4023a16a81d01a63fff233f09ed3a1cb23c3553ce19961490d283d77aacf65df6d614e12387dac5bb449da96a65b757a6f2016001f61b816c210fbd0f'
        '09676f21f9b2821f7fb789fde98f1825f53d1df64ab74932ec2117f6cf06985bc5795ea7a016d90e9318035b2dd7c2f9706dccf44eb4cd092e4268a5f4760a26'
        'a71a3443042ef1723ce67962e0918d15712a1c90a876042b81b7f59553c18cad73a6dabeb332031f123419c8b98272fccff3353060bec4e9fe54a989bf4d84fd'
        'd7afb1d5c54c8789e21e0f598837af95f52ea6e8f99708d38c7166b926022ce88cfd246b5fc530f5f1dbfbde1b4633658e441af7356cdee289013e363bd7eab8'
        '7c4eca51844645ee6e642be3cdeb3120ebd4fe308d7f60236b2118536bf5717aff23bb71a308978e491275cdb2ef2e78a295d1554553add681071b909d72ac6b'
        'c422bc883f40209fb165740fdf339911de868acc8a72033730ac07e3c5fd76604737b7efe0b4f894b70520dbd214c5504bd34c284e7c1f0a4438f1f35eee0dbb'
        '4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')

verify() {
    cd "$SRCDEST"
    openssl x509 -pubkey -noout -in $_name-certificate.pem > kiro-pubkey.pem
    openssl dgst -sha256 -verify kiro-pubkey.pem -signature $_name-$pkgver-signature.bin \
        $_name-$pkgver.tar.gz
}

package() {
    install -dm755 "$pkgdir/opt/Kiro"
    cp -a Kiro/* "$pkgdir/opt/Kiro"
    chmod 4755 "$pkgdir/opt/Kiro/chrome-sandbox"

    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/Kiro/bin/$_name "$pkgdir/usr/bin/$_name"

    install -Dm644 Kiro-LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 Kiro/LICENSES.chromium.html \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

    install -dm755 "$pkgdir/usr/share/pixmaps"
    ln -s /opt/Kiro/resources/app/resources/linux/code.png "$pkgdir/usr/share/pixmaps/$_name.png"

    install -dm755 "$pkgdir/usr/share/bash-completion/completions"
    install -dm755 "$pkgdir/usr/share/zsh/site-functions"
    ln -s /opt/Kiro/resources/completions/bash/$_name \
        "$pkgdir/usr/share/bash-completion/completions/$_name"
    ln -s /opt/Kiro/resources/completions/zsh/_$_name \
        "$pkgdir/usr/share/zsh/site-functions/_$_name"

    install -Dm644 $_name.desktop \
        "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 $_name-url-handler.desktop \
        "$pkgdir/usr/share/applications/$_name-url-handler.desktop"
    install -Dm644 $_name-workspace.xml \
        "$pkgdir/usr/share/mime/packages/$_name-workspace.xml"
}
