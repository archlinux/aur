# Maintainer: Jonathan Tremesaygues <killruana@slaanesh.org>
pkgname=netgen-lvs-git
pkgver=1.5.r549.168e550
pkgrel=2
pkgdesc="A netlist comparison (LVS) and format manipulation"
url="http://opencircuitdesign.com/netgen/"
arch=('i686' 'x86_64')
license=('GPL')
provides=('netgen-lvs')
conflicts=('netgen-lvs')
depends=()
makedepends=('git')
optdepends=()
source=("git://opencircuitdesign.com/netgen#branch=netgen-1.5")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-lvs-git}"

  printf "1.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd "$srcdir/${pkgname%-lvs-git}"

   # 2021-08-21: /etc/makepkg.conf add the flag "-Werror=format-security" to
   # CFLAGS, which break the build because netgen do some dangerous things like
   # verilog.c:1360:29: error: format not a string literal and no format arguments [-Werror=format-security]                                     
   # 1360 |                             sprintf(nodename, lhs->name);
   #
   CFLAGS=$($CFLAGS | sed 's/-Werror=format-security//') ./configure --prefix=/usr
   make
}

package() {
   cd "$srcdir/${pkgname%-lvs-git}"
   make DESTDIR="$pkgdir" install
}

