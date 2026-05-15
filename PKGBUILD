# Maintainer: fecet <xiezej@gmail.com>
pkgname=px13-audio-fix
pkgver=0.20260515
pkgrel=2
pkgdesc="UCM + PipeWire/WirePlumber configs for TAS2783 speakers on ASUS ProArt PX13 (HN7306EA)"
arch=('any')
url="https://github.com/ftoleedo/px13-audio-fix"
license=('CC0-1.0')
depends=('alsa-ucm-conf' 'pipewire' 'wireplumber')
optdepends=(
    'sof-firmware: SOF firmware for AMD ACP'
    'alsa-utils: alsactl store to persist channel assignments'
)
install=${pkgname}.install
source=(
    'codecs_tas2783_init.conf'
    'sof-soundwire_tas2783.conf'
    'sof-soundwire_acp-dmic.conf'
    '51-amd-sdw-channels.conf'
    '99-echo-cancel.conf'
    "${pkgname}.hook"
    'patch-ucm.sh'
)
sha256sums=('8704e2350ece61e4fbfc6fab0e1555e9dadc4e50509f727c704cae137de7e372'
            '0e553ee4e084c53fa143622c1664d39398736c7d29f7377ecbe885907a2a43c8'
            'bbbc4eafdbdacfc9af5b58922bb21118da59c88320dae037925ceed5ebfa02ed'
            'a426f056bb4fc3169fe68e8c08172379899e7f03edeb5199b5e7d6c06444444d'
            '2a68adee036530d1fa9e59fba0268d414c31f7c5d4b2ea1e93a11ceb469f4642'
            '4213759fe583ddee0b9652b1ac1298963ff12199b51a32b43e230efca970d9fc'
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

    # Pacman hook + helper to re-patch sof-soundwire.conf after alsa-ucm-conf upgrades
    install -Dm644 "${srcdir}/${pkgname}.hook" \
        "${pkgdir}/usr/share/libalpm/hooks/95-${pkgname}.hook"
    install -Dm755 "${srcdir}/patch-ucm.sh" \
        "${pkgdir}/usr/share/${pkgname}/patch-ucm.sh"
}
