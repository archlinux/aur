# Maintainer: Caleb Maclennan <caleb@alerque.com>
#
# Contributor: Eric Belanger <belanger@astro.umontreal.ca>
# Contributor: Nathan Owe <ndowens04+AUR @ gmail.com>
#
# Any suggestions welcome; please submit paches via Github:
# https://github.com/alerque/aur/tree/master/imgv

pkgname=imgv
pkgver=3.1.6
pkgrel=0
pkgdesc="a feature rich image viewer including a GUI"
url="http://imgv.sourceforge.net/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('python2-pygame' 'python2-pillow')
makedepends=('dos2unix')
source=(http://downloads.sourceforge.net/imgv/$pkgname-$pkgver-src.tar.gz imgv.profile imgv.sh)
md5sums=('48e19d90000b5d17bb609c93dd74d5b8'
         'bd0daba52c3165b38ba5a7b61ec0a94d'
         '60a287e055f6b17ba864c207cb78d9b2')

post_install() {
    echo "==> To configure imgv:
==> copy /usr/share/imgv/data/imgv.conf to ~/.imgv.conf
==> and edit ~/.imgv.conf"
}

post_upgrade() {
  post_install $1
}

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  dos2unix *.py data/{imgv.conf,playlists}
  sed -i 's/#\s*$//g' *.py
  sed -i 's|COLOR|#COLOR|g' "data/imgv.conf"
  sed -i 's|CACHE_DIRS|#CACHE_DIRS|g' "gl.py"
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  install -d "$pkgdir/usr/share/imgv"
  cp -r * "$pkgdir/usr/share/imgv/"
  install -Dm755 "$srcdir/imgv.profile" "$pkgdir/etc/profile.d/imgv.sh"
  install -Dm755 "$srcdir/imgv.sh" "$pkgdir/usr/bin/imgv"
}
