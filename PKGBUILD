# Maintainer: kevku <kevku@gmx.com>
pkgname=chrome-token-signing
pkgver=1.1.2.517
pkgrel=1
epoch=1
pkgdesc="Chrome and Firefox extension for signing with your eID on the web"
arch=('x86_64' 'i686')
url="http://www.id.ee/"
license=('LGPL2.1')
depends=('qt5-base' 'pcsclite' 'ccid')
makedepends=('lsb-release')
source=("https://installer.id.ee/media/ubuntu/pool/main/c/$pkgname/${pkgname}_$pkgver-1604.tar.xz")
sha256sums=('5d012c8ee0b6ccb5da6b7b125d2f921cb047cfdc3bad65fcc38ff6de387a4a91')

build() {
    cd "$srcdir/$pkgname/"
    export BUILD_NUMBER=${pkgver##*.}
    make -C host-linux
}

package() {
    cd "$srcdir/$pkgname/"
    # Istall files
    install -Dm755 ./host-linux/chrome-token-signing -t "$pkgdir/usr/bin"
    install -Dm644 ./host-linux/ee.ria.esteid.json -t "$pkgdir/usr/share/chrome-token-signing"
    install -Dm644 ./host-linux/ee.ria.chrome-token-signing.policy.json -t "$pkgdir/usr/share/chrome-token-signing"
    install -Dm644 ./host-linux/ff/ee.ria.esteid.json -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts"
    install -Dm644 ./ckjefchnfjhjfedoccjbhjpbncimppeg.json -t "$pkgdir/usr/share/chrome-token-signing"
    install -Dm644 ./\{443830f0-1fff-4f9a-aa1e-444bafbc7319\}.xpi -t "$pkgdir/usr/share/mozilla/extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"

    # Create links
    mkdir -p $pkgdir/etc/{chromium,chromium-browser}/native-messaging-hosts
    mkdir -p $pkgdir/etc/{chromium,chromium-browser}/policies/managed
    mkdir -p $pkgdir/usr/share/{google-chrome,chromium,chromium-browser}/extensions
    ln -sf "/usr/share/chrome-token-signing/ee.ria.esteid.json" "$pkgdir/etc/chromium/native-messaging-hosts/ee.ria.esteid.json"
    ln -sf "/usr/share/chrome-token-signing/ee.ria.esteid.json" "$pkgdir/etc/chromium-browser/native-messaging-hosts/ee.ria.esteid.json"
    ln -sf "/usr/share/chrome-token-signing/ckjefchnfjhjfedoccjbhjpbncimppeg.json" "$pkgdir/usr/share/chromium/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json"
    ln -sf "/usr/share/chrome-token-signing/ckjefchnfjhjfedoccjbhjpbncimppeg.json" "$pkgdir/usr/share/chromium-browser/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json"
    ln -sf "/usr/share/chrome-token-signing/ckjefchnfjhjfedoccjbhjpbncimppeg.json" "$pkgdir/usr/share/google-chrome/extensions/ckjefchnfjhjfedoccjbhjpbncimppeg.json"
    ln -sf "/usr/share/chrome-token-signing/ee.ria.chrome-token-signing.policy.json" "$pkgdir/etc/chromium/policies/managed/ee.ria.chrome-token-signing.policy.json"
    ln -sf "/usr/share/chrome-token-signing/ee.ria.chrome-token-signing.policy.json" "$pkgdir/etc/chromium-browser/policies/managed/ee.ria.chrome-token-signing.policy.json"
}
