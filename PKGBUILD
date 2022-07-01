# Maintainer: Hao Zhang <hao [AT] hao-zhang.com>
# Contributor: Bian Jiaping <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>

pkgname=fcitx-sogoupinyin
pkgver=4.0.1.2800
pkgrel=1
filename=sogoupinyin_${pkgver}_x86_64.deb
pkgdesc="Sogou Pinyin for Linux"
arch=("x86_64")
url="https://shurufa.sogou.com/linux"
license=("custom")
depends=("fcitx" "opencc" "libidn11" "lsb-release" "xorg-xprop" "qt5-declarative" "qt5-svg" "fcitx-qt5")

source=("sogou-autostart")
sha256sums=("4357c28ba35d9441e47cc5c9a4c5f1ccbb8957cb3434212a609201aee485c092")
sha256sum="5d851c647c8b02c7f0b1853c3e516bfd1bdd9c5628333c07e9851a617336deb7"

prepare(){
    msg "Retrieving sources..."
    if [[ -f $startdir/$filename ]]; then
        msg2 "$(gettext "Found %s")" "$filename"
    else
        msg2 "$(gettext "Downloading %s...")" "$filename"
        curl -s $url | grep -o "https://[0-9a-z:\/\._]*/$filename" | xargs curl -o $startdir/$filename
    fi
    ln -s $startdir/$filename
    msg "Validating source files with sha256sums..."
    printf '    %s ... ' "$filename" >&2
    if [[ $sha256sum = $(sha256sum $filename | cut -d' ' -f1) ]]; then
        printf '%s\n' "$(gettext "Passed")" >&2
    else
        printf '%s\n' "$(gettext "FAILED")" >&2
        error "$(gettext "One or more files did not pass the validity check!")"
        exit 1
    fi
    msg "Extracting sources..."
    msg2 "Extracting $filename with bsdtar"
    bsdtar -xf $filename
}

package(){
    cd $srcdir

    tar -xJvf data.tar.xz -C "$pkgdir"

    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu
}
