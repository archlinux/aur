# Contributor: Ariel AxionL <i at axionl dot me>
# Contributor: Astro Benzene <universebenzene at sina dot com>
# Contributor: lilydjwg <lilydjwg at gmail dot com>
# This PKGBUILD is directly modified from aur/baidunetdisk-bin
_pkgname=baidunetdisk
pkgname=baidunetdisk-electron
pkgver=3.5.0
pkgrel=1
#_mainver=${pkgver%.*}
pkgdesc="Baidu Net Disk - a cloud storage client (Linux Version). Run with system electron."
arch=('x86_64')
depends=('electron9')
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
            '5cb0d3735cfc52d70b41a916c31e4c4c9212a99152ec81d6c3f629975fec6621')
sha256sums_x86_64=('aed0a95f4162e17d88159ed0736636fa47f49af313d0820647af460df4fd49b6')

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
    rm -rf baidunetdisk swiftshader chrome_100_percent.pak libEGL.so locales v8_context_snapshot.bin chrome_200_percent.pak  libffmpeg.so         libvk_swiftshader.so  vk_swiftshader_icd.json chrome-sandbox libGLESv2.so libvulkan.so resources.pak icudtl.dat snapshot_blob.bin


    # install license
    ln -s "/usr/lib/${_pkgname}/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.electron.txt"
    ln -s "/usr/lib/${_pkgname}/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSES.chromium.html"
}
