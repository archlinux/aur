# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=kiro-ide
pkgver=0.12.292
pkgrel=1
epoch=1
pkgdesc='An agentic AI IDE with spec-driven development from prototype to production'
arch=(x86_64)
url='https://kiro.dev/'
# By downloading and using Kiro, you agree to the following:
#   AWS Customer Agreement: https://aws.amazon.com/agreement/
#   AWS Intellectual Property License: https://aws.amazon.com/legal/aws-ip-license-terms/
#   Service Terms: https://aws.amazon.com/service-terms/
#   Privacy Notice: https://aws.amazon.com/privacy/
license=(LicenseRef-Kiro)
depends=(alsa-lib
         at-spi2-core
         bash
         cairo
         curl
         dbus
         expat
         glib2
         glibc
         gtk3
         libcups
         libgcc
         libsecret
         libsoup3
         libstdc++
         libx11
         libxcb
         libxcomposite
         libxdamage
         libxext
         libxfixes
         libxkbcommon
         libxkbfile
         libxrandr
         mesa
         nspr
         nss
         openssl
         pango
         systemd-libs
         util-linux-libs)
conflicts=(kiro)
options=(!debug !strip)
_baseurl=https://prod.download.desktop.kiro.dev/releases/stable/linux-x64/signed/$pkgver/deb
source=("$pkgname-$pkgver.deb::$_baseurl/$pkgname-$pkgver-stable-linux-x64.deb"
        "$pkgname-$pkgver-deb-signature.bin::$_baseurl/signature.bin"
        "$pkgname-$pkgver-certificate.pem::$_baseurl/certificate.pem"
        "Kiro-LICENSE.txt")
b2sums=('2f0fc992c9fbbeda1e8dc7248e96f8576d168621459d41dacf50c0500afabdb759964442a88ea4886aa08dc022f749ead87829166d5d3c655cf12fec5f895739'
        '97af638009a834aa6db0b31a6d57b1fed1d1f5dcd750049084687b18f591212fd70b4458286a1d17af03d9961bf9551d59ac0b0ddb804db53694ec20004e9de0'
        '4cba4d51523a883653b28e04abc4a0e444d7672636153be9c99058b4469137ab2c591466d9452c5471e1577c6ce9a54edca28f14c01e6d66b36b72eb53f92bc8'
        '4fee11387ffa92e8fba85ca53dcd51906efb5aa0d581002510a66e63916e439c836539de374db5e5b5a4470a1790b6dc0348e7ceb555a8de4dd5210b6c0f7a01')

verify() {
    cd "$SRCDEST"
    openssl x509 -pubkey -noout -in $pkgname-$pkgver-certificate.pem > kiro-pubkey.pem
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

    install -d "$pkgdir/opt/Kiro"
    cp -a kiro/* "$pkgdir/opt/Kiro/"

    install -d "$pkgdir/usr/bin/"
    ln -s /opt/Kiro/bin/kiro "$pkgdir/usr/bin/kiro"

    install -Dm644 "$srcdir/Kiro-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    ln -s /opt/Kiro/LICENSES.chromium.html "$pkgdir/usr/share/licenses/$pkgname/LICENSES.chromium.html"

    install -Dm644 appdata/kiro.appdata.xml -t "$pkgdir/usr/share/metainfo"
    install -Dm644 applications/kiro.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 applications/kiro-url-handler.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 pixmaps/code-oss.png "$pkgdir/usr/share/pixmaps/kiro.png"
    install -Dm644 mime/packages/kiro-workspace.xml -t "$pkgdir/usr/share/mime/packages"
    install -Dm644 bash-completion/completions/kiro -t "$pkgdir/usr/share/bash-completion/completions"
    install -Dm644 zsh/vendor-completions/_kiro -t "$pkgdir/usr/share/zsh/site-functions"
}
