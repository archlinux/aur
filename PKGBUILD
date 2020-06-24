# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Contributor: fkxxyz <fkxxyz@163.com>
pkgname=fcitx-baidupinyin
pkgver=1.0.1.0
pkgrel=9
pkgdesc="Fcitx wrapper for Baidu Pinyin IM engine"
arch=("x86_64")
url="https://srfsh.baidu.com/site/guanwang_linux/index.html"
license=("custom")
depends=('glibc' 'glib2' 'fcitx-qt5' 'qt5-quickcontrols')
#Depends shown in .deb: libc6 (>= 2.4), fcitx-bin, fcitx-data (>= 1:4.2.0), fcitx-modules,  libglib2.0-0 (>= 2.12.0), libqt5core5a (>= 5.7.1), qml-module-qtquick-controls (>= 5.5.1)
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
    cp -r "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/entries/locale "$pkgdir"/usr/share/
    
    mkdir -p "$pkgdir"/usr/lib/fcitx/
    mv "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/files/lib/fcitx*  "$pkgdir"/usr/lib/fcitx/
    mv "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/files/lib/*  "$pkgdir"/usr/lib/
    
    mkdir -p "$pkgdir"/usr/bin/
    mv "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/files/bin/baidu-qimpanel "$pkgdir"/usr/bin/
    mv "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/files/bin/bd-qimpanel.watchdog.sh "$pkgdir"/usr/bin/
    sed -i  's|/opt/apps/com.baidu.fcitx-baidupinyin/files/bin/baidu-qimpanel|/usr/bin/baidu-qimpanel|g' "$pkgdir"/usr/bin/bd-qimpanel.watchdog.sh
    
    mkdir -p "$pkgdir"/opt/fcitx-baidupinyin/
    mv "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/files/bin/BDIMSettings "$pkgdir"/opt/fcitx-baidupinyin/
    
    
    # change the /opt/apps/... directory string in baidu-qimpanel to /opt/fcitx-baidupinyin/, add \x0 to make the strings be of the same length
    sed -i 's|/opt/apps/com.baidu.fcitx-baidupinyin/files/bin/BDIMSettings|/opt/fcitx-baidupinyin/BDIMSettings\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0\x0|g' "$pkgdir"/usr/bin/baidu-qimpanel
    
    # move needed resources
    mv "$pkgdir"/opt/apps/com.baidu.fcitx-baidupinyin/files/share/data "$pkgdir"/opt/fcitx-baidupinyin/
    
    install -Dm644 "${srcdir}/LICENSE"  "${pkgdir}/usr/share/licenses/fcitx-baidupinyin/LICENSE"
    
    # clean up unused files
    rm -rf "$pkgdir"/opt/apps
    rm -rf "$pkgdir"/usr/lib/*-linux-gnu
    rm -r "$pkgdir"/fcitx-baidupinyin.deb
}
