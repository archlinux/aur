# Contributor: orumin <dev@orum.in>

_pkgbase=adobe-source-han-serif
pkgbase=$_pkgbase-fonts
pkgname=($_pkgbase-jp-fonts $_pkgbase-kr-fonts $_pkgbase-cn-fonts $_pkgbase-tw-fonts $_pkgbase-otc-fonts)
pkgver=1.000
pkgrel=1
pkgdesc='Adobe Source Han Serif - A set of Pan-CJK fonts designed to complement Source Serif Pro'
arch=('any')
license=(custom)
url='https://github.com/adobe-fonts/source-han-serif'
depends=('fontconfig')
install="fonts.install"
source=("https://github.com/adobe-fonts/source-han-serif/archive/${pkgver}R.tar.gz"
        44-source-han-serif-jp.conf
        44-source-han-serif-kr.conf
        44-source-han-serif-cn.conf
        44-source-han-serif-tw.conf
        44-source-han-serif-otc.conf)
sha256sums=('4962a13bcc28a18d82ca6f8373294a447b85a28e10f9e66beac3f50f29950c01'
            '11cc3eeddaa03f90e02bc0d2a869dc411ca6e0671ff18330092040fa8f9cb9fb'
            'c46faa5bce15917837071384281ec9503fe32e44f3e8751b6af9db1da296610a'
            '9ab6ada83b23f72d961cb27fe62fa7e61aece75e9f8039f77dc09e399dcaf214'
            '4ae2bd5d82a54ae2e7bc95b2bd8417a583b592d1df98b3934f9e028dfea8b405'
            'a5843462df591a027e30c0e15865a0e625d4a3fc7ea2068d66ee7059890de0ce')

_jp=(
SourceHanSerifJP-Bold.otf
SourceHanSerifJP-ExtraLight.otf
SourceHanSerifJP-Heavy.otf
SourceHanSerifJP-Light.otf
SourceHanSerifJP-Medium.otf
SourceHanSerifJP-Regular.otf
SourceHanSerifJP-SemiBold.otf
)
_kr=(
SourceHanSerifKR-Bold.otf
SourceHanSerifKR-ExtraLight.otf
SourceHanSerifKR-Heavy.otf
SourceHanSerifKR-Light.otf
SourceHanSerifKR-Medium.otf
SourceHanSerifKR-Regular.otf
SourceHanSerifKR-SemiBold.otf
)
_cn=(
SourceHanSerifCN-Bold.otf
SourceHanSerifCN-ExtraLight.otf
SourceHanSerifCN-Heavy.otf
SourceHanSerifCN-Light.otf
SourceHanSerifCN-Medium.otf
SourceHanSerifCN-Regular.otf
SourceHanSerifCN-SemiBold.otf
)
_tw=(
SourceHanSerifTW-Bold.otf
SourceHanSerifTW-ExtraLight.otf
SourceHanSerifTW-Heavy.otf
SourceHanSerifTW-Light.otf
SourceHanSerifTW-Medium.otf
SourceHanSerifTW-Regular.otf
SourceHanSerifTW-SemiBold.otf
)
_otc=(
SourceHanSerif-Bold.ttc
SourceHanSerif-ExtraLight.ttc
SourceHanSerif-Heavy.ttc
SourceHanSerif-Light.ttc
SourceHanSerif-Medium.ttc
SourceHanSerif-Regular.ttc
SourceHanSerif-SemiBold.ttc
)

function _package {
    cd "$srcdir/source-han-serif-${pkgver}R"

    case "$1" in
        $_pkgbase-jp-fonts)
            fonts=(${_jp[@]})
            cd SubsetOTF/JP
            _fontconfig_filename=44-source-han-serif-jp.conf
            pkgdesc="Adobe Source Han Serif Subset OTF - Japanese OpenType/CFF fonts";;
        $_pkgbase-kr-fonts)
            fonts=(${_kr[@]})
            cd SubsetOTF/KR
            _fontconfig_filename=44-source-han-serif-kr.conf
            pkgdesc="Adobe Source Han Serif Subset OTF - Korean OpenType/CFF fonts";;
        $_pkgbase-cn-fonts)
            fonts=(${_cn[@]})
            cd SubsetOTF/CN
            _fontconfig_filename=44-source-han-serif-cn.conf
            pkgdesc="Adobe Source Han Serif Subset OTF - Simplified Chinese OpenType/CFF fonts";;
        $_pkgbase-tw-fonts)
            fonts=(${_tw[@]})
            cd SubsetOTF/TW
            _fontconfig_filename=44-source-han-serif-tw.conf
            conflicts=("$_pkgbase-twhk-fonts")
            replaces=("$_pkgbase-twhk-fonts")
            pkgdesc="Adobe Source Han Serif Subset OTF - Traditional Chinese OpenType/CFF fonts";;
        $_pkgbase-otc-fonts)
            fonts=(${_otc[@]})
            cd OTC
            _fontconfig_filename=44-source-han-serif-otc.conf
            pkgdesc="Adobe Source Han Serif - Pan-CJK OpenType/CFF Collection fonts";;
    esac

    # Prepare destination directory
    install -dm755 "$pkgdir/usr/share/fonts/adobe-source-han-serif"

    # Install fonts
    for font in "${fonts[@]}"; do
        install -m644 "$font" "$pkgdir/usr/share/fonts/adobe-source-han-serif"
    done

    # Install fontconfig fix
    install -d "$pkgdir/etc/fonts/conf.d"
    install -Dm644 "$srcdir/$_fontconfig_filename" "$pkgdir/etc/fonts/conf.avail/$_fontconfig_filename"
    ln -s ../conf.avail/$_fontconfig_filename "$pkgdir/etc/fonts/conf.d/$_fontconfig_filename"

    # Install LICENSE
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

for _pkgname in ${pkgname[@]}; do
    eval "function package_$_pkgname() { _package $_pkgname; }"
done
