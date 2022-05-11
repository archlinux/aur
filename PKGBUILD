# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.1.4
pkgrel=1
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3')
provides=("$_pkgname")
source=(
    "qqmusic_${pkgver}_amd64.deb::https://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb"
    "${_pkgname}".sh
)
sha512sums=('668767ef4f3a0343c3fdd01bb5e7be4a4b203b1d60af5af389afe995681d3288d0419586dbeb49eec848bd167fd994d00ff3ff5e3a5c5642f8270e6504d6dde5'
            'bd04c44159d1cdbf1a248e919802c8459a859ac29f4e3a94c04d1b32e1677fd5c0bb068a2d69778a966936d500c9e66e76ac2c435bfadff67a96ea859f1f18c2')

package(){
    cd "${srcdir}"
    tar -xvf data.tar.xz -C "${pkgdir}"
    
    install -Dm755 ${_pkgname}.sh "${pkgdir}/usr/bin/${_pkgname}"
    
    local desktopfile="${pkgdir}/usr/share/applications/qqmusic.desktop"
    sed -i '3c Exec=qqmusic %U' "$desktopfile"
    sed -i 'N;2aName[zh_CN]=QQ音乐\nKeywords=qqmusic' "$desktopfile"

    # Hex patch
    # 1. Fix orphaned processes
    # 2. Fix search
    local _subst="
        s|\xA4\x8B\x7A\xB9\x8D\xCF\x54\xAE|\xA4\x8B\x7A\xB9\x85\xEF\x54\xAE|
        s|\xB3\x1D\xF5\xCB\x24\xBC|\xA3\x63\xBB\xC9\x3F\xBC|
    "
    sed "$_subst" -i "${pkgdir}/opt/qqmusic/resources/app.asar"

    chmod g-w -R "${pkgdir}" # Fix directory permissions
}
 
