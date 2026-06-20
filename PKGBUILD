# Maintainer: fecet <xiezej@gmail.com>
pkgname=asus-proart-px13-quirks
# Userspace quirks paired with the linux-cachyos-px13 kernel; pkgver tracks that
# kernel's version (the TAS2783 codec + s2idle audio patches live in-tree there,
# not in a DKMS module here). Bump pkgver alongside the kernel; pkgrel for
# packaging-only changes. epoch=1 supersedes the short-lived date-based pkgver.
epoch=1
pkgver=7.0.11
pkgrel=3
pkgdesc="Userspace quirks for ASUS ProArt PX13 (HN7306EA): TAS2783/ACP UCM + PipeWire/WirePlumber drop-ins + MT7925 btusb autosuspend + TAS2783 firmware symlinks"
arch=('any')
url="https://aur.archlinux.org/packages/asus-proart-px13-quirks"
license=('CC0-1.0')
# alsa-ucm-conf is pinned EXACTLY: the conf.d redirect is a verbatim inline copy of
# that version's sof-soundwire.conf (+ 2 PX13 deltas). When alsa-ucm-conf restructures
# the master (e.g. 1.2.16.1 added ${var:SpeakerCodecFile}), a stale copy aborts the UCM
# import and speakers fall silent. The exact pin turns that into a loud pacman conflict
# on -Syu; re-sync the redirect (see conf.d header) and bump this version + pkgrel.
depends=("linux-cachyos-px13>=${pkgver}" 'alsa-ucm-conf=1.2.16.1' 'pipewire' 'wireplumber' 'linux-firmware-other>=1:20260519')
optdepends=(
    'sof-firmware: SOF firmware for AMD ACP'
    'alsa-utils: alsactl store to persist channel assignments'
    'bluez: enables the BT stack the btusb quirk applies to'
)

source=(
    'codecs_tas2783_init.conf'
    'sof-soundwire_tas2783.conf'
    'conf.d_amd-soundwire_ASUSTeK-ProArtPX13.conf'
    '51-amd-sdw-channels.conf'
    '99-echo-cancel.conf'
    'btusb-no-autosuspend.conf'
    'rt721-sdw-no-autosuspend.rules'
)
sha256sums=('8704e2350ece61e4fbfc6fab0e1555e9dadc4e50509f727c704cae137de7e372'
            '674154c05efa457991654fbb5c09bd0eb40139d8e22fd0b0e971500baf8eb012'
            '3f824d1905d50700760930146bf78b340432186a2dc6711f60bc1559d2c86183'
            'a426f056bb4fc3169fe68e8c08172379899e7f03edeb5199b5e7d6c06444444d'
            '2a68adee036530d1fa9e59fba0268d414c31f7c5d4b2ea1e93a11ceb469f4642'
            '289f0457bebb51a1a6e2f6a555ebea829b484be837361afc71f7a81fee1e323c'
            'aa36adef4d19feb795c68324276896bc710767b80820957d76f75911d151e755')

package() {
    # tas2783 firmware ships in linux-firmware-other >= 1:20260519 at
    # ti/audio/tas2783/1714-1-0x{8,B}.bin.zst (Arch zst-compresses). The kernel
    # requests the flat names 1714-1-{8,B}.bin and falls back to .zst, so
    # symlink both ends as .zst.
    install -d "${pkgdir}/usr/lib/firmware"
    ln -s ti/audio/tas2783/1714-1-0x8.bin.zst "${pkgdir}/usr/lib/firmware/1714-1-8.bin.zst"
    ln -s ti/audio/tas2783/1714-1-0xB.bin.zst "${pkgdir}/usr/lib/firmware/1714-1-B.bin.zst"

    # ALSA UCM device files for tas2783 (alsa-ucm-conf ships no tas2783 support).
    # acp-dmic.conf is intentionally NOT shipped: alsa-ucm-conf >= 1.2.16 owns
    # sof-soundwire/acp-dmic.conf, and the conf.d redirect reuses upstream's copy.
    install -Dm644 "${srcdir}/codecs_tas2783_init.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/codecs/tas2783/init.conf"
    install -Dm644 "${srcdir}/sof-soundwire_tas2783.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/sof-soundwire/tas2783.conf"

    # UCM card-longname override: inlines the upstream amd-soundwire trampoline +
    # tas2783 spk_init + AMD ACP70 DMIC redirect (device 4). Beats the
    # driver-default trampoline only for our card; pacman -Qkk stays clean.
    #
    # UCM probes conf.d/${driver}/${CardLongName}.conf by exact filename (no
    # glob). The PX13 ships under two firmware SKUs whose DMI board_name differs
    # by one char, so the kernel builds two distinct long names:
    #   HN7306EAC -> ...ProArtPX13HN7306EAC-1.0-HN7306EAC
    #   HN7306EA  -> ...ProArtPX13HN7306EA-1.0-HN7306EA
    # Install one body and symlink the other long name to it (single source).
    install -Dm644 "${srcdir}/conf.d_amd-soundwire_ASUSTeK-ProArtPX13.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/conf.d/amd-soundwire/ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC.conf"
    ln -s "ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EAC-1.0-HN7306EAC.conf" \
        "${pkgdir}/usr/share/alsa/ucm2/conf.d/amd-soundwire/ASUSTeKCOMPUTERINC.-ProArtPX13HN7306EA-1.0-HN7306EA.conf"

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
