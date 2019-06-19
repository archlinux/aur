# Maintainer: Mathias Anselmann <mathias.anselmann@posteo.de.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=lmod
pkgver=8.1.7
pkgrel=2
pkgdesc="Environment modules system based on Lua that handles MODULEPATH hierarchical problem. Supports also legacy TCL modules"
arch=('x86_64')
url="https://github.com/TACC/Lmod"
license=('custom')
depends=('bash' 'lua-filesystem' 'lua-posix' 'procps-ng' 'tcl')
optdepends=('tcsh: supported shell'
            'zsh: supported shell')
conflicts=('lmod-git' 'env-modules-tcl')
provides=('env-modules-tcl')
source=("$pkgname-$pkgver.tar.gz::https://github.com/TACC/Lmod/archive/$pkgver.tar.gz")
md5sums=('c46cbb09084944b00068eff3a03a786b')

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

  install -Dm644 "$pkgdir"/usr/share/lmod/$pkgver/share/man/cat1/module.1 "$pkgdir"/usr/share/man/man1/module.1
  rm -r "$pkgdir"/usr/share/lmod/$pkgver/share

  install -d "$pkgdir"/etc/profile.d
  cd "$pkgdir"/etc/profile.d || exit 1
  ln -sf /usr/share/lmod/lmod/init/profile modules.sh
  ln -sf /usr/share/lmod/lmod/init/cshrc   modules.csh
}
