# Maintainer: Konrad Borowski <konrad@borowski.pw>
pkgname=klient-jpk-2.0
pkgver=1.0.4.0
pkgrel=2
pkgdesc="A tool for submitting JPK files to Ministerstwo Finansów"
arch=(any)
url="https://www.finanse.mf.gov.pl/en/web/wp/pp/jpk/aplikacje-do-pobrania"
license=(custom)
depends=(java-openjfx java-runtime)
source=("$pkgname-$pkgver.sh::https://www.finanse.mf.gov.pl/c/document_library/get_file?uuid=835cd7d9-4c87-49f3-ae28-10475aa1d289&groupId=766655"
        start.sh)
sha256sums=(6956d9c2e1e587ce33f77e497557c80b512cb1ba0c3d6b4d0512476c309a97cc
            1867c95b8465c6ace79451a0924ca86e9c0ce4061af78fbaafc364c16a28fbca)

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
}
