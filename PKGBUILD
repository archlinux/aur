# Maintainer: Toby Heath <heath-toby on GitHub>
# Co-author: Claude (Anthropic), via Claude Code

pkgname=cryptsetup-beep
pkgver=0.1.0
pkgrel=1
pkgdesc='Audible cue when systemd-cryptsetup prompts for a LUKS passphrase in initramfs'
arch=('any')
url='https://github.com/heath-toby/cryptsetup-beep'
license=('MIT')
depends=('python' 'python-gobject' 'gtk3' 'mkinitcpio' 'systemd' 'polkit' 'alsa-utils')
optdepends=(
    'beep: required for PC-speaker mode'
    'orca: spoken feedback in the setup wizard'
)
install=cryptsetup-beep.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('645cc90bc5a7849b26872650b637c49f579f27d9083e0277d9910c9e00a01de1')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 src/bin/cryptsetup-beep "${pkgdir}/usr/bin/cryptsetup-beep"
    install -Dm755 scripts/play-beep.sh "${pkgdir}/usr/lib/cryptsetup-beep/play-beep.sh"

    install -d "${pkgdir}/usr/lib/cryptsetup-beep/cryptsetup_beep"
    install -m644 src/cryptsetup_beep/*.py \
        "${pkgdir}/usr/lib/cryptsetup-beep/cryptsetup_beep/"

    install -Dm644 units/cryptsetup-beep.path \
        "${pkgdir}/usr/lib/systemd/system/cryptsetup-beep.path"
    install -Dm644 units/cryptsetup-beep.service \
        "${pkgdir}/usr/lib/systemd/system/cryptsetup-beep.service"

    install -Dm755 initcpio/install-hook \
        "${pkgdir}/usr/lib/initcpio/install/cryptsetup-beep"

    install -Dm644 data/beep.wav "${pkgdir}/usr/share/cryptsetup-beep/beep.wav"
    install -Dm644 data/config.example "${pkgdir}/usr/share/cryptsetup-beep/config.example"
    install -Dm644 data/org.heath-toby.cryptsetup-beep.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.heath-toby.cryptsetup-beep.policy"

    install -Dm644 data/95-cryptsetup-beep-remove.hook \
        "${pkgdir}/usr/share/libalpm/hooks/95-cryptsetup-beep-remove.hook"
    install -Dm755 data/cryptsetup-beep-uninstall \
        "${pkgdir}/usr/share/libalpm/scripts/cryptsetup-beep-uninstall"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
