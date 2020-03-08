# Maintainer: Eric Berquist <eric DOT berquist AT gmail DOT com>
# Contributor: Mathias Anselmann <mathias.anselmann@posteo.de.com>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>
# contributor: Fabian Köhler fkoehler1024@gmail.com

_pkgname=lmod
pkgname=$_pkgname-git
pkgver=8.3.5.r1.gc6822f74
pkgrel=1
pkgdesc="Environment modules system based on Lua that handles MODULEPATH hierarchical problem. Supports also legacy TCL modules"
arch=('x86_64')
url="https://github.com/TACC/Lmod"
license=('custom:lmod')
makedepends=('git')
depends=('bash' 'lua-filesystem' 'lua-posix' 'procps-ng' 'tcl')
optdepends=('tcsh: supported shell'
            'zsh: supported shell')
options=(!emptydirs)
provides=("$_pkgname" "env-modules-tcl")
conflicts=('env-modules-tcl')
source=("$_pkgname::git+https://github.com/TACC/Lmod.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  ./configure \
    --prefix=/usr/share

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

  # Need the main package version without git info.
  _pkgver=$(echo "${pkgver}" | cut -d "." -f 1-3 -)

  install -Dm644 License "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 "$pkgdir"/usr/share/lmod/$_pkgver/share/man/cat1/module.1 "$pkgdir"/usr/share/man/man1/module.1
  rm -r "$pkgdir"/usr/share/lmod/$_pkgver/share

  install -d "$pkgdir"/etc/profile.d
  cd "$pkgdir"/etc/profile.d || exit 1
  ln -sf /usr/share/lmod/lmod/init/profile modules.sh
  ln -sf /usr/share/lmod/lmod/init/cshrc modules.csh
}
