# Maintainer: ida-lover <ida-lover@proton.me>
pkgname=ida-pro-patched
_pkgname=ida-pro
pkgver=9.0
pkgrel=1
pkgdesc="IDA - The Interactive Disassembler (Patched)"
arch=('x86_64')
url="https://hex-rays.com/ida-pro/"
license=('custom')
makedepends=('fakechroot')
depends=('python>=3' 'python<4')
options=('!strip')
_name="$_pkgname-$pkgver"
source=(
    "$_name.run::https://out5.hex-rays.com/beta90_6ba923/idapro_90_x64linux.run"
    "patch.py"
    "$_pkgname.desktop"
)
sha256sums=('0b12a798f0e2ab7c5b7a795eb275136af7fce88356fddefd7f7776c6aa588372'
            '6c17bab8d31a7a72641a6b2d13de90ab9e26757b02124d2bc588b45d21912e89'
            'aebb90e61e40e6cacf6493ecd8308a3389d2ebe5afd1503209250b38a0b89a95')

prepare() {
    mkdir -p "$_name/tmp"
    cp "$srcdir/$_name.run" "$_name"
    chmod +x "$_name/$_name.run"
    fakechroot chroot "$srcdir/$_name" "/$_name.run" --mode unattended --unattendedmodeui none --prefix /opt/$_name
    cd "$_name/opt/$_name"
    python3 "$srcdir/patch.py"
    mv -v libida.so.patched libida.so
    mv -v libida64.so.patched libida64.so
    rm uninstall* Uninstall*
}

package() {
    install -dm755 "$pkgdir/opt/$_pkgname"
    cp --preserve=mode,timestamps -r "$srcdir/$_name/opt/$_name/"* "$pkgdir/opt/$_pkgname"

    install -dm755 "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/ida64" "$pkgdir/usr/bin/ida64"

    install -Dm644 "$srcdir/$_name/opt/$_name/appico.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
