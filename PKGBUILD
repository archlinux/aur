# maintainer: zxkmm (IHp4a21tQGhvdG1haWwuY29t)
# auto running on siyuan official repo
# PKGBUILD is modified from https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=siyuan-appimage
# which is made by vvxxp8 <concatenate[g] the characters[x] in square[b] brackets[1] in[5] order[3] at gmail dot com>
# had agreement with the author to use the PKGBUILD
# for change request, PLEASE MAKE A PR ON GITHUB REPO, keep commenting here would be ignored

pkgname=siyuan-bin
pkgver=3.1.11
pkgrel=1
pkgdesc="auto upload to AUR when SiYuan stable release"
arch=("x86_64")
url="https://b3log.org/siyuan"
license=("AGPL-3.0-only")
_pkgname=siyuan-${pkgver}-linux.AppImage
noextract=(siyuan-${pkgver}-linux.AppImage)
options=("!strip" "!debug")
depends=("fuse2")
optdepends=('pandoc: docx export')
source=("https://github.com/siyuan-note/siyuan/releases/download/v${pkgver}/siyuan-${pkgver}-linux.AppImage")
sha256sums=('SKIP')

_installdir=/opt/appimages

prepare() {
    chmod a+x ${_pkgname}
    ./${_pkgname} --appimage-extract >/dev/null
    sed -i "s+AppRun+${_installdir}/siyuan.AppImage+" "squashfs-root/siyuan.desktop"
    sed -i "s+^Icon=.*+Icon=siyuan-bin+" "squashfs-root/siyuan.desktop"
}

package() {
    echo "----------------------------------------"
    echo "Note: You have to have sudo permission to proceed."
    echo "Don't know what's that? check link below:"
    echo "https://wiki.archlinux.org/title/Sudo"
    echo "----------------------------------------"
    echo "提醒：您必须有sudo权限才能继续。"
    echo "不知道这是什么？请查看以下链接："
    echo "https://wiki.archlinux.org/title/Sudo_(简体中文)"
    echo "----------------------------------------"

  
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/siyuan.AppImage"
    install -Dm644 "squashfs-root/resources/stage/icon.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/siyuan-bin.png"
    install -Dm644 "squashfs-root/siyuan.desktop" "${pkgdir}/usr/share/applications/siyuan-bin.desktop"

    if [ ! -f "/usr/bin/siyuan" ]; then
      sudo -k
      sudo mkdir -p "/usr/bin"
      sudo bash -c 'echo "#!/bin/sh" > "/usr/bin/siyuan"'
      sudo bash -c 'echo "exec /opt/appimages/siyuan.AppImage" >> "/usr/bin/siyuan"'
      sudo chmod 755 "/usr/bin/siyuan"
    fi
}
