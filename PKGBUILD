# Maintainer: Dariusz Dumas <dariusz@dareme.org>
pkgname=edo-sign
pkgver=1.9.106
pkgrel=1
pkgdesc="Helper tools for managing Polish electronic identity documents, enabling secure authentication and digital signing."
arch=('x86_64')
url="https://www.gov.pl/web/mswia/oprogramowanie-do-pobrania"
license=('custom')
depends=()
makedepends=('fakeroot')
source=("https://www.gov.pl/pliki/edowod/eDOSign-$pkgver.run")
md5sums=('77d145f04c18030211d6722171a610cc')
options=(!strip)

build() {
WORKDIR="$srcdir/chroot"
rm -rf $WORKDIR 
mkdir -p $WORKDIR
cd $WORKDIR
mkdir tmp bin
ln -sf /bin/chmod ./bin
ln -sf /bin/cp ./bin
ln -sf /bin/rm ./bin
ln -sf /bin/sh ./bin
cp $srcdir/eDOSign-$pkgver.run ./bin/$pkgname-$pkgver.run
chmod +x ./bin/$pkgname-$pkgver.run

mkdir -p ./usr/share/applications/

fakechroot fakeroot chroot . $pkgname-$pkgver.run  install --accept-licenses --confirm-command

# remove temporary files for fakechroot
rm -rf bin tmp

# move licenses to proper folder
mkdir -p usr/share/
mv opt/edo-sign/Licenses usr/share/licenses

# remove installer files
cd opt/edo-sign && rm -rf uninstall* installerResources installer.dat components.xml InstallationLog.txt
}

package() {
cp -R $srcdir/chroot/* $pkgdir/
}
