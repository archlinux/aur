# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Contributor: fkxxyz <fkxxyz@163.com>
pkgname=fcitx-baidupinyin
pkgver=1.0.1.0
pkgrel=5
pkgdesc="Fcitx wrapper for Baidu Pinyin IM engine"
arch=("x86_64")
url="https://srfsh.baidu.com/site/guanwang_linux/index.html"
license=("custom")
depends=('glibc' 'glib2' 'fcitx-qt5' 'qt5-quickcontrols')
#Depends shown in .deb: libc6 (>= 2.4), fcitx-bin, fcitx-data (>= 1:4.2.0), fcitx-modules,  libglib2.0-0 (>= 2.12.0), libqt5core5a (>= 5.7.1), qml-module-qtquick-controls (>= 5.5.1)
#optdepends=('fcitx-qimpanel: input method frontend used in baidupinyin')  # use BDIMSettings instead.
install=fcitx-baidupinyin.install
source=(
    'fcitx-baidupinyin.zip::https://imeres.baidu.com/imeres/ime-res/guanwang/img/Ubuntu_Deepin-fcitx-baidupinyin-64.zip'
    'LICENSE' # copied from https://srf.baidu.com/site/linux/service/index.html
) 
sha512sums=(
    '08058b612dc325beeaa9a53d7cd1386e30ed7a460c5c363a34cfb8bae0835f2cdae3450f9ded9534f624b9b10472fc0c1aff5698d6fd2898a7d89c39e8dd408c'
    'fe77a5a4c1c5a4d58f52d62eeaecaa21e8e25105e1ccdc573210c7605970aa1f7e07ad302927b461545b8619a4883a6692fbf51b2f944c7a12536a7140196c2b'
)

package(){
    ar -vx fcitx-baidupinyin.deb --output="${srcdir}"  
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    
    mkdir -p "$pkgdir"/etc/xdg/autostart/
    mv "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/entries/applications/fcitx-ui-baidu-qimpanel.desktop "$pkgdir"/etc/xdg/autostart/fcitx-baidupinyin.desktop
    sed -i  's|/opt/apps/com.baidu.fcitx-baidupinyin/files/bin/bd-qimpanel.watchdog.sh|/usr/bin/bd-qimpanel.watchdog.sh|g' "$pkgdir"/etc/xdg/autostart/fcitx-baidupinyin.desktop
    sed -i 's|Icon=baidu|Icon=fcitx-baidupinyin|g' "$pkgdir"/etc/xdg/autostart/fcitx-baidupinyin.desktop
    cp -r  "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/entries/icons "$pkgdir"/usr/share/
    
    # nowhere to put fcitx-baidupinyin.mo for fuzzy pinyin, just delete, works fine. location : "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/entries/locale/zh_CN/LC_MESSAGES/fcitx-baidupinyin.mo
    rm -r "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/entries 
    
    mkdir -p "$pkgdir"/usr/lib/fcitx/
    mv "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/files/lib/fcitx*  "$pkgdir"/usr/lib/fcitx/
    cp -r "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/files/* "$pkgdir"/usr/
    sed -i  's|/opt/apps/com.baidu.fcitx-baidupinyin/files/bin/baidu-qimpanel|/usr/bin/baidu-qimpanel|g' "$pkgdir"/usr/bin/bd-qimpanel.watchdog.sh
    
    # use BDIMSettings as its configtool, if you want to use fcitx-qimpanel, comment this line
    if [ ! -f '/usr/bin/fcitx-qimpanel-configtool' ]; then
        mv "$pkgdir"/usr/bin/BDIMSettings "${pkgdir}"/usr/bin/fcitx-qimpanel-configtool
    fi
    
    # data should be moved to ~/.config/BaiduPY.user manually
    mkdir -p "$pkgdir"/tmp/
    mv "$pkgdir"/usr/share/data "$pkgdir"/tmp
    
    # install license
    install -Dm644 "${srcdir}/LICENSE"  "${pkgdir}/usr/share/licenses/fcitx-baidupinyin/license.html"
    # clean up unused files
    rm -rf "$pkgdir"/opt/apps
    rm -rf "$pkgdir"/usr/lib/*-linux-gnu
    rm -r "$pkgdir"/fcitx-baidupinyin.deb
    rm  "$pkgdir"/usr/bin/BDIMWizard
}
