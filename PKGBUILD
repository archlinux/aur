# Maintainer: Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Anton Shestakov <engored@ya.ru>

pkgname=supermodel-svn
pkgver=20200703.807
pkgrel=1
pkgdesc='A Sega Model 3 Arcade Emulator'
arch=('i686' 'x86_64')
url='http://www.supermodel3.com/'
license=('GPL3')
depends=('mesa' 'sdl' 'zlib' 'glu' 'sdl2_net')
makedepends=('svn')
install=supermodel.install
source=('supermodel.sh'
        'multiuser.patch'
        'R3DScrollFog.patch'
        "${pkgname}::svn+https://svn.code.sf.net/p/model3emu/code/trunk")

md5sums=('ea8274c2a37acddd026fce9c831530cc'
         '2169d888da85c9baf9f55fc18c738ef8'
         '5577ca768ef106f0ff69ca875a36a62f'
         'SKIP')

MAKEFLAGS="-j1"

pkgver() {
	cd "${srcdir}/${pkgname}"
	svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

build() {
  cd "${srcdir}/supermodel-svn/"
  sed -e "s/-Wall -O3/$CFLAGS/" -i 'Makefiles/Makefile.UNIX'
  # patch -p1 < ../multiuser.patch
  # patch -p1 < ../R3DScrollFog.patch
  make -f 'Makefiles/Makefile.UNIX'
}

package() {
  cd "${srcdir}/supermodel-svn/"

  install -Dm755 "$srcdir/supermodel.sh" "$pkgdir/usr/bin/supermodel"

  install -Dm755 "bin/supermodel" "$pkgdir/usr/share/supermodel/Supermodel"

  install -Dm644 "Docs/LICENSE.txt" "$pkgdir/usr/share/licenses/supermodel/LICENSE"
  install -Dm644 "Docs/README.txt" "$pkgdir/usr/share/doc/supermodel/README"

  install -d "$pkgdir/usr/share/supermodel/Config"
  install -m644 Config/* "$pkgdir/usr/share/supermodel/Config/"
}
