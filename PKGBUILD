# Maintainer: buj <buj351@outlook.com>
pkgname=voidsprite-bin
_pkgver=07.12.2025
pkgver="$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')"+alpha
pkgrel=6
pkgdesc='Free pixelart editor made in SDL3 C++'
url='https://github.com/counter185/voidsprite'
#_zip=voidsprite-${_pkgver}-linux-x86_64.flatpak.zip
# Hardcoding it temporarily. Will switch back to proper releases when those come out.
_appimage=https://github.com/counter185/voidsprite/releases/download/appimage-test/voidsprite-latest-x86_64-no-x.AppImage
#source=("https://github.com/counter185/voidsprite/releases/download/alpha${_pkgver}/${_zip}")
_root=https://raw.githubusercontent.com/counter185/voidsprite/95d7c427a09b77e9a364033c49577b9abcc1ba01
source=("voidsprite::$_appimage" "voidsprite.desktop::$_root/freesprite/linux/com.github.counter185.voidsprite.desktop" "license::$_root/LICENSE"
        "metainfo.xml::$_root/freesprite/linux/com.github.counter185.voidsprite.metainfo.xml"
        "voidsn.xml::$_root/freesprite/linux/voidsn.xml"
        "voidsprite.thumbnailer::$_root/freesprite/linux/voidsprite.thumbnailer"
        "voidsprite_thumbnailer::$_root/freesprite/linux/voidsprite_thumbnailer")
for x in 16x16 32x32 64x64 128x128 256x256 512x512; do
    source+=("icon-$x.png::$_root/freesprite/linux/icons/$x.png")
done
arch=('x86_64')
conflicts=('voidsprite')
provides=("voidsprite=$(echo $_pkgver | tr '.' $'\n' | tac | paste -s -d '.')")
sha256sums=('9e033fcebabdfd7b8e81ddcb45fe0ffc59a44d5c71960484f50327b102033def'  # voidsprite
            '08dda56f5cad7861a9508d35238c5ece6d2287d5c89796683b23131a967fb527'  # voidsprite.desktop
            '8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'  # license
            '23ff809ac82b1eec7d7da1168204ef8bb087b130a4dfac17c2163faba27d6c5c'  # metainfo.xml
            '5f5ac5edcf38a5167935806a0dc9afd31de1db35ddf11b3b8a8184bc8eb0bcf6'  # voidsn.xml
            '88c4f2612fa0bc18afd21821659971c537f77542936457cb403aa51929dcfb0a'  # voidsprite.thumbnailer
            '5113c1a50653895dc36584935f77c523f69bd0168c7bd6527e21d1866018c790'  # voidsprite_thumbnailer
            'c5a4aff8224d4fe27f41d567c6663171041f79fb608fb2350bd98898c58cb793'  # icon-16.png
            'd8f5545b3293b6a03ddf428278fd74ddef5e007dc2a81563c03ef2c40c1642ff'  # icon-32.png
            '6ec93875e3e5ef4b4abc1d6575c2992bcdcbfa7b25a063ebcb6197b490b75634'  # icon-64.png
            '9e511e0c7a08c45309177f31b2325c2265cefaffb8d9e031867ec1fb2d25eb98'  # icon-128.png
            '73d073b51d5e70aa72e03d97160fd7eff1bee06f797a538c6af17398f3e7621f'  # icon-256.png
            '3a24374fb1ec53ac261852e5aec9d73cf8ac158b11524bf7565a6ddd383d0f12') # icon-512.png
noextract=('voidsprite')
depends=()
#makedepends=(unzip ostree sed)
makedepends=()
license=(GPL-2.0-only)
options+=('!strip')

# No more of this bullshit, we're using the appimage now.
# build() {
#     _repo=${srcdir}/voidsprite-repo
#     _src=${srcdir}/voidsprite-src
# 
#     unzip -o "${srcdir}/${_zip}"
#     rm -fr ${srcdir}/voidsprite-{repo,src}
#     ostree init --repo=${_repo} --mode=bare-user
#     ostree static-delta apply-offline --repo=${_repo} voidsprite-build-linux64-flatpak.flatpak
#     cd ${_repo} && \
#         ostree checkout --repo=${_repo} -U $(echo objects/*/*.commit | cut -d/ -f2- | tr -d / | cut -d. -f1) ${_src}
# 
#     # haha funny bin patch
#     sed -i -E 's/\/app\/share\/voidsprite/\/usr\/share\/voidsprite/g' ${_src}/files/bin/voidsprite
# }

package() {
    # _src=${srcdir}/voidsprite-src

    # mkdir -p ${pkgdir}/usr
    # cp -r ${_src}/files/share ${pkgdir}/usr/share
    # mkdir ${pkgdir}/usr/bin
    # install -m 751 ${_src}/files/bin/voidsprite ${pkgdir}/usr/bin/voidsprite
    # _files="$(ls "${pkgdir}/usr/share/licenses")"
    # mkdir ${pkgdir}/usr/share/licenses/voidsprite
    # for x in $_files; do
    #     mv -vf ${pkgdir}/usr/share/licenses/${x} ${pkgdir}/usr/share/licenses/voidsprite/${x}
    # done

    mkdir -p "$pkgdir"/usr/{bin,share/{applications,licenses/voidsprite,metainfo,mime/packages,icons/hicolor,voidsprite,thumbnailers}}
    install -m755 "$srcdir"/voidsprite "$pkgdir"/usr/bin/voidsprite
    install -m644 "$srcdir"/voidsprite.desktop "$pkgdir"/usr/share/applications/voidsprite.desktop

    cat "$srcdir"/voidsprite.desktop | \
        sed 's/Exec=voidsprite/Exec=\/usr\/bin\/voidsprite/g' > "$pkgdir/usr/share/applications/voidsprite.desktop"
    install -m644 "$srcdir"/license "$pkgdir"/usr/share/licenses/voidsprite/LICENSE

    install -m644 "$srcdir"/metainfo.xml "$pkgdir"/usr/share/metainfo/com.github.counter185.voidsprite.metainfo.xml
    install -m644 "$srcdir"/voidsn.xml "$pkgdir"/usr/share/mime/packages/voidsn.xml

    for size in 16x16 32x32 64x64 128x128 256x256 512x512; do
        mkdir -p "$pkgdir"/usr/share/icons/hicolor/"$size"/apps/
        install -m644 "$srcdir"/icon-"$size".png "$pkgdir"/usr/share/icons/hicolor/"$size"/apps/com.github.counter185.voidsprite.png
    done

    install -m644 "$srcdir"/voidsprite.thumbnailer "$pkgdir"/usr/share/thumbnailers/voidsprite.thumbnailer
    install -m644 "$srcdir"/voidsprite_thumbnailer "$pkgdir"/usr/share/voidsprite/thumbnailer
}

