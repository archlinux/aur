# Maintainer: zer0def <zer0def@github>
# Contributor: Konrad Borowski <konrad@borowski.pw>
pkgname=klient-jpk-2.0
pkgver=1.0.4.9
pkgrel=1
pkgdesc="A tool for submitting JPK files (Standard Audit File for Tax equivalent) to Ministerstwo Finansów (Polish Ministry of Finance)"
arch=('i686' 'x86_64')
url="https://finanse-arch.mf.gov.pl/web/wp/pp/jpk/aplikacje-do-pobrania"
license=(custom)
depends=(java8-openjfx)
makedepends=(openssl)

_default_ver="${pkgver//\./_}"
#_gen_ver="1_0_4_6"
#_jpk_ver="1_0_4_6"
#_resource_ver="1_0_4_6"
#_launcher_ver="1_0_4_6"

source=(
    "http://www.mf.gov.pl/documents/764034/5134536/TransmitterGen_${_gen_ver:=${_default_ver}}_lib.update"
    "http://www.mf.gov.pl/documents/764034/5134536/TransmitterJPK_${_jpk_ver:=${_default_ver}}_lib.update"
    "http://www.mf.gov.pl/documents/764034/5134536/TransmitterLauncher_${_launcher_ver:=${_default_ver}}_lib.update"
    "http://www.mf.gov.pl/documents/764034/5134536/TransmitterResources_${_resource_ver:=${_default_ver}}_lib.update"
    'https://www.podatki.gov.pl/media/1150/mfcsfp.cer'
    start.sh
)
noextract=(
    "TransmitterGen_${_gen_ver}_lib.update"
    "TransmitterJPK_${_jpk_ver}_lib.update"
    "TransmitterLauncher_${_launcher_ver}_lib.update"
    "TransmitterResources_${_resource_ver}_lib.update"
)

# per http://www.mf.gov.pl/documents/764034/5134536/RELEASE.txt, but duck MD5
#md5sums=(
#    97248a998392059ce56412e6a7c5bdbc
#    06320d9f028ffc9b3a8f6a142d03d6ed
#    07544b4cdff35877aaee9b18c16c1e10
#    f4a0dc1d9d923d3700423144aaf6e1b4
#    467745c62bc2f72c1d5c9b4f73b71f75
#    27d4330c9e3d4e3b969a33d910d85598
#)
sha256sums=(
    1b3341f31dd0d86c9bc4e56a2ba443516ad053aa2ef0e20d55c34abd3534a8fd
    fbe650d566c0ef6d027613a78eeffd6c93305d6b8a5877c7a5a4b5962bd91998
    8cc5ad6bfa82fadf0f1564c1ac4625e4a917aa6de2d88dac67efc77c26657d62
    64c6b70ddec124a5a74265879b0cf22ff1017ddec01ff33f706a6ee1b70e7699
    c539940e74493d559cf494313e3a0a72626be86bc31ef3cb8c3da1323640063b
    8c5805dcd59f24ab1fcca9837d4335570eb7427938f653e8f51c8d8944a9057f
)

if [ "${CARCH}" = 'i686' ]; then
    source+=("$pkgname-$pkgver.sh::https://www.podatki.gov.pl/media/3056/klient_jpk_2-i386.sh"
             "$pkgname-$pkgver.sh.p7s::https://www.podatki.gov.pl/media/1147/klient_jpk_2-i386-sh.p7s")
    sha256sums+=(c4f08b80120e1c45aad66a2ea35bb3d988497b61fb626f3d0d0dfff629e36948
                 79792f87f5573db5edbabb8c908a7859ec5230789963791a156df1aef77bac69)
    #md5sums+=(7c0bac9cd96d83f75c8c950ea93fc7f9
    #          6812824da4e39b028b0e929b100fe5d8)
elif [ "${CARCH}" = 'x86_64' ]; then
    source+=("$pkgname-$pkgver.sh::https://www.podatki.gov.pl/media/3055/klient_jpk_2-amd64.sh"
             "$pkgname-$pkgver.sh.p7s::https://www.podatki.gov.pl/media/1146/klient_jpk_2-amd64-sh.p7s")
    sha256sums+=(6956d9c2e1e587ce33f77e497557c80b512cb1ba0c3d6b4d0512476c309a97cc
                 adf917711012ef3a8d2e8d1289d9deaa33d1eee6f7f5245fd7abeae35dd4b700)
    #md5sums+=(bac043178fe63f0806d6b19771f3039c
    #          65ba7ced8ffe59dd188dcdae08699363)
fi

prepare() {
    openssl smime -verify -inform DER -in ${pkgname}-${pkgver}.sh.p7s -content ${pkgname}-${pkgver}.sh -certfile mfcsfp.cer -noverify >/dev/null
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
    install -D "$srcdir/TransmitterGen_${_gen_ver}_lib.update" "$pkgdir/opt/klient-jpk/jpk/TransmitterGen.lib"
    install -D "$srcdir/TransmitterJPK_${_jpk_ver}_lib.update" "$pkgdir/opt/klient-jpk/jpk/TransmitterJPK.lib"
    install -D "$srcdir/TransmitterResources_${_resource_ver}_lib.update" "$pkgdir/opt/klient-jpk/jpk/TransmitterResources.lib"
    install -D "$srcdir/TransmitterLauncher_${_launcher_ver}_lib.update" "$pkgdir/opt/klient-jpk/jpk/TransmitterLauncher.lib"
}
