# Maintainer:  Hyacinthe Cartiaux <hyacinthe.cartiaux@free.fr>
# Contributor: Mathias Anselmann <mathias.anselmann@posteo.de.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=lmod
pkgver=9.1.2
pkgrel=1
pkgdesc="Environment modules system based on Lua that handles MODULEPATH hierarchical problem. Supports also legacy TCL modules"
arch=('x86_64')
url="https://github.com/TACC/Lmod"
license=('custom')
depends=('bash' 'lua-filesystem' 'lua-posix' 'procps-ng' 'tcl' 'bc')
optdepends=('tcsh: supported shell'
            'zsh: supported shell')
conflicts=('lmod-git' 'env-modules')
provides=('env-modules')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TACC/Lmod/archive/$pkgver.tar.gz")
sha256sums=('b7277482677a22c3396b88a1290406ca20bb2564c59632403ca98373f132e65a')

build() {
  cd "$srcdir"/Lmod-$pkgver || exit 1

  ./configure \
    --prefix=/usr/share

  make
}

package() {
  install=lmod.install
  cd "$srcdir"/Lmod-$pkgver || exit 1

  make DESTDIR="$pkgdir" install

  install -Dm644 License "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 "$pkgdir"/usr/share/lmod/$pkgver/share/man/man1/module.1 "$pkgdir"/usr/share/man/man1/module.1
  rm -r "$pkgdir"/usr/share/lmod/$pkgver/share

  install -d "$pkgdir"/etc/profile.d
  cd "$pkgdir"/etc/profile.d || exit 1
  ln -sf /usr/share/lmod/lmod/init/profile modules.sh
  ln -sf /usr/share/lmod/lmod/init/cshrc   modules.csh
}
