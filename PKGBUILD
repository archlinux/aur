# Maintainer: Toby Heath <heath-toby on GitHub>
# Co-author: Claude (Anthropic), via Claude Code

pkgname=cryptsetup-beep
pkgver=0.4.0
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
# sha256 pinned post-release — see the follow-up "Pin sha256 for v0.4.0" commit.
sha256sums=('65a4963da4a2cc26bad40543ce13b199ab9647516f7f7854b4b99a9792d4b57a')

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

    install -Dm644 data/beep.wav            "${pkgdir}/usr/share/cryptsetup-beep/beep.wav"
    install -Dm644 data/beep-retry.wav      "${pkgdir}/usr/share/cryptsetup-beep/beep-retry.wav"
    install -Dm644 data/beep-pin.wav        "${pkgdir}/usr/share/cryptsetup-beep/beep-pin.wav"
    install -Dm644 data/beep-pin-retry.wav  "${pkgdir}/usr/share/cryptsetup-beep/beep-pin-retry.wav"
    install -Dm644 data/config.example      "${pkgdir}/usr/share/cryptsetup-beep/config.example"
    install -Dm644 data/org.heath-toby.cryptsetup-beep.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.heath-toby.cryptsetup-beep.policy"

    install -Dm644 data/95-cryptsetup-beep-remove.hook \
        "${pkgdir}/usr/share/libalpm/hooks/95-cryptsetup-beep-remove.hook"
    install -Dm755 data/cryptsetup-beep-uninstall \
        "${pkgdir}/usr/share/libalpm/scripts/cryptsetup-beep-uninstall"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
