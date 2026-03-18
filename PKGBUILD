# Maintainer: Noel Tlatempa G <ntlatempag@gmail.com>

_pkgname=cboard-chess
pkgname=cboard-chess-git
pkgver=0.8.6.r3.g2256376
pkgrel=1
#pkgdesc="Interfaz de ajedrez cboard (Versión Portátil Auto-detectable)"
pkgdesc="Interfaz TUI de ajedrez (Fork Avanzado): Plugins en C, Multimotor, Análisis Multivariación y Motor vs Motor. (Ruta a v1.0)"
arch=('x86_64')
url="https://gitlab.com/ntlatempa/cboard-chess"
license=('GPL-2.0-or-later')
depends=('ncurses' 'glibc' 'perl') 
makedepends=('autoconf' 'automake' 'libtool' 'pkgconf' 'autoconf-archive' 'git')
#source=("$_pkgname::git+https://gitlab.com") 
source=("git+$url.git")
sha256sums=('SKIP')
provides=('cboard-chess-tui')
conflicts=('cboard')

pkgver() {
  cd "$srcdir/$_pkgname"
  # Esto toma el último tag (v0.8.5), cuenta los commits desde ahí y añade el hash
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  # Debes entrar en la carpeta donde se descargó el git
  cd "$srcdir/$_pkgname"
  
  # Preparación de headers para ncursesw
  mkdir -p .local_include/ncursesw
  for h in panel.h menu.h form.h ncurses.h; do
    ln -sf "/usr/include/$h" ".local_include/ncursesw/$h"
    ln -sf "/usr/include/$h" ".local_include/$h" 
  done
  
  chmod +x autogen.sh
  ./autogen.sh
}

build() {
  cd "$srcdir/$_pkgname"
  
  # 1. Obtener la ruta de Perl (Variable local de Bash)
  local _perl_core=$(perl -MConfig -e 'print "$Config{archlib}/CORE"')

  # 2. Definir las banderas (Variables locales de Bash)
  local _cppflags="-I$(pwd)/.local_include -I/usr/include/ncursesw -I$_perl_core -D_GNU_SOURCE -DHAVE_OPENPTY -DHAVE_PTY_H -DUNIX98"
  local _ldflags="$LDFLAGS -L$_perl_core -lperl -Wl,-rpath,$_perl_core -lformw -lmenuw -lpanelw -lncursesw -lutil"
  local _cflags="$CFLAGS -Wno-error=incompatible-pointer-types"

  # 3. Inyectar variables directamente al configure
  # Esto garantiza que el soporte UTF-8 (ncursesw) no se rompa
  ./configure --prefix=/usr \
              CPPFLAGS="$_cppflags" \
              LDFLAGS="$_ldflags" \
              CFLAGS="$_cflags"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/usr/lib/cboard-chess/plugins"
  install -m 755 plugins_bin/*.so "$pkgdir/usr/lib/cboard-chess/plugins/"
}
