# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# shellcheck disable=2034
# shellcheck disable=2148

pkgname=lmod
pkgver=7.7.29
pkgrel=1
pkgdesc="environment modules system based on Lua, supports legacy TCL modules"
arch=('i686' 'x86_64')
url="http://lmod.readthedocs.org"
license=('custom')
depends=('bash' 'lua-filesystem' 'lua-posix' 'tcl')
optdepends=('tcsh: supported shell'
            'zsh: supported shell')
conflicts=('lmod-git' 'env-modules-tcl')
provides=('env-modules-tcl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TACC/Lmod/archive/$pkgver.tar.gz")
md5sums=('bd3f171995e6863505e8a958d158ced1')

build() {
  # shellcheck disable=2154
  cd "$srcdir"/Lmod-$pkgver || exit 1

  ./configure \
    --prefix=/usr/share

  make
}

package() {
  cd "$srcdir"/Lmod-$pkgver || exit 1

  # shellcheck disable=2154
  make DESTDIR="$pkgdir" install

  install -Dm644 License "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 "$pkgdir"/usr/share/lmod/$pkgver/share/man/cat1/module.1 "$pkgdir"/usr/share/man/man1/module.1
  rm -r "$pkgdir"/usr/share/lmod/$pkgver/share

  install -d "$pkgdir"/etc/profile.d
  cd "$pkgdir"/etc/profile.d || exit 1
  ln -sf /usr/share/lmod/lmod/init/profile modules.sh
  ln -sf /usr/share/lmod/lmod/init/cshrc   modules.csh
  ln -sf /usr/share/lmod/lmod/init/zsh     modules.zsh
}
