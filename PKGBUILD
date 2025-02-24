# Maintainer: nuvole <mitltlatltl@gmail.com>

pkgname='linux-firmware-gaokun3'
_tag=200.0.10.0
pkgver=1.10.0
pkgrel=3
pkgdesc='Firmware files for HUAWEI MateBook E Go (sc8280xp)'
license=('custom')
arch=('any')
makedepends=('libarchive')
options=(
    !debug
    !strip
)

source=(
    "https://github.com/matebook-e-go/uup-drivers-sc8280xp/releases/download/${_tag}/${_tag}.zip"
    'https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin'
)
sha256sums=(
    'a1240497f44145c1445110522820c7ad8d4d4995403b399ee6323743f30e67b9'
    'ee911c748deadc0191af50074b26ad177c8a2e78ff00e9578504b71d5d27b08a'
)

_dir='/usr/lib/firmware/qcom/sc8280xp/HUAWEI/gaokun3'

_archive_list=(
'qcdx8280.cab' # gpu
'qcsubsys_ext_adsp8280.cab' # adsp
'qcsubsys_ext_cdsp8280.cab' # cdsp
'qcsubsys_ext_scss8280.cab' # sdsp/slpi
)

_file_list=(
'adspr.jsn'
'adspua.jsn'
'battmgr.jsn'
'cdspr.jsn'
# the above should be unnecessary now
'qcadsp8280.mbn'
'qccdsp8280.mbn'
'qcdxkmsuc8280.mbn'
'qcslpi8280.mbn'
'qcvss8280.mbn'
)

prepare() {
    cd "${srcdir}"

    for item in "${_archive_list[@]}"; do
        bsdtar -xf ${item}
    done
}

package() {
    mkdir -p "${pkgdir}/${_dir}"
    install -Dm644 'audioreach-tplg.bin' -t "${pkgdir}/${_dir}"
    cd "${pkgdir}/${_dir}/../.."
    ln -s 'HUAWEI/gaokun3/audioreach-tplg.bin' 'SC8280XP-HUAWEI-GAOKUN3-tplg.bin'

    cd "${srcdir}"
    for item in "${_file_list[@]}"; do
        install -Dm644 "${item}" -t "${pkgdir}/${_dir}"
    done
}
