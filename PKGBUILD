# Maintainer: Sebastian Sonne <sebastiansonne at hush dot com>

# git clone https://github.com/ValveSoftware/steamos_kernel.git
# cd steamos_kernel
# echo "$(git rev-parse --abbrev-ref HEAD).$(git log -n 1 --pretty=format:%h -- drivers/input/joystick/xpad.c)" | sed 's/-/./g'

_xpadsteamoscommit='96053cb77390d18cc76cebead210481ea173bee5'
_xpadsteamossha512sum='b699b66a3bda8491c9bfb8a616ebdf971253d11091793cb70f359466bd58fb5291b72f0bf43d92794a3e6a3893e38afc2a5ed46e7e5d148c70b0da0fcefa4be1'

_pkgbase='steamos-xpad'
pkgname='steamos-xpad-dkms'
pkgver='20160103'
pkgrel='1'
pkgdesc="xpad kernel module included with Valve's SteamOS"
arch=('any')
url='https://github.com/ValveSoftware/steamos_kernel'
license=('GPL2')
install="${pkgname}.install"
depends=('dkms')
conflicts=("${_pkgbase}")
optdepends=('linux-headers: Build the module against Arch kernel'
            'linux-lts-headers: Build the module against LTS Arch kernel')
source=("https://raw.github.com/ValveSoftware/steamos_kernel/${_xpadsteamoscommit}/drivers/input/joystick/xpad.c"
        "Makefile"
        "change-name.patch"
        "steamos-xpad-dkms.dkms"
        "xpad.modprobe")
sha512sums=("${_xpadsteamossha512sum}"
            '9ca3d1ada29c5bfe3ffd39f818e792be0c528191952660568f0ecae981b191a2cfbfd64a90f1158aa760e38fcd3c52d648cdf0f032fd649512933ca36bcd2149'
            'a0ab12a6768447b1798c6d82988fb81a212512dbef19a5e66a5b5c096cbe136671255ad4896226c595d95a97ce097efe6702a370c30cc32d3234750d6a0a5daf'
            '7901fb85689d8670f0d853f19e24b0c22e3913dd82cdb0a83d74f456e010b7dff67575c5be863b43c95f1149780faec5cab604a829cb3e400f1ec44173c35aac'
            'f492130c48a37f2fa59447f376c26c8af6581e7d79b2edd5f47afc91dc88d6ce4ccbbf1da1ea286a233bd93a76a785c77259870b617420fd6e1c82bbe3293cfe')

prepare() {
    local _tmpdir="${srcdir}/temp"
    mkdir "${_tmpdir}"
    cp -L "${srcdir}/xpad.c" "${_tmpdir}/xpad.c" # we will patch a copy of our source xpad.c
    
    patch -d "${_tmpdir}" -Np4 -i "${srcdir}/change-name.patch"
}

package() {
    local _tmpdir="${srcdir}/temp"
    install -d "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    install -m 644 -T "${_tmpdir}/xpad.c" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/${_pkgbase}.c"
    install -m 644 -T "${srcdir}/Makefile" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/Makefile"
    install -m 644 -T "${srcdir}/steamos-xpad-dkms.dkms" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Blacklist the original xpad module
    install -dm755 "${pkgdir}/usr/lib/modprobe.d"
    install -Dm644 "${srcdir}/xpad.modprobe" "${pkgdir}/usr/lib/modprobe.d/xpad.conf"
}
