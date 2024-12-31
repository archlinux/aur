pkgname=fcitx5-sogou
pkgver=10.0.9.0.6
pkgrel=2
pkgdesc="Sogou Pinyin for Linux"
arch=("x86_64")
url="https://shurufa.sogou.com/linux"
license=("custom")
makedepends=("chrpath")
depends=(
    "fcitx5" "hicolor-icon-theme"
    "glibc" "gcc-libs" "qt5-base" "openal" "libx11" "libxtst"
    "systemd-libs" "gtk3" "gdk-pixbuf2" "glib2" "dbus" "cairo" "curl"
)
optdepends=("kcm-fcitx5")
# mirrors="http://archive.build.openkylin.top"
mirrors="https://mirrors.aliyun.com"
source=(
    "${mirrors}/openkylin/pool/pty/c/cpis/cpis-base_10.0.9.0.6-202311280935_amd64.deb"

    "${mirrors}/openkylin/pool/pty/s/sogou-ime-ng-data/sogou-ime-ng-cpis-dict-keyboard-chs-pcpy_10.0.1-48.1_all.deb"
    "${mirrors}/openkylin/pool/pty/s/sogou-ime-ng-data/sogou-ime-ng-cpis-dict-keyboard-chs-pcwb_10.0.1-48.1_all.deb"
    "${mirrors}/openkylin/pool/pty/s/sogou-ime-ng-data/sogou-ime-ng-cpis-dict-keyboard-multilingual-pcen_10.0.1-48.1_all.deb"
    "${mirrors}/openkylin/pool/pty/s/sogou-ime-ng-data/sogou-ime-ng-cpis-user-default-profile_10.0.1-48.1_all.deb"

    "${mirrors}/openkylin/pool/pty/s/sogou-ime-ng/sogou-ime-ng-fcitx5-kylin-desktop_10.0.9.0.6-20231128000607_amd64.deb"
    "${mirrors}/openkylin/pool/pty/s/sogou-ime-ng/sogou-ime-ng_10.0.9.0.6-20231128000607_amd64.deb"
)
noextract=("${source[@]##*/}")
sha256sums=(
    '615482541d573bd5b07d119f9b5f93d741a7c5a4d89fc6cc3bd93c1b76205af5'

    'ee40d758cd557d238cfc398af0fdc7480e7df6ea30566ff7fbdeca4add35822f'
    '5d02a30b88fc977dba6a04eea3f73b949d7becbded816581f6c271dad2f8ab32'
    'cebb053ac612ce64e97b69557f1c9911207e198cc0d8c7e57d8e0a20b722d45c'
    'fb5268eae8870a08988e81f0839d3c2f0ad7898b6871bb4e5cfe739bfc8a0d54'

    '99fd9f7b512cc367b44f13029b282fcb2387ddb1e26f7caa1ffa1cfe5f0b5532'
    '9fd28578f1980ed715bcda5e7e0ae80239638e3af82f57c3d156f8d5946e6c82'
)
# sha256sums=(
#     'SKIP'

#     'SKIP'
#     'SKIP'
#     'SKIP'
#     'SKIP'
    
#     'SKIP'
#     'SKIP'
# )

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
