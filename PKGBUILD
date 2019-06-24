# Maintainer: Konrad Borowski <konrad@borowski.pw>
pkgname=klient-jpk-2.0
pkgver=1.0.4.3
pkgrel=2
pkgdesc="A tool for submitting JPK files to Ministerstwo Finansów"
arch=('i686' 'x86_64')
url="https://www.podatki.gov.pl/jednolity-plik-kontrolny/aplikacje-do-pobrania/"
license=(custom)
depends=(java8-openjfx)
source=('http://www.mf.gov.pl/documents/764034/5134536/TransmitterResources_1_0_4_2_lib.update'
        'http://www.mf.gov.pl/documents/764034/5134536/TransmitterLauncher_1_0_4_3_lib.update'
        'https://www.podatki.gov.pl/media/1150/mfcsfp.cer'
        start.sh)
sha256sums=('28047564fdcd996386172241007ccee31eaedea53bf70cdad84b0997069865d6'
            '1c0d261240ebf7d936c8ba1f572ef509548a1c7a5cad535a63e4061e0078a043'
            'c539940e74493d559cf494313e3a0a72626be86bc31ef3cb8c3da1323640063b'
            '19234d788ccaf35186eefb6a1bf204f405b358c1432e76e6304291f833c0405c')

if [ "${CARCH}" = 'i686' ]; then
    source+=("$pkgname-$pkgver.sh::https://www.podatki.gov.pl/media/3056/klient_jpk_2-i386.sh"
             "$pkgname-$pkgver.sh.p7s::https://www.podatki.gov.pl/media/1147/klient_jpk_2-i386-sh.p7s")
    sha256sums+=('c4f08b80120e1c45aad66a2ea35bb3d988497b61fb626f3d0d0dfff629e36948'
                 '79792f87f5573db5edbabb8c908a7859ec5230789963791a156df1aef77bac69')
elif [ "${CARCH}" = 'x86_64' ]; then
    source+=("$pkgname-$pkgver.sh::https://www.podatki.gov.pl/media/3055/klient_jpk_2-amd64.sh"
             "$pkgname-$pkgver.sh.p7s::https://www.podatki.gov.pl/media/1146/klient_jpk_2-amd64-sh.p7s")
    sha256sums+=('6956d9c2e1e587ce33f77e497557c80b512cb1ba0c3d6b4d0512476c309a97cc'
                 'adf917711012ef3a8d2e8d1289d9deaa33d1eee6f7f5245fd7abeae35dd4b700')
fi

prepare() {
    sed -e '1,/^PAYLOAD:$/d' "$pkgname-$pkgver.sh" | tar zxf - --one-top-level="$pkgname-$pkgver"
    # No reason to use provided Java runtime, when there is a perfectly fine system Java
    rm -r "$pkgname-$pkgver/jre"
    mv "$pkgname-$pkgver/jpkt.desktop" .
    sed -i 's;APPLICATION_PATH;/opt/klient-jpk;' jpkt.desktop
    # no signature checking yet, but since it's provided, why not?
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    find -type f -exec install -D {} "$pkgdir/opt/klient-jpk/{}" \;
    install -D "$srcdir/start.sh" "$pkgdir/opt/klient-jpk/start.sh"
    install -D "$srcdir/jpkt.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -D "$srcdir/TransmitterResources_1_0_4_2_lib.update" "$pkgdir/opt/klient-jpk/jpk/TransmitterResources.lib"
    install -D "$srcdir/TransmitterLauncher_1_0_4_3_lib.update" "$pkgdir/opt/klient-jpk/jpk/TransmitterLauncher.lib"
}
