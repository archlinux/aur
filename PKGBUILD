# $Id$
# Contributor: filip <fila pruda.com>

pkgname=esets
pkgver=4.5.11.0
pkgrel=2
pkgdesc="ESET Mail Security provides comercial Antivirus and Antispam"
arch=('x86_64')
license=('ESET')
url="http://www.eset.com/"
depends=('lib32-glibc')
backup=(etc/opt/eset/esets/esets.cfg)
install=esets.install
options=()

#fill your username and password
_username=
_password=

source=("http://$_username:$_password@download.eset.com/download/unix/esets.amd64.tgz.bin" "esets.sysusers")

md5sums=('dd13190fadb01e4637777afe7a3b3153' 'e68ea38f9bcaf5c3394051d04a6f4e65')



build() {

  tail -n +`awk '/^exit$/ { print NR + 1; exit }' "esets.amd64.tgz.bin"` "esets.amd64.tgz.bin" > "esets-$pkgver.amd64.tgz"
  tar xfz "esets-$pkgver.amd64.tgz"
  
  mkdir -p "esets-src"
  (cd "esets-src" && cpio -iumd --quiet < "$srcdir/epkg.cpio")

}


package() {
  
  cp -a "$srcdir/esets-src/"* "$pkgdir"
  
  install -D -m644 "$srcdir/esets.sysusers" "$pkgdir/usr/lib/sysusers.d/esets.conf"
  install -D -m644 "$srcdir/esets-src/opt/eset/esets/etc/systemd/esets.service" "$pkgdir/usr/lib/systemd/system/esets.service"

}
