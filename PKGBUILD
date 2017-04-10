# Maintainer: Nissar Chababy <funilrys at outlook dot com>
pkgname=kaku-bin
pkgver=1.8.5
pkgrel=1
pkgdesc="The next generation music client."

arch=('x86_64' 'i686')
url="http://kaku.rocks"
license=('MIT')
depends=('gconf' 'gtk2' 'fuse' 'xdg-utils' 'libxtst' 'libxss' 'nss' 'alsa-lib')
conflicts=('kaku')
options=(!strip)

source=("https://raw.githubusercontent.com/EragonJ/Kaku/master/LICENSE" "http://kaku.rocks/public/img/logo.png")
source_x86_64=("https://github.com/funilrys/Kaku/releases/download/$pkgver-Linux/Kaku-$pkgver.tar.gz")
source_i686=("https://github.com/funilrys/Kaku/releases/download/$pkgver-Linux/Kaku-$pkgver-ia32.tar.gz")

sha512sums=('354016d1de60b330e50f996dcdf61989091b44b28f096f7cb83f83c006cb2d51ef3da94a49d2ba73b71bc294a206a524d38a6b3c0f5bf1cc3ac6048d57624b04' 'fbc59e8bc4b3e39bbdf75a824e3f1e3accd372bf1fda194ec433443feff88158a0df14cac0f3a1a3aef18ada98c3b02b40b5b254d1096ae28e3a84aace8b842f')
sha512sums_x86_64=('6de387c00e99e2b732a44942ef86be11ba98bce4869bacb6791b6cb1618f26113ae33a31ea3d9a98da2d07fb4886a71656e31458ea4ae29a7ed191565e4e3f26')
sha512sums_i686=('66cacc2f4e30ac4472975c46881e4446ad645d7f4adc7a6d6487c02c2a29036656017a367004b34d5ce24fdef0590b84c172fbdcabe5988e9cf5eb16e29b03f9')

package() {
    install -dm755 "$pkgdir"{/usr/share/applications,/usr/{bin,share/$pkgname/{locales,misc/linux,resources}}}
    install -Dm644 logo.png "$pkgdir/usr/share/$pkgname/"

    if [ $CARCH == "x86_64" ]
    then
        cd $srcdir/Kaku-$pkgver
    else
        cd $srcdir/Kaku-$pkgver-ia32
    fi

    install -D -m644 locales/* "$pkgdir/usr/share/$pkgname/locales"
    sed -i 's|Icon=/usr/share/kaku/logo.png|Icon=/usr/share/kaku-bin/logo.png|g' misc/linux/*.desktop
    install -Dm644 misc/linux/*.desktop "$pkgdir/usr/share/$pkgname/misc/linux"
    install -Dm644 misc/linux/kaku.desktop $pkgdir/usr/share/applications/

    find . -type f -maxdepth 1 -exec cp {} "$pkgdir/usr/share/$pkgname/" \; 2>/dev/null
    cp -r resources/* "$pkgdir/usr/share/$pkgname/resources/"

    find "$pkgdir/usr/share/$pkgname/" -type f -exec chmod 644 {} \; 2>/dev/null
    chmod 755 "$pkgdir/usr/share/$pkgname/Kaku" "$pkgdir/usr/share/$pkgname/libnode.so" "$pkgdir/usr/share/$pkgname/libffmpeg.so"
    chmod 755 -R "$pkgdir/usr/share/$pkgname/resources/"

    ln -s /usr/share/$pkgname/Kaku $pkgdir/usr/bin/kaku
}
