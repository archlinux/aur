# Maintainer: stickpro <your@email.com>
pkgname=kyp-gui
pkgver=0.2.1
pkgrel=1
pkgdesc="Keep Your Passwords — local-first GUI password manager with TOTP support"
arch=('x86_64')
url="https://github.com/stickpro/kyp"
license=('MIT')
keywords=('password-manager' 'passwords' 'totp' '2fa' 'gui' 'security' 'encryption' 'sqlite')
provides=('kyp-gui')
conflicts=('kyp-gui-bin' 'kyp-gui-git')
depends=('webkit2gtk-4.1' 'gtk3')
makedepends=('go' 'npm' 'nodejs')
source=("https://github.com/stickpro/kyp/archive/v${pkgver}.tar.gz")
sha256sums=('e95da60458f0a3da091378429c7676b3d8cd119fc3ebddbc4c63a64be32bc35b')

build() {
    cd "kyp-${pkgver}/cmd/kyp-gui/frontend"
    npm install
    npm run build

    cd "${srcdir}/kyp-${pkgver}"
    CGO_ENABLED=1 go build \
        -tags webkit2_41 \
        -ldflags "-s -w" \
        -o kyp-gui \
        ./cmd/kyp-gui
}

package() {
    cd "kyp-${pkgver}"
    install -Dm755 kyp-gui "${pkgdir}/usr/bin/kyp-gui"
    install -Dm644 cmd/kyp-gui/build/linux/kyp-gui.desktop \
        "${pkgdir}/usr/share/applications/kyp-gui.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}