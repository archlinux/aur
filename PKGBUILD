# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: JonimusPrime <jasturm002@aol.com>
# Contributor: wandrian <wandrian@tuxfamily.org>

pkgname=gfm
pkgver=1.07
pkgrel=2
pkgdesc="TIgroup files manipulator for TiLP"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_gfm/
license=(GPL2)
depends=(desktop-file-utils libglade libticalcs)
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/tilp/tilp2-linux/tilp2-1.17/$pkgname-$pkgver.tar.bz2
    $pkgname.desktop)
sha256sums=('5356769f5d874aed3fe138161ae628af6a74551b992c954f64d155493fc07f71'
    'bb83b95fcecf25ac64a8c156df6d4bcc0b9d41eca408052b5d3d8e08c78c3d43')
sha512sums=('5ca701c9b2749566f6f784554d67fc6a4d2247a55e4df339df2d9f644b37d7b0896b64dd4cf76c4f6d10c4006efa6b052ac4e2ff5c619a55bba6a2756b4d3f86'
    '1848a9b3877f9777a4fbfb793707874db27386b7b605610c5a7b9ea62f50705ec22fdadc8d4c7fa1f5ccc4fee19674bacb033f0125d0f3e0b409d123106d4f33')

prepare() {
    cd $pkgname-$pkgver/
    sed -i 's:.*serial.*::g' acinclude.m4
    echo '# serial 1' > acinclude.m4.new
    cat acinclude.m4 >> acinclude.m4.new
    mv acinclude.m4{.new,}
}

build() {
    cd $pkgname-$pkgver/
    autoreconf -fi
    #KDE users can remove the --without-kde option to enable kde file dialogs
    ./configure --prefix=/usr --without-kde
    make
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    cd "$pkgdir"/usr/share/
    install -d pixmaps/
    ln -s /usr/share/$_pkgname/pixmaps/$_pkgname.xpm pixmaps/
}
