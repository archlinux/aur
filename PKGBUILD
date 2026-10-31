# Contributor: Ariel AxionL <i at axionl dot me>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# Maintainer: KafCoppelia <k740677208@gmail.com>

_pkgname=baidunetdisk
pkgname=${_pkgname}-electron
pkgver=8.9.7
pkgrel=1
pkgdesc="Baidu Nedisk - a cloud storage client (Linux Version). Run with system electron."
arch=('x86_64')
depends=('gtkmm' 'electron22' 'libatomic')
makedepends=('asar' 'patchelf')
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
            '73494c86a0484f2ea7d5cbac7c00752367796413bec2980ba295ecdab8fc9afb'
            '6c0a5df4fe90f7f1aa5e07e9a7044e3e4d1b6ccaa7beabdc1f7f9cc25fa3b31c')

prepare() {
    bsdtar -xpf "data.tar.bz2"
    patch -d "usr" -p1 < "0001-baidunetdisk-bin-desktop-file.patch"

    # Clear any executable-stack flag on the external Koffi copy.
    asar extract-file "opt/${_pkgname}/resources/app.asar" node_modules/koffi/build/koffi/linux_x64/koffi.node
    patchelf --clear-execstack koffi.node
}

package() {
    cd "${srcdir}"

    # install application data
    mv "usr" "${pkgdir}"
    install -dm755 "${pkgdir}/usr/lib" "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "opt/${_pkgname}" "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm755 "${srcdir}/baidunetdisk-wrapper.sh" "${pkgdir}/usr/bin/baidunetdisk"
    install -Dm644 "${srcdir}/baidunetdisk-main.js" "${pkgdir}/usr/lib/${_pkgname}/baidunetdisk-main.js"
    install -Dm644 "${srcdir}/koffi.node" "${pkgdir}/usr/lib/${_pkgname}/koffi.node"

    # fix promission
    chmod 644 "${pkgdir}/usr/lib/${_pkgname}/"*.so
    find ${pkgdir} -type d -exec chmod 755 {} \;

    # remove unnecessary libs
    cd "${pkgdir}/usr/lib/${_pkgname}"
    rm -rf baidunetdisk swiftshader chrome_100_percent.pak libEGL.so locales v8_context_snapshot.bin chrome_200_percent.pak libffmpeg.so libvk_swiftshader.so vk_swiftshader_icd.json chrome-sandbox chrome_crashpad_handler libGLESv2.so libvulkan.so libvulkan.so.1 resources.pak icudtl.dat snapshot_blob.bin baiduNetdiskContext.conf baidunetdisk.svg baidunetdiskv.desktop baidunetdisk.desktop

    # install license
    mv LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/"
}
