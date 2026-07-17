# Contributor: Ariel AxionL <i at axionl dot me>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# Maintainer: KafCoppelia <k740677208@gmail.com>

_pkgname=baidunetdisk
pkgname=${_pkgname}-electron
pkgver=8.6.0
pkgrel=1
pkgdesc="Baidu Net Disk - a cloud storage client (Linux Version). Run with system electron."
arch=('x86_64')
depends=('electron22' 'gtkmm')
provides=("baidunetdisk")
conflicts=("baidunetdisk")
url="https://pan.baidu.com"
license=("LicenseRef-${_pkgname}")
options=('!strip' '!debug')
source=("0001-baidunetdisk-bin-desktop-file.patch"
        "baidunetdisk-wrapper.sh"
        "baidunetdisk-main.js"
        "https://wppkg.baidupcs.com/issue/netdisk/Linuxguanjia/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('17bda6036e07916971257f25731130fb1b760b80798fa13273db39268ab9f28c'
            '1985035bf0bde478f3d638819f638eab8244d5f2abd85adb9602729b4d7fddf2'
            '12141ff8d85741a0ecba7ad923d982ce75bb3632698f4b04ccbbcce85c02502d'
            '28f62882fe35469b4008c1324e43d2a9109395bcbdfc05207e048a8487759d56')

prepare() {
    bsdtar -xpf "data.tar.bz2"
    patch -d "usr" -p1 < "0001-baidunetdisk-bin-desktop-file.patch"
}

package() {
    cd "${srcdir}"

    # install application data
    mv "usr" "${pkgdir}"
    install -dm755 "${pkgdir}/usr/lib" "${pkgdir}/usr/share/licenses/${_pkgname}"
    mv "opt/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 "${srcdir}/baidunetdisk-wrapper.sh" "${pkgdir}/usr/bin/baidunetdisk"
    install -Dm644 "${srcdir}/baidunetdisk-main.js" "${pkgdir}/usr/lib/${_pkgname}/baidunetdisk-main.js"

    # fix promission
    chmod 644 "${pkgdir}/usr/lib/${_pkgname}/"*.so
    find ${pkgdir} -type d -exec chmod 755 {} \;

    # remove unnecessary libs
    cd "${pkgdir}/usr/lib/${_pkgname}"
    rm -rf baidunetdisk swiftshader chrome_100_percent.pak libEGL.so locales v8_context_snapshot.bin chrome_200_percent.pak libffmpeg.so libvk_swiftshader.so vk_swiftshader_icd.json chrome-sandbox chrome_crashpad_handler libGLESv2.so libvulkan.so libvulkan.so.1 resources.pak icudtl.dat snapshot_blob.bin baiduNetdiskContext.conf baidunetdisk.svg baidunetdiskv.desktop baidunetdisk.desktop

    # install license
    mv LICENSE* "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
