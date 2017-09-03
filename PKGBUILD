# Maintainer: Sebastian Sonne <sebastiansonne at hush dot com>

# git clone https://github.com/ValveSoftware/steamos_kernel.git
# cd steamos_kernel
# echo "$(git rev-parse --abbrev-ref HEAD).$(git log -n 1 --pretty=format:%h -- drivers/input/joystick/xpad.c)" | sed 's/-/./g'

_kernelversion='v4.12'

_pkgbase='patch_ca0132'
pkgname='test_patch_ca0132'
modulename='snd-hda-test-codec-ca0132'
pkgver='20170903'
pkgrel='1'
pkgdesc="Test-patch to use generic parser for SB Z-Series"
arch=('any')
url='https://github.com/voron00/linux'
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module against Arch kernel'
            'linux-lts-headers: Build the module against LTS Arch kernel')
source=("https://raw.githubusercontent.com/torvalds/linux/$_kernelversion/sound/pci/hda/patch_ca0132.c"
        "https://raw.githubusercontent.com/torvalds/linux/$_kernelversion/sound/pci/hda/ca0132_regs.h"
        "https://raw.githubusercontent.com/torvalds/linux/$_kernelversion/sound/pci/hda/hda_auto_parser.h"
        "https://raw.githubusercontent.com/torvalds/linux/$_kernelversion/sound/pci/hda/hda_codec.h"
        "https://raw.githubusercontent.com/torvalds/linux/$_kernelversion/sound/pci/hda/hda_generic.h"
        "https://raw.githubusercontent.com/torvalds/linux/$_kernelversion/sound/pci/hda/hda_jack.h"
        "https://raw.githubusercontent.com/torvalds/linux/$_kernelversion/sound/pci/hda/hda_local.h"
        "Makefile"
        "patch_ca0132.patch"
        "patch-ca0132.dkms"
        "ca0132.modprobe")
sha512sums=("b1993e64c4bb1f8b5fb5105d06633338dfecff366f2681e25850ea1b1989357a990ece9fb68bd11406ccc47117cc34dcf2cb9d34fcd724f5ce9e4141ae1faa52"
            "284c5241969af056c536edc228493c014a6c0c800e95c4d340a182908a6adb0b493dc4a87795a6fc475c5a4fd4099cf322d67232bcac7df3e62f01c4224dad2e"
            "1ab528fcdcb56813bf1357783338f0be5093ceb13b3fc68791f815f4bf16dd903b8f9cc4985426016df077b5b5c572c6074f715c5d7c6eb8526c987969507c31"
            "d4e4712a2c156a2811e05699295ace665022b2b253926dcc69210135e8ac8cf12f0fc3a96408c046233f28f887f5b9aefe51d4a53ac5136a12aba91f05f231c4"
            "bd1de8a940fd8d854e39648554916ca54e806cd8b05ea20ce612c0c27e471e33c41f40f0da699c75f9ac779bda7803a66dbb4a50e516bc6c56ac6b7484426ceb"
            "a6509d8ff07972d07a98701b033b916c4e445154e394cd2ce0f28b9e95f36864f2d58255526cd95ae81836c75f1a07532723b780094ff550fae3e3a9a2abea85"
            "d6c291634069c90572d017c5ab7dca957b1c1970bef362a12810d6a04b825b0a2fcabcf4656f1ae5e33870792ef1da408b856c01ca4a6eeabb56e85b7d1b158f"
            "e23734e5cf699e671cc58c284f48677d90326bfc9a3aa31dba45d292afe8f8796b1760195d8fb552bb5544b3fa65c689615e5f266df8c6d0e3394e1727c93e07"
            "d354e55d698c31f4937befd7ab2613d05a84ddb5ca054943778203e56519f1af16a229fc12ae8d0dff566f4569f6b3be1f984ca7a5b926fcbe13813e8a9f945b"
            "1c31cb9a05e62b6ff35d3bed34c42a297ce24e4dd596ec9426f6055d3eda1d1c3bf51d346630205367f00c5286708a08ad40a06ef2fa72b019d5f42d94ab10b8"
            "cd3affb6756ee71fbb6b41734aea0cc712921054e1eba871b1a106aca19b412dc084f680b04ae27d9e7a35f008f74b3c0374736e010c71f849bdb7ba44ba3652")

prepare() {
    local _tmpdir="${srcdir}/temp"
    mkdir "${_tmpdir}"
    cp -L "${srcdir}/patch_ca0132.c" "${_tmpdir}/patch_ca0132.c"

    patch -d "${_tmpdir}" -Np0 -i "${srcdir}/patch_ca0132.patch"
}

package() {
    local _tmpdir="${srcdir}/temp"
    install -d "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    install -m 644 -T "${_tmpdir}/patch_ca0132.c" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/patch_ca0132.c"
    install -m 644 -T "${srcdir}/ca0132_regs.h" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/ca0132_regs.h"
    install -m 644 -T "${srcdir}/hda_auto_parser.h" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/hda_auto_parser.h"
    install -m 644 -T "${srcdir}/hda_codec.h" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/hda_codec.h"
    install -m 644 -T "${srcdir}/hda_generic.h" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/hda_generic.h"
    install -m 644 -T "${srcdir}/hda_jack.h" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/hda_jack.h"
    install -m 644 -T "${srcdir}/hda_local.h" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/hda_local.h"
    install -m 644 -T "${srcdir}/Makefile" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile"
    install -m 644 -T "${srcdir}/patch-ca0132.dkms" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -e "s/@MODULENAME@/${modulename}/" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Blacklist the original xpad module
    install -dm755 "${pkgdir}/usr/lib/modprobe.d"
    install -Dm644 "${srcdir}/ca0132.modprobe" "${pkgdir}/usr/lib/modprobe.d/ca0132.conf"
}
