# Maintainer: David Waldeck < mail at david-waldeck dot de
pkgname="brother-mfc-l2720dw"
pkgver="3.2.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-l2720DW"
url="http://solutions.brother.com/linux/en_us/"
arch=("i686" "x86_64")
license=('custom:brother commercial license')
depends=("cups")
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=(
	"http://download.brother.com/welcome/dlf101799/mfcl2720dwlpr-$pkgver-$pkgrel.i386.rpm"
	"http://download.brother.com/welcome/dlf101800/mfcl2720dwcupswrapper-$pkgver-$pkgrel.i386.rpm"
)
md5sums=(
	'02590f6087f26e2a831ea60da218e81d'
	'a215b945150a87583c4f832261811793'
)
prepare() {
  #  do not install in '/usr/local'
  if [ -d $srcdir/usr/local/Brother ]; then
    install -dm755 "$srcdir/usr/share"
    mv "$srcdir/usr/local/Brother/" "$srcdir/usr/share/brother"
    rm -rf "$srcdir/usr/local"
    sed -i 's|/usr/local/Brother|/usr/share/brother|g' `grep -lr '/usr/local/Brother' ./`
  fi
  
  # create cups-directories
  install -dm755 "$srcdir/usr/share/cups/model"
  install -dm755 "$srcdir/usr/lib/cups/filter"
  
  # copy ppd and filter file to their destination dirs
  cd `find . -type d -name 'cupswrapper'`
  cp *lpdwrapper* "$srcdir/usr/lib/cups/filter/"
  cp *.ppd "$srcdir/usr/share/cups/model/"

  # set the basedir to an absolute path in the perl-lpdwrapper-script
  # the relative path,generated on the basis of the caller, does not work in this case
  cd "$srcdir"
  # get absolute printer path
  _baseDir="\"/$(find opt -maxdepth 3 -depth -print -quit -type d)\""
  # replace the dynamic basedir var with the absolute path
  sed -i "s|\`readlink\ \$0\`|$_baseDir|" $srcdir/usr/lib/cups/filter/*lpdwrapper*

  # /etc/printcap is managed by cups
   rm "$(find $srcdir -type f -name 'setupPrintcap*')"
  }

  package() {
    cp -R "$srcdir/usr" "$pkgdir"
    cp -R "$srcdir/opt" "$pkgdir"
  }
