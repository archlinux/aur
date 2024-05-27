model=l5755dw
pkgname=brother-mfc-${model}
pkgver="3.5.1"
pkgrel=1
pkgdesc="Brother cups and lpd driver for L5755DW"
arch=('i686' 'x86_64')
url="http://solutions.brother.com/linux/en_us/index.html"
license=('unknown')
depends=('tcsh' 'deb2targz' 'perl' 'a2ps')

source=("https://download.brother.com/welcome/dlf102716/mfc${model}lpr-$pkgver-$pkgrel.i386.deb"
        "https://download.brother.com/welcome/dlf102717/mfc${model}cupswrapper-$pkgver-$pkgrel.i386.deb")

sha256sums=('42ef5ac00e12eb12fbb4f48e8bb936fb48d7ff8ec9883f7396847357ec061999'
            '80853e12ff00bbb3693e5037656ce20ce78291eb7dcfd20c52e231696233011d')

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
