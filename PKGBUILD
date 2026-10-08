# Maintainer: hitalin <https://github.com/hitalin>
# split package: アプリ (misskey-notedeck-bin、AI の別プロセス notemaid を同梱) / CLI (notecli-bin) を
# 同じタグの Release から同版で出す (#1106)。sha256sums は release.yml が実値で埋める
pkgbase=misskey-notedeck-bin
pkgname=('misskey-notedeck-bin' 'notecli-bin')
pkgver=1.82.0
pkgrel=1
arch=('x86_64')
url='https://github.com/notedeck-dev/notedeck'
license=('AGPL-3.0-or-later')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/notedeck-dev/notedeck/releases/download/v${pkgver}/NoteDeck-${pkgver}-linux-x64.tar.gz"
        "notecli-${pkgver}-linux-amd64::https://github.com/notedeck-dev/notedeck/releases/download/v${pkgver}/notecli-${pkgver}-linux-amd64"
        "notedeck.desktop"
        "notedeck-icon-128.png::https://raw.githubusercontent.com/notedeck-dev/notedeck/v${pkgver}/src-tauri/icons/128x128.png"
        "notedeck-icon-32.png::https://raw.githubusercontent.com/notedeck-dev/notedeck/v${pkgver}/src-tauri/icons/32x32.png")
sha256sums=('628a62353cb163efdcfb0e6f5afbf22de92692430c3c702fa4519473a0f7983f'
            '2c13ff971e2e6ec000866f814b5463eaa341dc97d9fcea2bebefc4ffa1b77669'
            '402b528d0bc1d1747ad0aba623994ab4b3efa24ad3877c80bb9c8e31d2775ba5'
            '20ccfc14895ab30ee165475cb8a5121711114fcab0226a2516db8dd6d0a7e017'
            '4b4d94d68706298000bed6f1dff338a06bb13de2ab6587cf2db65bb992bb5693')

package_misskey-notedeck-bin() {
    pkgdesc='Misskey Pro — integrated deck environment (IDE) for Misskey power users'
    depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'librsvg' 'glib-networking')
    optdepends=("notecli-bin=${pkgver}: CLI")
    provides=('notedeck' 'notemaid')
    conflicts=('notedeck' 'notedeck-bin' 'notemaid-bin')
    install -Dm755 "${srcdir}/notedeck" "${pkgdir}/usr/bin/notedeck"
    # AI の別プロセス (アプリが子プロセスとして起動する。常駐はアプリのトグルか notemaid service enable)
    install -Dm755 "${srcdir}/notemaid" "${pkgdir}/usr/bin/notemaid"
    install -Dm644 "${srcdir}/notemaid.service" "${pkgdir}/usr/lib/systemd/user/notemaid.service"
    install -Dm644 "${srcdir}/notedeck.desktop" "${pkgdir}/usr/share/applications/com.notedeck.desktop.desktop"
    install -Dm644 "${srcdir}/notedeck-icon-128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/com.notedeck.desktop.png"
    install -Dm644 "${srcdir}/notedeck-icon-32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/com.notedeck.desktop.png"
}

package_notecli-bin() {
    pkgdesc='Misskey CLI from NoteDeck'
    provides=('notecli')
    conflicts=('notecli')
    install -Dm755 "${srcdir}/notecli-${pkgver}-linux-amd64" "${pkgdir}/usr/bin/notecli"
}
