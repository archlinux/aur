#Maintainer: Jay Ta'ala <jay@jaytaala.com>
#Contributor: Amos Onn <amosonn@gmail.com>
#Contributor: Ekin Dursun <ekindursun@gmail.com>
#Contributor: danyf90 <daniele.formichelli@gmail.com>
#Contributor: syncrtl64 <syncrtl64@gmail.com>
#Contributor: Andrea Cattaneo <andrea.cattaneo.dev@gmail.com>

pkgname=genymotion
pkgver=3.5.1
pkgrel=1
pkgdesc="Complete set of tools that provides a virtual environment for Android."
arch=('x86_64')
url="http://www.genymotion.com/"
optdepends=(virtualbox)
makedepends=(wget)
install=$pkgname.install
license=('custom')
_ARCH="x64"
DLAGENTS=("https::/usr/bin/wget -U "Mozilla" %u")
source=("genymotion.desktop"
        "https://dl.genymotion.com/releases/genymotion-$pkgver/$pkgname-${pkgver}-linux_$_ARCH.bin")
sha512sums=('42f629d6413e4e481ef68d019ec3071515b45d01fdb004a545c8b977a9bf2439581ca8a67ad7dead9a12a0d24e8e46ba02c5dc47abd76597451b09847cf5d78b'
            'cd7b4965d32c61f20e0a00c5ce5238315eec020425f58db03c864ec8486db26a6c30003fd555c14c39e0759a01a2385c456d06af23aee2767a688d62aa041df7')

package(){
  cd $srcdir

  install -d $pkgdir/opt
  install -d $pkgdir/opt/$pkgname

  src="$pkgname-${pkgver}-linux_$_ARCH.bin"

  # Retrieve line number where tar.bzip2 binary begins
  skip=$(awk '/^__TARFILE_FOLLOWS__/ { print NR + 1; exit 0; }' "$src")
  [ $? -ne 0 ] && return 1

  # Untar following archive
  tail -n +$skip "$src" \
      | tar -xj --no-same-owner -C "$pkgdir/opt/$pkgname"
  [ ${PIPESTATUS[0]} -ne 0 -o ${PIPESTATUS[1]} -ne 0 ] && return 1

  install -d $pkgdir/usr/bin
  ln -s /opt/$pkgname/genymotion $pkgdir/usr/bin/genymotion
  ln -s /opt/$pkgname/genymotion-shell $pkgdir/usr/bin/genymotion-shell
  ln -s /opt/$pkgname/player $pkgdir/usr/bin/genymotion-player
  ln -s /opt/$pkgname/gmtool $pkgdir/usr/bin/gmtool
  install -Dm644 $srcdir/genymotion.desktop $pkgdir/usr/share/applications/genymotion.desktop
  chown -R root:root $pkgdir/opt/$pkgname
}
