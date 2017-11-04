# Maintainer: Tom Bebbington <tophattedcoder@gmail.com>

_pkgbase='citra'
pkgbase="$_pkgbase-nightly-bin"
pkgname=("$_pkgbase-nightly-bin" "$_pkgbase-qt-nightly-bin")
pkgrel=4
pkgver="385_20171031_ed17c54"
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
provides=('citra' 'citra-qt')
builddepends=('curl' 'python')
license=('GPL')
arch=('x86_64')
url="https://github.com/citra-emu/citra-nightly/"
id="$(echo $pkgver | cut -d'_' -f2)-$(echo $pkgver | cut -d'_' -f3)"
source=(
    "https://github.com/citra-emu/citra-nightly/releases/download/nightly-$(echo $pkgver | cut -d'_' -f1)/citra-linux-$id.tar.xz"
    "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.desktop"
    "https://raw.githubusercontent.com/citra-emu/citra/master/dist/citra.svg"
    "print-version.py"
    "citra.bash"
    "citra-qt.bash"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'c6a5826c2ec4133ebd1af3d2613a6b1882af1b97038c271b79dd0cd52ec3c6ac'
            '068409ef70c25e8da3f0430c5ff62609d122f2f857525940da8cd792a228a822'
            '61bcee69be306b58fd0bdf6327cdfc88260ba9f9d0694cf54e2d720965bc918b')

pkgver() {
    cd $srcdir
    curl "https://api.github.com/repos/citra-emu/citra-nightly/releases" -o releases.json
    python3 print-version.py
}
package_citra-nightly-bin() {
	depends=('sdl2' 'libpng' 'libpng12' 'libcurl-compat' 'bash')

    mkdir -p "${pkgdir}/usr/bin"
    cp $srcdir/citra.bash "${pkgdir}/usr/bin/citra"
    cd $srcdir/citra-linux-$id
    mkdir -p "${pkgdir}/opt/citra"
    cp citra "${pkgdir}/opt/citra"
}
package_citra-qt-nightly-bin() {
	depends=('qt5-base' 'shared-mime-info' 'desktop-file-utils' 'libcurl-compat' 'bash')
	optdepends=('libxkbcommon-x11: for X11 support'
	            'qt5-wayland: for Wayland support')

    mkdir -p $pkgdir/usr/bin
    cp $srcdir/citra-qt.bash "${pkgdir}/usr/bin/citra-qt"
    cd $srcdir/citra-linux-$id
    mkdir -p $pkgdir/opt/citra
    mv citra-qt $pkgdir/opt/citra
    mkdir -p $pkgdir/usr/share/applications
    cp $srcdir/citra.desktop $pkgdir/usr/share/applications
    mkdir -p $pkgdir/usr/share/pixmaps
    cp $srcdir/citra.svg $pkgdir/usr/share/pixmaps
}