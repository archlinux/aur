# $Id$
# Contributor: filip <fila pruda.com>

pkgname=esets
pkgver=4.5.5.0
pkgrel=1
pkgdesc="ESET Mail Security provides comercial Antivirus and Antispam"
arch=('i686' 'x86_64')
license=(ESET)
url="http://www.eset.com/"
[ "$CARCH" = "i686" ] && depends=()
[ "$CARCH" = "x86_64" ] && depends=('lib32-glibc')
backup=(etc/opt/eset/esets/esets.cfg)
install=$pkgname.install
options=()


[ "$CARCH" = "i686"   ] && _arch=i386
[ "$CARCH" = "x86_64" ] && _arch=amd64

#fill your username and password
_username=
_password=

source=("http://$_username:$_password@download.eset.com/download/unix/esets.$_arch.tgz.bin" "esets.service")

[ "$CARCH" = "i686"   ] && md5sums=('cb5502826a20ab9028b8ec0142c66d7b' '8140d3acd8021b81adc67acf8a34ddc2')
[ "$CARCH" = "x86_64" ] && md5sums=('7c83211cfacfe2c067964f82e9506bd9' '8140d3acd8021b81adc67acf8a34ddc2')



build() {

  tail -n +`awk '/^exit$/ { print NR + 1; exit }' "esets.$_arch.tgz.bin"` "esets.$_arch.tgz.bin" > "esets-$pkgver.$_arch.tgz"
  tar xfz "esets-$pkgver.$_arch.tgz"

}


package() {
    
  cd "$pkgdir"
  cpio -iumd --quiet < "$srcdir/epkg.cpio"
  
  rm -rf "etc/init.d"
  install -D -m644 "$srcdir/esets.service" "usr/lib/systemd/system/esets.service"

}
