# Contributor: Ariel AxionL <i at axionl dot me>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# Maintainer: KafCoppelia <k740677208@gmail.com>

_pkgname=baidunetdisk
pkgname=${_pkgname}-electron
pkgver=8.9.6
pkgrel=1
pkgdesc="Baidu Nedisk - a cloud storage client (Linux Version). Run with system electron."
arch=('x86_64')
depends=('gtkmm' 'electron26' 'libatomic')
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
            '93d8ff804233f0b8957e5c38f2993e5c646b9afb3427bafaed13b7d7ef2263c6'
            '73494c86a0484f2ea7d5cbac7c00752367796413bec2980ba295ecdab8fc9afb'
            'ae6b20a2b2fd84313e1da722dfe14e39d5b446649b46db600f83b25caf7541e2')

prepare() {
    bsdtar -xpf "data.tar.bz2"
    patch -d "usr" -p1 < "0001-baidunetdisk-bin-desktop-file.patch"

    # Koffi 2.8.8's executable-stack flag prevents dlopen with current glibc.
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
