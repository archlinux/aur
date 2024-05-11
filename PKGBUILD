# Maintainer: Luke Short <ekultails@gmail.com>

pkgname=linux-firmware-asus
pkgver=20231217.8db5bea4
pkgrel=1
pkgdesc="Firmware files for Linux from the ASUS Linux project"
url="https://gitlab.com/asus-linux/firmware"
# Re-using the same license from the "linux-firmware" package.
license=('GPL2' 'GPL3' 'custom')
arch=(any)
_commit=8db5bea4cf1b95c54f92d051fad08542d34ea634
source=("https://gitlab.com/asus-linux/firmware/-/archive/${_commit}/firmware-${_commit}.tar.gz")
sha256sums=("844d5c4c40104508d28d535e2a8e8bdeb1f09f8bcd7b71ba8f7718620bfa3e1e")

build() {
    cd "${srcdir}/firmware-${_commit}/cirrus"
    # Find regular (non-symlink) files and compress them.
    find . -type f -exec zstd -19 {} \;
    # Delete uncompressed files to make this easier to copy over.
    find cs35l41/ -name "*.wmfw" -delete
}

package() {
    mkdir -p "${pkgdir}/usr/lib/firmware/cirrus"
    # Some of the firmware files are upstream in the "linux-firmware" package now.
    # Only package what is missing.
    for firmware_bin in \
      cs35l41-dsp1-spk-cali-1043123f-spkid1-l0.bin \
      cs35l41-dsp1-spk-cali-1043123f-spkid1-r0.bin \
      cs35l41-dsp1-spk-cali-10431473-spkid0-l0.bin \
      cs35l41-dsp1-spk-cali-10431473-spkid0-r0.bin \
      cs35l41-dsp1-spk-cali-10431483-spkid0-l0.bin \
      cs35l41-dsp1-spk-cali-10431483-spkid0-r0.bin \
      cs35l41-dsp1-spk-cali-10431ee2-spkid1-l0.bin \
      cs35l41-dsp1-spk-cali-10431ee2-spkid1-r0.bin \
      cs35l41-dsp1-spk-cali-10431f1f-spkid1-l0.bin \
      cs35l41-dsp1-spk-cali-10431f1f-spkid1-r0.bin \
      cs35l41-dsp1-spk-cali-10432004-spkid1-l0.bin \
      cs35l41-dsp1-spk-cali-10432004-spkid1-r0.bin \
      cs35l41-dsp1-spk-cali-10432064-spkid1-l0.bin \
      cs35l41-dsp1-spk-cali-10432064-spkid1-r0.bin \
      cs35l41-dsp1-spk-prot-1043123f-spkid1-l0.bin \
      cs35l41-dsp1-spk-prot-1043123f-spkid1-r0.bin \
      cs35l41-dsp1-spk-prot-10431473-spkid0-l0.bin \
      cs35l41-dsp1-spk-prot-10431473-spkid0-r0.bin \
      cs35l41-dsp1-spk-prot-10431483-spkid0-l0.bin \
      cs35l41-dsp1-spk-prot-10431483-spkid0-r0.bin \
      cs35l41-dsp1-spk-prot-10431ee2-spkid1-l0.bin \
      cs35l41-dsp1-spk-prot-10431ee2-spkid1-r0.bin \
      cs35l41-dsp1-spk-prot-10431f1f-spkid1-l0.bin \
      cs35l41-dsp1-spk-prot-10431f1f-spkid1-r0.bin \
      cs35l41-dsp1-spk-prot-10432004-spkid1-l0.bin \
      cs35l41-dsp1-spk-prot-10432004-spkid1-r0.bin \
      cs35l41-dsp1-spk-prot-10432064-spkid1-l0.bin
        do cp "${srcdir}/firmware-${_commit}/cirrus/${firmware_bin}.zst" "${pkgdir}/usr/lib/firmware/cirrus/"
    done
    # Manually recreate these symlinks because the original symlinks do not work.
    # The "linux-firmware" package provides the same destination file but it is compressed.
    cd "${pkgdir}/usr/lib/firmware/cirrus/"
    for firmware_wmfw in \
      cs35l41-dsp1-spk-cali-1043123f.wmfw.zst \
      cs35l41-dsp1-spk-cali-10432004.wmfw.zst \
      cs35l41-dsp1-spk-cali-10432064.wmfw.zst \
      cs35l41-dsp1-spk-prot-1043123f.wmfw.zst \
      cs35l41-dsp1-spk-prot-10432004.wmfw.zst \
      cs35l41-dsp1-spk-prot-10432064.wmfw.zst
        do ln -s cs35l41/v6.61.1/halo_cspl_RAM_revB2_29.63.1.wmfw.zst "${firmware_wmfw}"
    done
}
