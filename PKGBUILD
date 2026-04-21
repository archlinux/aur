# Maintainer: nuvole <mitltlatltl@gmail.com>

pkgname='linux-firmware-gaokun3'
_tag=200.0.10.0
pkgver=2.10.2
pkgrel=2
_wlanfwver='8380_CRD/200.0.57.0'
pkgdesc='Firmware files for HUAWEI MateBook E Go (sc8280xp)'
license=('custom')
arch=('any')
makedepends=('libarchive')
options=(
    !debug
    !strip
)

_linux_fw='https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git'

source=(
    "https://github.com/matebook-e-go/uup-drivers-sc8280xp/releases/download/${_tag}/${_tag}.zip"
    "https://github.com/WOA-Project/Qualcomm-Reference-Drivers/raw/refs/heads/master/${_wlanfwver}/qcwlanhsp8380.cab"
    "git+${_linux_fw}"
)
sha256sums=(
    'a1240497f44145c1445110522820c7ad8d4d4995403b399ee6323743f30e67b9'
    'SKIP'
    'SKIP'
)

_fw_dir='/usr/lib/firmware'
_gaokun_dir="${_fw_dir}/qcom/sc8280xp/HUAWEI/gaokun3"

_fw_list=(
'qcom/a660_gmu.bin'
'qcom/a660_sqe.fw'
'ath11k/WCN6855/hw2.0/*'    # wifi firmware
'qca/wcnhp*'                # bluetooth firmware
)

_archive_list=(
'qcwlanhsp8380.cab'         # wlan
'qcdx8280.cab'              # gpu
'qcsubsys_ext_adsp8280.cab' # adsp
'qcsubsys_ext_cdsp8280.cab' # cdsp
'qcsubsys_ext_scss8280.cab' # sdsp/slpi
)

_qrd_file_llist=(
'wlanfw20.mbn'
'm320.bin'
)

_gaokun_list=(
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

    mv linux-firmware/qcom/sc8280xp/LENOVO/21BX/audioreach-tplg.bin .
}

package() {
    install -Dm644 'audioreach-tplg.bin' -t "${pkgdir}/${_gaokun_dir}"
    cd "${pkgdir}/${_gaokun_dir}/../.."
    ln -s 'HUAWEI/gaokun3/audioreach-tplg.bin' 'SC8280XP-HUAWEI-GAOKUN3-tplg.bin'

    cd "${srcdir}"
    for item in "${_gaokun_list[@]}"; do
        install -Dm644 "${item}" -t "${pkgdir}/${_gaokun_dir}"
    done

    for item in "${_fw_list[@]}"; do
        # || : fix ath11k copy
        install -Dm644 linux-firmware/${item} -t "${pkgdir}/${_fw_dir}/$(dirname ${item})" || :
    done

    # use qrd wlan firmware, TODO: except adsp, almost all firmwares are compatible
    install -Dm644 'm320.bin' "${pkgdir}/${_fw_dir}/ath11k/WCN6855/hw2.0/m3.bin"
    install -Dm644 'wlanfw20.mbn' "${pkgdir}/${_fw_dir}/ath11k/WCN6855/hw2.0/amss.bin"

    # fix link
    ln -s 'hw2.0' "${pkgdir}/${_fw_dir}/ath11k/WCN6855/hw2.1"
}
