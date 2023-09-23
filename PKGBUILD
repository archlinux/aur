pkgname=fcitx5-sogou
pkgver=10.0.9.0.6
pkgrel=1
pkgdesc="Sogou Pinyin for Linux"
arch=("x86_64")
url="https://shurufa.sogou.com/linux"
license=("custom")
makedepends=("chrpath")
depends=("fcitx5" "hicolor-icon-theme" "glibc" "gcc-libs" "qt5-base" "openal" "libx11" "libxtst" "systemd-libs" "gtk3" "gdk-pixbuf2" "glib2" "dbus" "cairo" "curl")
source=("http://archive.build.openkylin.top/openkylin/pool/pty/c/cpis/cpis-base_10.0.9.0.6_amd64.deb"
        "http://archive.build.openkylin.top/openkylin/pool/pty/s/sogou-ime-ng-data/sogou-ime-ng-cpis-dict-keyboard-chs-pcpy_10.0.1-48_all.deb"
        "http://archive.build.openkylin.top/openkylin/pool/pty/s/sogou-ime-ng-data/sogou-ime-ng-cpis-dict-keyboard-chs-pcwb_10.0.1-48_all.deb"
        "http://archive.build.openkylin.top/openkylin/pool/pty/s/sogou-ime-ng-data/sogou-ime-ng-cpis-dict-keyboard-multilingual-pcen_10.0.1-48_all.deb"
        "http://archive.build.openkylin.top/openkylin/pool/pty/s/sogou-ime-ng-data/sogou-ime-ng-cpis-user-default-profile_10.0.1-48_all.deb"
        "http://archive.build.openkylin.top/openkylin/pool/pty/s/sogou-ime-ng/sogou-ime-ng-fcitx5-kylin-desktop_10.0.9.0.6-20230921003706_amd64.deb"
        "http://archive.build.openkylin.top/openkylin/pool/pty/s/sogou-ime-ng/sogou-ime-ng_10.0.9.0.6-20230921003706_amd64.deb")
noextract=("${source[@]##*/}")
sha256sums=('639f459cb1f5110a7f161fa4329832bc542483db895e30591726b20ea69af8b7'
            '5ed618852c4ff691d1a13bc1c36d3e94a931019c93d32b321d6b150ec3d31140'
            '39e3e00ad43071122b3ef31da3b5864f1f620ddadfe056050bc75be51cea026b'
            'a63571863249ce86a3ec510c07ea55a00459bc782cedfb9d6a99d9c205116ddc'
            'b6d98c6ec9eebcd7c579c9e845d7de04bb7ea682adc738da67e186a4cc99233a'
            'df58e0463ad0cdd5d07193376ccfedec335ac302cad61deeaec8e4202c3273d8'
            '43dda80262345bb25f3b0fcbd0558a49b16b521231f0a646bd0ac1096e86519b')

prepare() {
    for deb in "${noextract[@]}"; do
        dir=${deb/.deb/}
        mkdir -p $dir
        bsdtar -C $dir -xf $deb
    done
}

package() {
    for deb in "${noextract[@]}"; do
        dir=${deb/.deb/}
        bsdtar -C $pkgdir -xf $dir/data.tar.*
    done

    chrpath -d $pkgdir/usr/lib/x86_64-linux-gnu/cpis-engine-plugin/sogou/libsogounlp.so
    chrpath -d $pkgdir/usr/lib/x86_64-linux-gnu/cpis-engine-plugin/sogou/libhandwriting_fc.so

    mkdir $pkgdir/usr/lib/fcitx5
    ln -s /usr/lib/x86_64-linux-gnu/cpis-module-im-fcitx5.so $pkgdir/usr/lib/fcitx5/libcpis-module-im-sogou-ime-ng-fcitx5-kylin-desktop.so
}
