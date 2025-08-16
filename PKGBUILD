# Maintainer: Luke Short <ekultails@gmail.com>

pkgname=linux-firmware-valve
# There are two source packages that use a date version. Set the PKGBUILD version to mirror whichever source is newer.
pkgver=20250807
pkgrel=1
pkgdesc="Firmware files for Steam Deck devices from SteamOS"
url="https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/"
# Re-using the same license from the related SteamOS firmware packages.
license=('GPL2' 'GPL3' 'custom')
arch=(any)
depends=("linux-firmware-atheros")
source=("https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/linux-firmware-neptune-20230121.1f01c88-1-any.pkg.tar.zst"
        "https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/steamdeck-dsp-0.69-2-any.pkg.tar.zst")
sha256sums=("710e37390e86598630509ed9a2ece6e67cc53a479531dc1e2030199f64947a84"
            "cb655d2d8ea96184e99433d819bac8468cd28a270e3a3da77cb5c3045cfe7ec2")

package() {
    # Firmware files from the "linux-firmware-neptune" package.
    mkdir -p "${pkgdir}/usr/lib/firmware/cirrus/"
    for cirrus in \
      "${srcdir}/usr/lib/firmware/cs35l41-dsp1-spk-cali.bin" \
      "${srcdir}/usr/lib/firmware/cs35l41-dsp1-spk-cali.wmfw"
        do zstd "${cirrus}"
        cp "${cirrus}.zst" "${pkgdir}/usr/lib/firmware/cirrus/"
    done

    # Steam Deck OLED sound firmware files.
    tar -xvf steamdeck-dsp-*-any.pkg.tar.zst -C "${srcdir}"
    mkdir -p \
      "${pkgdir}/usr/lib/firmware/amd/sof/" \
      "${pkgdir}/usr/lib/firmware/amd/sof-tplg/"
    cp "${srcdir}/usr/lib/firmware/amd/sof/sof-vangogh-data.bin" "${pkgdir}/usr/lib/firmware/amd/sof/"
    cp "${srcdir}/usr/lib/firmware/amd/sof/sof-vangogh-code.bin" "${pkgdir}/usr/lib/firmware/amd/sof/"
    cp "${srcdir}/usr/lib/firmware/amd/sof-tplg/sof-vangogh-nau8821-max.tplg" "${pkgdir}/usr/lib/firmware/amd/sof-tplg/"
}
