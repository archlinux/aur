# Maintainer: fecet <xiezej@gmail.com>
pkgname=asus-proart-px13-quirks
pkgver=0.20260517
pkgrel=1
pkgdesc="Hardware quirks for ASUS ProArt PX13 (HN7306EA): TAS2783 audio configs + MT7925 btusb autosuspend disable"
arch=('any')
url="https://aur.archlinux.org/packages/asus-proart-px13-quirks"
license=('CC0-1.0')
depends=('linux-cachyos-px13' 'alsa-ucm-conf' 'pipewire' 'wireplumber')
optdepends=(
    'sof-firmware: SOF firmware for AMD ACP'
    'alsa-utils: alsactl store to persist channel assignments'
    'bluez: enables the BT stack the btusb quirk applies to'
)
replaces=('px13-audio-fix' 'px13-quirks' 'proart-px13')
conflicts=('px13-audio-fix' 'px13-quirks' 'proart-px13')
install=${pkgname}.install
source=(
    'codecs_tas2783_init.conf'
    'sof-soundwire_tas2783.conf'
    'sof-soundwire_acp-dmic.conf'
    '51-amd-sdw-channels.conf'
    '99-echo-cancel.conf'
    'btusb-no-autosuspend.conf'
    "${pkgname}.hook"
    'patch-ucm.sh'
)
sha256sums=('8704e2350ece61e4fbfc6fab0e1555e9dadc4e50509f727c704cae137de7e372'
            '0e553ee4e084c53fa143622c1664d39398736c7d29f7377ecbe885907a2a43c8'
            'bbbc4eafdbdacfc9af5b58922bb21118da59c88320dae037925ceed5ebfa02ed'
            'a426f056bb4fc3169fe68e8c08172379899e7f03edeb5199b5e7d6c06444444d'
            '2a68adee036530d1fa9e59fba0268d414c31f7c5d4b2ea1e93a11ceb469f4642'
            '289f0457bebb51a1a6e2f6a555ebea829b484be837361afc71f7a81fee1e323c'
            'fe26989f6f0c6a42677dc5e64ae3cff3d1563b0024d9ae0e430a1164823000b2'
            'fbc718da474245fcbb1393a4f9d4ad17fb6a4e545cb40435a3ae8538e5bb5511')

package() {
    # ALSA UCM configs (system-wide)
    install -Dm644 "${srcdir}/codecs_tas2783_init.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/codecs/tas2783/init.conf"
    install -Dm644 "${srcdir}/sof-soundwire_tas2783.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/sof-soundwire/tas2783.conf"
    install -Dm644 "${srcdir}/sof-soundwire_acp-dmic.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/sof-soundwire/acp-dmic.conf"

    # PipeWire & WirePlumber vendor drop-ins
    install -Dm644 "${srcdir}/99-echo-cancel.conf" \
        "${pkgdir}/usr/share/pipewire/pipewire.conf.d/99-echo-cancel.conf"
    install -Dm644 "${srcdir}/51-amd-sdw-channels.conf" \
        "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d/51-amd-sdw-channels.conf"

    # MT7925 btusb autosuspend quirk (vendor modprobe.d slot)
    install -Dm644 "${srcdir}/btusb-no-autosuspend.conf" \
        "${pkgdir}/usr/lib/modprobe.d/btusb-no-autosuspend.conf"

    # Pacman hook + helper to re-patch sof-soundwire.conf after alsa-ucm-conf upgrades
    install -Dm644 "${srcdir}/${pkgname}.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/95-${pkgname}.hook"
    install -Dm755 "${srcdir}/patch-ucm.sh" \
        "${pkgdir}/usr/share/${pkgname}/patch-ucm.sh"
}
