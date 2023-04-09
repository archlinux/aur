# Maintainer: Hao Zhang <hao [AT] hao-zhang.com>
# Contributor: Bian Jiaping <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>

pkgname=fcitx-sogoupinyin
pkgver=4.2.1.145
filename=${pkgname:6}_${pkgver}_amd64.deb
pkgrel=1
pkgdesc="Sogou Pinyin for Linux"
arch=("x86_64")
url="https://shurufa.sogou.com/linux"
license=("custom")
depends=("fcitx" "opencc" "libidn11" "lsb-release" "xorg-xprop" "qt5-declarative"
         "qt5-svg" "fcitx-qt5" "libxss" "gsettings-qt")
sha256sum="3111af17a6abddd80b856aa9c1f579a137d69f3d735ead936ddb6e5f08b59f3b"

prepare(){
    msg "Retrieving sources..."
    if [[ -f $startdir/$filename ]]; then
        msg2 "$(gettext "Found %s")" "$filename"
    else
        msg2 "$(gettext "Downloading %s...")" "$filename"
        curl -s $url | grep -o "https://[0-9a-z:\/\._-]*/$filename" | xargs curl -o $startdir/$filename
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

    find $pkgdir/opt/sogoupinyin/files/{.license,share} -type d -exec chmod 755 {} \;
    find $pkgdir/opt/sogoupinyin/files/{.license,share} -type f -exec chmod 644 {} \;
    
    rm -rf $pkgdir/opt/sogoupinyin/files/lib/qt5
    rm $pkgdir/opt/sogoupinyin/files/bin/qt.conf
}
