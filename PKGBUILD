# Maintainer: Konrad Borowski <konrad@borowski.pw>
pkgname=klient-jpk-2.0
pkgver=1.0.4.1
pkgrel=1
pkgdesc="A tool for submitting JPK files to Ministerstwo Finansów"
arch=(any)
url="https://www.podatki.gov.pl/jednolity-plik-kontrolny/aplikacje-do-pobrania/"
license=(custom)
depends=(java-openjfx java-runtime)
source=("$pkgname-$pkgver.sh::https://www.podatki.gov.pl/media/3055/klient_jpk_2-amd64.sh"
        "http://www.mf.gov.pl/documents/764034/5134536/TransmitterResources_1_0_4_1_lib.update"
        start.sh)
sha256sums=('6956d9c2e1e587ce33f77e497557c80b512cb1ba0c3d6b4d0512476c309a97cc'
            '32765b6145195dbddb0cdfc1c3d5fe16700b42004a3cac7f6b0c67bd2afa8017'
            '1867c95b8465c6ace79451a0924ca86e9c0ce4061af78fbaafc364c16a28fbca')

prepare() {
    sed -e '1,/^PAYLOAD:$/d' "$pkgname-$pkgver.sh" | tar zxf - --one-top-level="$pkgname-$pkgver"
    # No reason to use provided Java runtime, when there is a perfectly fine system Java
    rm -r "$pkgname-$pkgver/jre"
    mv "$pkgname-$pkgver/jpkt.desktop" .
    sed -i 's;APPLICATION_PATH;/opt/klient-jpk;' jpkt.desktop
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    find -type f -exec install -D {} "$pkgdir/opt/klient-jpk/{}" \;
    install -D "$srcdir/start.sh" "$pkgdir/opt/klient-jpk/start.sh"
    install -D "$srcdir/jpkt.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -D "$srcdir/TransmitterResources_1_0_4_1_lib.update" "$pkgdir/opt/klient-jpk/jpk/TransmitterResources.lib"
}
