# Maintainer: Zhengyu Xu <xzy3186@gmail.com>

pkgname=insync
pkgver=1.2.11
pkgrel=1
pkgdesc="An unofficial Google Drive client that runs on Linux, with support for various desktops"
url="https://www.insynchq.com/downloads"
license=('custom:insync')
options=(!strip !upx)

depends=('xdg-utils' 'glibc' 'python2')
optdepends=('insync-nautilus: file-manager integration for nautilus'
'insync-nemo: file-manager integration for nemo'
'insync-dolphin: file-manager integration for dolphin'
'insync-thunar: file-manager integration for thunar'
'insync-caja: file-manager integration for caja'
'sni-qt: To show the icon in Plasma 5 tray'
)

arch=('i686' 'x86_64')
if [ "$CARCH" = 'i686' ]; then
   source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}.35149-trusty_i386.deb")
   sha256sums=('85f9899a5748a806ec6267ffa0f5003b600af873159308134ef4d48e7130f0a5')
elif [ "$CARCH" = "x86_64" ]; then
   source=("${pkgname}-${pkgver}.deb::http://s.insynchq.com/builds/${pkgname}_${pkgver}.35149-trusty_amd64.deb")
   sha256sums=('34244ac534ce0e508aa237ee2397b9617c6f80c3f4ac3bf68eaf452bfd58c8fe')
fi
noextract=("${pkgname}-${pkgver}.deb")

source=("${source[@]}"
        "insync.service")
sha256sums=("${sha256sums[@]}"
            "995d9131bd454015ff11414d002b8927b7397835969e27061008264c0c5f225d")

package() {
   cd $srcdir
   ar x ${pkgname}-${pkgver}.deb
   tar xvf data.tar.gz
   cp -rp usr $pkgdir

   cd $pkgdir
   for file in $(grep -R "/usr/bin/python" . | cut -f1 -d :)
   do
      sed -i "s|usr/bin/python$|usr/bin/python2|g" $file
   done
   mkdir -p ${pkgdir}/usr/lib/systemd/system
   sed "s/_OPTION/ start/g" ${srcdir}/insync.service >${pkgdir}/usr/lib/systemd/system/insync@.service
}
