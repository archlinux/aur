# Maintainer: fecet <xiezej@gmail.com>
pkgname=asus-proart-px13-quirks
pkgver=0.20260519
pkgrel=8
pkgdesc="Hardware quirks for ASUS ProArt PX13 (HN7306EA): TAS2783 audio configs + MT7925 btusb autosuspend disable"
arch=('any')
url="https://aur.archlinux.org/packages/asus-proart-px13-quirks"
license=('CC0-1.0')
depends=('linux-cachyos-px13' 'alsa-ucm-conf' 'pipewire' 'wireplumber' 'linux-firmware-other>=1:20260519')
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
    'conf.d_amd-soundwire_ASUSTeK-ProArtPX13.conf'
    '51-amd-sdw-channels.conf'
    '99-echo-cancel.conf'
    'btusb-no-autosuspend.conf'
    'rt721-sdw-no-autosuspend.rules'
)
sha256sums=('8704e2350ece61e4fbfc6fab0e1555e9dadc4e50509f727c704cae137de7e372'
            '06feb24e7a3a5a5f59da7e0e1ed02c76b1b48e83a6942433ba232ae6c2dca138'
            'bbbc4eafdbdacfc9af5b58922bb21118da59c88320dae037925ceed5ebfa02ed'
            '3b618bc3d683014e1b8e38ec0217c0ea3de4a306fc2d1abb10b57d5a4483cb3b'
            'a426f056bb4fc3169fe68e8c08172379899e7f03edeb5199b5e7d6c06444444d'
            '2a68adee036530d1fa9e59fba0268d414c31f7c5d4b2ea1e93a11ceb469f4642'
            '289f0457bebb51a1a6e2f6a555ebea829b484be837361afc71f7a81fee1e323c'
            'aa36adef4d19feb795c68324276896bc710767b80820957d76f75911d151e755')

package() {
    # tas2783 firmware ships in linux-firmware-other >= 1:20260519 at
    # ti/audio/tas2783/1714-1-0x{8,B}.bin.zst (Arch zst-compresses). The
    # kernel requests the flat names 1714-1-{8,B}.bin
    # (tas_generate_fw_name: "%04X-%1X-%1X.bin") and falls back to the
    # .zst variant transparently, so symlink both ends as .zst.
    # Byte-identical to the vendor-extracted firmware (same upstream sha256).
    install -d "${pkgdir}/usr/lib/firmware"
    ln -s ti/audio/tas2783/1714-1-0x8.bin.zst "${pkgdir}/usr/lib/firmware/1714-1-8.bin.zst"
    ln -s ti/audio/tas2783/1714-1-0xB.bin.zst "${pkgdir}/usr/lib/firmware/1714-1-B.bin.zst"

    # ALSA UCM device files (new files in alsa-ucm-conf namespace, no conflict)
    install -Dm644 "${srcdir}/codecs_tas2783_init.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/codecs/tas2783/init.conf"
    install -Dm644 "${srcdir}/sof-soundwire_tas2783.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/sof-soundwire/tas2783.conf"
    install -Dm644 "${srcdir}/sof-soundwire_acp-dmic.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/sof-soundwire/acp-dmic.conf"

    # UCM card-longname override: replays upstream sof-soundwire master + adds
    # the missing tas2783 spk_init branch, via alsa-ucm-conf's confd1 lookup
    # (Driver=amd-soundwire, CardLongName=ASUSTeK...HN7306EAC). Beats the
    # driver-default trampoline only for our card; pacman -Qkk stays clean.
    install -Dm644 "${srcdir}/conf.d_amd-soundwire_ASUSTeK-ProArtPX13.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/conf.d/amd-soundwire/ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC.conf"

    # PipeWire & WirePlumber vendor drop-ins
    install -Dm644 "${srcdir}/99-echo-cancel.conf" \
        "${pkgdir}/usr/share/pipewire/pipewire.conf.d/99-echo-cancel.conf"
    install -Dm644 "${srcdir}/51-amd-sdw-channels.conf" \
        "${pkgdir}/usr/share/wireplumber/wireplumber.conf.d/51-amd-sdw-channels.conf"

    # MT7925 btusb autosuspend quirk (vendor modprobe.d slot)
    install -Dm644 "${srcdir}/btusb-no-autosuspend.conf" \
        "${pkgdir}/usr/lib/modprobe.d/btusb-no-autosuspend.conf"
    install -Dm644 "${srcdir}/rt721-sdw-no-autosuspend.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-rt721-sdw-no-autosuspend.rules"
}
