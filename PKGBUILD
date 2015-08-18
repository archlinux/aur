# Maintainer: David Waldeck < mail at david-waldeck dot de
pkgname="brother-mfc-l2740dw"
pkgver="3.2.0"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother MFC-l2740DW"
url="http://solutions.brother.com/linux/en_us/"
arch=("i686" "x86_64")
license=('custom:brother commercial license')
depends=("cups")
depends_x86_64=('lib32-glibc')
install="$pkgname.install"
source=(
	"http://download.brother.com/welcome/dlf101729/mfcl2740dwlpr-$pkgver-$pkgrel.i386.rpm"
	"http://download.brother.com/welcome/dlf101728/mfcl2740dwcupswrapper-$pkgver-$pkgrel.i386.rpm"
)
md5sums=(
	'e4e27264d8255274c6ad8af1e65588b7'
	'399fde3fff6c41338b0fe84517f7148b'
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
