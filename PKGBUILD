# Contributor: Ariel AxionL <i at axionl dot me>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# Maintainer: KafCoppelia <k740677208@gmail.com>
# This PKGBUILD is directly modified from aur/baidunetdisk-bin

_pkgname=baidunetdisk
pkgname=${_pkgname}-electron
pkgver=4.17.8
pkgrel=1
pkgdesc="Baidu Net Disk - a cloud storage client (Linux Version). Run with system electron."
arch=('x86_64')
depends=('electron11')
provides=("baidunetdisk")
conflicts=("baidunetdisk")
url="https://pan.baidu.com"
license=("LicenseRef-${_pkgname}")
options=('!strip')
source=("0001-baidunetdisk-bin-desktop-file.patch"
        "baidunetdisk-wrapper.sh"
        "${pkgname}-${pkgver}.deb::http://wppkg.baidupcs.com/issue/netdisk/Linuxguanjia/${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('17bda6036e07916971257f25731130fb1b760b80798fa13273db39268ab9f28c'
            '14e82c2e285ee28e1d38538f8a434d3a1301621225a3130667d875688a5e430f'
            'ad3a4ce3fdbdbb44d3e157fa072f692c0629be7e6e94e9151cfc3408c0d5ba23')

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

    # fix promission
    chmod 644 "${pkgdir}/usr/lib/${_pkgname}/"*.so
    find ${pkgdir} -type d -exec chmod 755 {} \;

    # remove unnecessary libs
    cd "${pkgdir}/usr/lib/${_pkgname}"
    rm -rf baidunetdisk swiftshader chrome_100_percent.pak libEGL.so locales v8_context_snapshot.bin chrome_200_percent.pak libffmpeg.so libvk_swiftshader.so vk_swiftshader_icd.json chrome-sandbox libGLESv2.so libvulkan.so resources.pak icudtl.dat snapshot_blob.bin baiduNetdiskContext.conf baidunetdisk.svg baidunetdiskv.desktop baidunetdisk.desktop resources/8bb88996964c4e3202fecaaa5605af03 resources/default.db resources/dir.icns resources/resource.db

    # install license
    mv LICENSE* "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
