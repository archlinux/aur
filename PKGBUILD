# Maintainer: fecet <xiezej@gmail.com>
pkgname=asus-proart-px13-quirks
pkgver=0.20260519
pkgrel=6
pkgdesc="Hardware quirks for ASUS ProArt PX13 (HN7306EA): TAS2783 audio configs + MT7925 btusb autosuspend disable"
arch=('any')
url="https://aur.archlinux.org/packages/asus-proart-px13-quirks"
license=('CC0-1.0' 'custom')
depends=('linux-cachyos-px13' 'alsa-ucm-conf' 'pipewire' 'wireplumber')
makedepends=('icoutils' '7zip')
optdepends=(
    'sof-firmware: SOF firmware for AMD ACP'
    'alsa-utils: alsactl store to persist channel assignments'
    'bluez: enables the BT stack the btusb quirk applies to'
)
options=('!strip')
replaces=('px13-audio-fix' 'px13-quirks' 'proart-px13')
conflicts=('px13-audio-fix' 'px13-quirks' 'proart-px13')
install=${pkgname}.install

_installer="SmartAMP_TI_DCH_TexasInstruments_Z_V6.3.1.15_47519.exe"
_firmware_8="1714-1-0x8.bin"
_firmware_b="1714-1-0xB.bin"
_firmware_8_sha256="9a105de50978fc3250062d66bea6b77f3aaabaf85280739be28ff1ed3ae535ca"
_firmware_b_sha256="a975dc7e2340cb5c97259d5e8c3d7e447b5a0af1a91528c058c9fda0adeb74c1"

source=(
    'codecs_tas2783_init.conf'
    'sof-soundwire_tas2783.conf'
    'sof-soundwire_acp-dmic.conf'
    '51-amd-sdw-channels.conf'
    '99-echo-cancel.conf'
    'btusb-no-autosuspend.conf'
    'rt721-sdw-no-autosuspend.rules'
    "${pkgname}.hook"
    'patch-ucm.sh'
    "${_installer}::https://dlcdnets.asus.com/pub/ASUS/nb/Image/Driver/Audio/47519/${_installer}?model=HN7306EAC"
)
noextract=("${_installer}")
sha256sums=('8704e2350ece61e4fbfc6fab0e1555e9dadc4e50509f727c704cae137de7e372'
            '0e553ee4e084c53fa143622c1664d39398736c7d29f7377ecbe885907a2a43c8'
            'bbbc4eafdbdacfc9af5b58922bb21118da59c88320dae037925ceed5ebfa02ed'
            'a426f056bb4fc3169fe68e8c08172379899e7f03edeb5199b5e7d6c06444444d'
            '2a68adee036530d1fa9e59fba0268d414c31f7c5d4b2ea1e93a11ceb469f4642'
            '289f0457bebb51a1a6e2f6a555ebea829b484be837361afc71f7a81fee1e323c'
            'aa36adef4d19feb795c68324276896bc710767b80820957d76f75911d151e755'
            '91e930cc812fa1798954c00d33df32f7f415c2559a6667ada5350e14b4ac7028'
            'a40616569d771b377dfd380c1f81e1b7adbc34d7b83293335503259124733d4e'
            '8728835795be467d39c721b6245e6e038d44fcbf0d0e49718ef45cb44eb8a3ce')

package() {
    local work="${srcdir}/firmware"

    rm -rf "${work}"
    install -d "${work}/out"

    wrestool -x --raw --type=ZIP --name=103 "${srcdir}/${_installer}" > "${work}/firmwares.7z"
    7z x "${work}/firmwares.7z" -o"${work}/out" \
        "Firmwares/${_firmware_8}" "Firmwares/${_firmware_b}" -y >/dev/null

    local name want got
    for entry in "${_firmware_8}:${_firmware_8_sha256}" "${_firmware_b}:${_firmware_b_sha256}"; do
        name=${entry%%:*}
        want=${entry##*:}
        got=$(sha256sum "${work}/out/Firmwares/${name}" | awk '{print $1}')
        if [[ ${got} != "${want}" ]]; then
            echo "FAIL: ${name} hash mismatch (expected ${want}, got ${got})" >&2
            exit 1
        fi
    done

    install -Dm644 "${work}/out/Firmwares/${_firmware_8}" "${pkgdir}/usr/lib/firmware/1714-1-8.bin"
    install -Dm644 "${work}/out/Firmwares/${_firmware_b}" "${pkgdir}/usr/lib/firmware/1714-1-B.bin"
    install -Dm644 "${work}/out/Firmwares/${_firmware_8}" "${pkgdir}/usr/lib/firmware/ti/audio/tas2783/1714-1-8.bin"
    install -Dm644 "${work}/out/Firmwares/${_firmware_b}" "${pkgdir}/usr/lib/firmware/ti/audio/tas2783/1714-1-B.bin"

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
    install -Dm644 "${srcdir}/rt721-sdw-no-autosuspend.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-rt721-sdw-no-autosuspend.rules"

    # Pacman hook + helper to re-patch sof-soundwire.conf after alsa-ucm-conf upgrades
    install -Dm644 "${srcdir}/${pkgname}.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/95-${pkgname}.hook"
    install -Dm755 "${srcdir}/patch-ucm.sh" \
        "${pkgdir}/usr/share/${pkgname}/patch-ucm.sh"
}
