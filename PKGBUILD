# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=ricoh-mp2014-gdi
pkgver=1.01
pkgrel=1
pkgdesc="Ricoh MP 2014 series printer driver (GDI)"
arch=('x86_64')
url="https://support.ricoh.com/bb/html/dr_ut_e/apc/model/mp2014/mp2014.htm?lang=en"
license=('custom:proprietary')
depends=('cups' 'lib32-libcups')
makedepends=('7zip')
provides=('ricoh-mp2014-gdi')
conflicts=('ricoh-mp2014-gdi')
source=("https://support.ricoh.com/bb/pub_e/dr_ut_e/0001276/0001276935/V101/z71456en.exe")
sha256sums=('3b827a2f9ced1d985b6f3928d951790fc54f509b425a8cdbdf383bb356c43562')

prepare() {
    cd "$srcdir"

    # Extract the exe file (it's a self-extracting archive)
    7z x -y z71456en.exe -oexe_extracted

    # Find and extract the deb file
    find exe_extracted -name "*.deb" -exec ar x {} \;
}

package() {
    cd "$srcdir"

    # Extract data from deb
    tar -xf data.tar.* -C "$pkgdir"

    # Remove /tmp directory from package (not needed)
    rm -rf "$pkgdir/tmp"

    # Fix permissions and ownership (deb has wrong owner)
    find "$pkgdir" -type d -exec chmod 755 {} \;
    find "$pkgdir" -type f -exec chmod 755 {} \;
    chown -R root:root "$pkgdir/usr"
}
