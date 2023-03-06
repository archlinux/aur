# Contributor: Ariel AxionL <i at axionl dot me>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# This PKGBUILD is directly modified from aur/baidunetdisk-bin
_pkgname=baidunetdisk
pkgname=baidunetdisk-electron
pkgver=4.17.7
pkgrel=1
#_mainver=${pkgver%.*}
pkgdesc="Baidu Net Disk - a cloud storage client (Linux Version). Run with system electron."
arch=('x86_64')
depends=('electron11')
provides=("baidunetdisk")
conflicts=("baidunetdisk")
url="https://pan.baidu.com"
license=("custom")
options=('!strip')

source=("0001-baidunetdisk-bin-desktop-file.patch"
        "baidunetdisk-wrapper.sh")

#source_x86_64=("${pkgname}-${pkgver}.deb::https://issuecdn.baidupcs.com/issue/netdisk/LinuxGuanjia/${_mainver}/${_pkgname}_linux_${pkgver}.deb")
source_x86_64=("${pkgname}-${pkgver}.deb::http://wppkg.baidupcs.com/issue/netdisk/Linuxguanjia/${pkgver}/baidunetdisk_${pkgver}_amd64.deb")

sha256sums=('17bda6036e07916971257f25731130fb1b760b80798fa13273db39268ab9f28c'
            '14e82c2e285ee28e1d38538f8a434d3a1301621225a3130667d875688a5e430f')
sha256sums_x86_64=('50ec18f05626a13f57ef034630416d481682bc1018539f33397d5c71bc653b3d')

prepare() {
    bsdtar -xpf "data.tar.xz"

    patch -d "usr" -p1 <"0001-baidunetdisk-bin-desktop-file.patch"
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
    rm -rf baidunetdisk swiftshader chrome_100_percent.pak libEGL.so locales v8_context_snapshot.bin chrome_200_percent.pak  libffmpeg.so         libvk_swiftshader.so  vk_swiftshader_icd.json chrome-sandbox libGLESv2.so libvulkan.so resources.pak icudtl.dat snapshot_blob.bin baiduNetdiskContext.conf baidunetdisk.svg baidunetdiskv.desktop baidunetdisk.desktop resources/8bb88996964c4e3202fecaaa5605af03 resources/default.db resources/dir.icns resources/resource.db


    # install license
    mv LICENSE* "${pkgdir}/usr/share/licenses/${_pkgname}/"
}
