# Contributor: Yamashita Ren
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-qt-opensuse
pkgver=6.0.0
_rpmrel=1.1
pkgrel=4
pkgdesc="QT archiver utility (openSUSE x86_64 RPM)"
arch=(x86_64)
url=http://peazip.sourceforge.net/peazip-linux.html
license=(Artistic2.0 LGPL2.1)
depends=(curl desktop-file-utils gmp4 libx11 ncurses qt4pas)
optdepends=(balz lpaq p7zip paq8o quad unace upx rar zpaq)
provides=(${pkgname%-*-*})
conflicts=(${pkgname%-*-*} ${pkgname%-*-*}-gtk2 ${pkgname%-*})
source=(http://download.opensuse.org/repositories/devel:/languages:/pascal/openSUSE_Factory/${arch}/${pkgname%-*-*}-${pkgver}-${_rpmrel}.x86_64.rpm
        https://github.com/FadeMind/archpkgbuilds/blob/master/AUR/customized/peazip-qt-opensuse/peazip_additional_formats_plugin-merged.LINUX.ALL.tar.xz)
sha256sums=('7e2ac057678fb6386c427c978de83f70689d02769ab2501e80cd1bb0c317bff3'
            'f86b659739dc0c7c9e4365f700fae91677cd290fc61743381d14ab300ccded72')

prepare() {
    cd "$srcdir"/usr
    rm -R lib64/peazip/res/upx
    mv share/doc/packages/peazip share/doc
    rmdir share/doc/packages
    mv lib64 lib
}

package() {
    _respath=usr/lib/peazip/res
    cp -R "$srcdir"/usr $pkgdir/
    cp -R "$srcdir"/res/* $pkgdir/$_respath/
    install -d "$pkgdir/$_respath"/7z/Codecs/
    for i in 7z{,a,r,.so,Con.sfx,.sfx} Codecs/Rar{,29}.so; do
        ln -sf /usr/lib/p7zip/$i "$pkgdir/$_respath"/7z/$i
    done    
    for i in quad/{balz,quad} unace/unace upx/upx lpaq/lpaq8 paq/paq8o zpaq/zpaq; do
        install -d "$pkgdir/$_respath"/$(dirname $i)/
        ln -sf /usr/bin/$(basename $i) "$pkgdir/$_respath"/$i
    done
}
