# Maintainer: Dariusz Dumas <dariusz@dareme.org>
pkgname=e-dowod
pkgver=4.3.0
pkgrel=1
pkgdesc="Helper tools for managing Polish electronic identity documents, enabling secure authentication and digital signing."
arch=('x86_64')
url="https://www.gov.pl/web/mswia/oprogramowanie-do-pobrania"
license=('custom' "MIT")
depends=('fakechroot')
makedepends=('fakeroot')
source=("https://www.gov.pl/pliki/edowod/$pkgname-$pkgver.run")
md5sums=('8bf382fa53377e05bd58398b592449e7')
options=(!strip)

build() {
WORKDIR="$srcdir/chroot"
rm -rf $WORKDIR 
mkdir -p $WORKDIR
cd $WORKDIR
mkdir tmp bin
ln -sf /bin/sh ./bin
ln -sf /bin/rm ./bin
ln -sf /bin/chmod ./bin
cp $srcdir/$pkgname-$pkgver.run ./bin/$pkgname-$pkgver.run
chmod +x ./bin/$pkgname-$pkgver.run

mkdir -p ./usr/share/applications/
mkdir -p ./etc/xdg/autostart

fakechroot fakeroot chroot . $pkgname-$pkgver.run  install --accept-licenses --confirm-command

# remove temporary files for fakechroot
rm -rf bin tmp
# remove installer files
cd opt/$pkgname && rm -rf uninstall* installerResources installer.dat components.xml InstallationLog.txt
}

package() {
cd $srcdir/chroot
mkdir -p usr/share/
mv opt/$pkgname/Licenses/ usr/share/licenses
cp -R * $pkgdir/
}
