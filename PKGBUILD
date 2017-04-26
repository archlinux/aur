model=l5750dw
pkgname=brother-mfc-${model}
pkgver=3.2.0
pkgrel=1
pkgdesc="Brother cups and lpd driver for L5750DW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/index.html"
license=('unknown')
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')

source=("http://download.brother.com/welcome/dlf102613/mfc${model}lpr-$pkgver-$pkgrel.i386.deb"
        "http://download.brother.com/welcome/dlf102614/mfc${model}cupswrapper-$pkgver-$pkgrel.i386.deb")

sha256sums=('7349a26fdb94c4a91d236bc437c338072f9fdd255105d818d392241b1a0c7775'
            '0987ba201ef76e8d9d7f08c6b11c5e66aa44d719c735b789fbebd8f606d99e07')

package() {
  deb2targz *.deb >/dev/null || return 1
  rm -f *.deb || return 1
  cd $srcdir || return 1
  [ -d "mfc${model}" ] || (mkdir mfc${model} || return 1)
  for i in *.tar.gz;do tar xfz $i -C mfc${model};done || return 1
  cd mfc${model} || return 1
  cd opt/brother/Printers/MFC${model^^} || return 1
  perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/brother_lpdwrapper_MFC${model^^} || return 1
  perl -i -pe 's#printcap\.local#printcap#g' $srcdir/mfc${model}/opt/brother/Printers/MFC${model^^}/inf/setupPrintcap || return 1
  cp -rf $srcdir/mfc${model}/usr/ $pkgdir/ || return 1
  cp -rf $srcdir/mfc${model}/opt/ $pkgdir/ || return 1

  mkdir -p ${pkgdir}/usr/share/cups/model
  mkdir -p ${pkgdir}/usr/lib/cups/filter

  ln -sv /opt/brother/Printers/MFC${model^^}/cupswrapper/brother-MFC${model^^}-cups-en.ppd ${pkgdir}/usr/share/cups/model
  ln -sv /opt/brother/Printers/MFC${model^^}/cupswrapper/brother_lpdwrapper_MFC${model^^} ${pkgdir}/usr/lib/cups/filter
}

