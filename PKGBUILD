# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=lmod
pkgver=7.3.18
pkgrel=1
pkgdesc="environment modules system based on Lua, supports legacy TCL modules"
arch=('i686' 'x86_64')
url="http://lmod.readthedocs.org"
license=('custom')
depends=('bash' 'lua-filesystem' 'lua-posix' 'tcl')
optdepends=('tcsh: supported shell'
            'zsh: supported shell')
provides=('modules')
conflicts=('lmod-git' 'modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TACC/Lmod/archive/$pkgver.tar.gz")

build() {
  cd $srcdir/Lmod-$pkgver

  ./configure \
    --prefix=/usr/share

  make
}

package() {
  cd $srcdir/Lmod-$pkgver

  make DESTDIR=$pkgdir install

  install -Dm644 License $pkgdir/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 $pkgdir/usr/share/lmod/$pkgver/share/man/cat1/module.1 $pkgdir/usr/share/man/man1/module.1
  rm -r $pkgdir/usr/share/lmod/$pkgver/share

  install -d $pkgdir/etc/profile.d
  pushd $pkgdir/etc/profile.d
  ln -sf /usr/share/lmod/lmod/init/profile modules.sh
  ln -sf /usr/share/lmod/lmod/init/cshrc   modules.csh
  ln -sf /usr/share/lmod/lmod/init/zsh     modules.zsh
  popd
}

md5sums=('7009e48b5117bba9df92f7b4057457ba')
