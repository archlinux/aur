# Maintainer: Buce <dmbuce@gmail.com>
pkgname=clicraft
pkgver=0.0.11
pkgrel=1
pkgdesc="A command-line wrapper for a minecraft or bukkit server."
arch=("any")
url="https://github.com/DMBuce/clicraft"
license=('BSD')
depends=("bash" "tmux" "curl" "java-runtime")
makedepends=("git" "asciidoc")
#checkdepends=()
optdepends=("c10t: for map.sh action script" "mcexplore: for explore.sh action script")
backup=("etc/clicraft/action.d/explore.sh"
        "etc/clicraft/action.d/map.sh"
        "etc/cron.d/clicraft"
        "etc/logrotate.d/clicraft")
install="$pkgname.install"
source=("$pkgname::git+https://github.com/DMBuce/$pkgname.git#tag=$pkgver"
        #"$pkgname::git://git@mantrid/~/$pkgname.git#tag=$pkgver"
        "$pkgname.install"
        "$pkgname.rc")
md5sums=('SKIP'
         '631669f302dffa059b4bdc915374d3d6'
         'dce883d9854859651b62b3477d0b5d4a')

build() {
  cd "$srcdir/$pkgname"

  autoconf
  ./configure --prefix=/usr \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --with-mcexplore \
              --with-c10t
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install

  install -Dm755 "$startdir/$pkgname.rc" "${pkgdir}/etc/rc.d/$pkgname"
  install -D -m 644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/clicraft/LICENSE"
}

# vim:set ts=2 sw=2 et:
