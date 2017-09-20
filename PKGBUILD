model=l5902dw
pkgname=brother-mfc-${model}
pkgver=3.2.0
pkgrel=1
pkgdesc="Brother cups and lpd driver for L5902DW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/index.html"
license=('unknown')
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')

source=("http://download.brother.com/welcome/dlf102633/mfc${model}lpr-$pkgver-$pkgrel.i386.deb"
        "http://download.brother.com/welcome/dlf102634/mfc${model}cupswrapper-$pkgver-$pkgrel.i386.deb")

sha256sums=('82a370d3acd84daacb2ad583e703d3462d2fd1c7c788504a3236653367350ff2'
            '6583c276991bb5389c77f55b7cf95e89de4e6a7df450d3304a5c994fc232fac1')

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
