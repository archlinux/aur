# Maintainer: Bian Jiaping <ssbianjp [AT] gmail.com>
# Contributor: Jove Yu <yushijun110 [AT] gmail.com>
# Contributor: csslayer <wengxt [AT] gmail.com>
# Contributor: Felix Yan <felixonmars [AT] gmail.com>

pkgname=fcitx-sogoupinyin
pkgver=2.2.0.0102
pkgrel=2
pkgdesc="Sogou Pinyin for Linux"
arch=('x86_64' 'i686')
url="https://pinyin.sogou.com/linux/"
license=('custom')
depends=('fcitx' 'opencc' 'libidn' 'lsb-release' 'xorg-xprop' 'qtwebkit')

_i686_time=1509619879
_x86_64_time=1509619794
source=('sogou-autostart')
source_i686=("http://cdn2.ime.sogou.com/dl/index/${_i686_time}/sogoupinyin_${pkgver}_i386.deb")
source_x86_64=("http://cdn2.ime.sogou.com/dl/index/${_x86_64_time}/sogoupinyin_${pkgver}_amd64.deb")

md5sums=('d20f07816f7be4bcd11e7a6f527de425')
md5sums_x86_64=('2a58e8b4c2ae619e2b3f706665a559d5')
md5sums_i686=('6845cbfe09d0e1b5a6c62c3c092a9c09')

package(){
    cd ${srcdir}

    tar -xJvf data.tar.xz -C "${pkgdir}"

    mv "$pkgdir"/usr/lib/*-linux-gnu/fcitx "$pkgdir"/usr/lib/
    rmdir "$pkgdir"/usr/lib/*-linux-gnu

    # Avoid warning "No such key 'Gtk/IMModule' in schema 'org.gnome.settings-daemon.plugins.xsettings'"
    sed -i "s#Gtk/IMModule=fcitx#overrides={'Gtk/IMModule':<'fcitx'>}#" "$pkgdir"/usr/share/glib-2.0/schemas/50_sogoupinyin.gschema.override

    rm -r "$pkgdir"/usr/share/keyrings
    rm -r "$pkgdir"/etc/X11

    ln -s /usr/lib/libopencc.so "$pkgdir"/usr/lib/libopencc.so.1

    install -m755 sogou-autostart "$pkgdir"/usr/bin

    sed -i 's/sogou-qimpanel\ %U/sogou-autostart/g' "$pkgdir"/etc/xdg/autostart/fcitx-ui-sogou-qimpanel.desktop
}
