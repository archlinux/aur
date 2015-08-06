# Maintainer: Somebody <somebody[at]foo[dot]tld>
pkgname=repetier-host
pkgver=1.0.6
pkgrel=3
pkgdesc="almost complete 3d-printing workflow"
url=('http://www.repetier.com/')
arch=('x86_64' 'i686')
license=('custom')
depends=('mono>=3.2.0')
optdepends=('slic3r' 'skeinforge')
source=("http://www.repetier.com/w/?wpdmdl=1785" "$pkgname.install")
PKGEXT=".pkg.tar"
install=$pkgname.install

build() {
cd ${srcdir}/RepetierHost/
DIR=/usr/share/repetierHost

OSBIT=`uname -m`
echo "System: ${OSBIT}"
if [ ${OSBIT} = "i686" ]; then
echo "Using 32 bit CuraEngine"
  cp plugins/CuraEngine/CuraEngine32 plugins/CuraEngine/CuraEngine
else
echo "Using 64 bit CuraEngine"
  cp plugins/CuraEngine/CuraEngine64 plugins/CuraEngine/CuraEngine
fi

echo "#!/bin/sh" > repetierHost
echo "cd ${DIR}" >> repetierHost
echo "mono RepetierHost.exe -home ${DIR}&" >> repetierHost
chmod 755 repetierHost
chmod a+rx ../RepetierHost
chmod -R a+r *
chmod -R a+x data
chmod a+x installDep*
rm configureFirst.sh
rm installDependenciesDebian
rm installDependenciesFedora
rm createDesktopIcon.sh
g++ SetBaudrate.cpp -o SetBaudrate

echo "[Desktop Entry]
Name=Repetier-Host
Exec=mono RepetierHost.exe -home $dir&
Type=Application
StartupNotify=true
Comment=Repetier-Host 3d printer host software
Path=$dir
Icon=$dir/repetier-logo.png
Comment[en_US.UTF-8]=Repetier Host
Name[en_US]=Repetier-Host
" >> ${srcdir}/Repetier-Host.desktop
chmod +x ${srcdir}/Repetier-Host.desktop

}

package() {
mkdir -p $pkgdir/usr/share/
mkdir -p $pkgdir/usr/bin
ln -s /usr/share/repetierHost/repetierHost $pkgdir/usr/bin/repetierHost

install -Dm644 ${srcdir}/RepetierHost/Repetier-Host-licence.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
rm ${srcdir}/RepetierHost/Repetier-Host-licence.txt
cp -a ${srcdir}/RepetierHost $pkgdir/usr/share/repetierHost
install -Dm755 ${srcdir}/Repetier-Host.desktop  $pkgdir/usr/share/applications/Repetier-Host.desktop
}

# vim:set ts=2 sw=2 et:
md5sums=('aa5898b3998896ac6bb39146ef54c5ea'
         '3bf735df87c6f3b9e807bbc82edd7a05')
