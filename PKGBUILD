# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: Jon Sturm <Jasturm002@aol.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=tilp
pkgver=1.17
pkgrel=3
pkgdesc="TI graphing calculator link/transfer program"
arch=(i686 x86_64)
url=http://lpg.ticalc.org/prj_tilp/
license=(GPL2)
depends=(desktop-file-utils libticalcs)
makedepends=(intltool)
optdepends=('gfm: to manage and manipulate TI Group Files (backups)')
install=$pkgname.install
source=(http://sourceforge.net/projects/tilp/files/tilp2-linux/tilp2-$pkgver/${pkgname}2-$pkgver.tar.bz2
    $pkgname.desktop
    $pkgname.xml)
sha256sums=('0bc744463450843c0f1e9deebf45af84a282304aff37865077ca7146d54ff6e7'
    '004443e1c21ee7931bfe74052d7828312e9303681aac50a97c7d6af5cabd3214'
    '613ecd5e8c8a2ac98abde43909c851c365acffd5d2fb553920840347d71836bd')
sha512sums=('78f0242710a8c86a6db7d764e6e524b373aef0384f649b0e538ac1f4a57044fc9adf3aa32da9dc69509b6d835d020026bbdf574cdbb7f1f5a53ab316b987c572'
    '25a0bf3c3fa4dae1cf553304ad180f5f5dc604a2950153b71df43b05f1cd4a2654f32312f46fa9b20b28c03450993cb9afdcce5afa2f3eabc13c11906e21f66a'
    'cd2739fff44f7fb943f55cbd2775a1e265e04eabf8ee7058e333bf4f023d857899c9fa5e27a0d229dcebdc4c473b04a4e70b34e18bc52badc34820cf1383b1c4')

prepare() {
    cd ${pkgname}2-$pkgver/
    sed -i 's:.*serial.*::g' acinclude.m4
    echo '# serial 1' > acinclude.m4.new
    cat acinclude.m4 >> acinclude.m4.new
    mv acinclude.m4{.new,}
}

build() {
    cd ${pkgname}2-$pkgver/
    autoreconf -fi
    #KDE users can remove the --without-kde option to enable kde file dialogs
    ./configure --prefix=/usr --without-kde
    make
}

package() {
    make -C ${pkgname}2-$pkgver DESTDIR="$pkgdir" install
    desktop-file-install $pkgname.desktop --dir "$pkgdir"/usr/share/applications/
    install -Dm644 $pkgname.xml "$pkgdir"/usr/share/mime/packages/$pkgname.xml
}
