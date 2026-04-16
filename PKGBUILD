# Maintainer: Heine Otte <heinep@gmail.com>
_pkgname=velvet
pkgname=$_pkgname-git
pkgver=e899ceb
pkgrel=1
pkgdesc="Velvet is a fully scriptable terminal multiplexer which draws heavy inspiration from tmux and neovim"
arch=('x86_64')
url="https://github.com/Operdies/$_pkgname.git"
license=('GPL-3.0-only')
depends=('glibc')
makedepends=(git gcc make)
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/$_pkgname" || exit 1
  make release

  # Prepare directories
  mkdir -p "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/{man1,man3} "$pkgdir"/usr/share/velvet/{bin,lua}

  # Install binary
  install -m 755 release/vv "$pkgdir"/usr/share/velvet/bin/vv
  ln -sf /usr/share/velvet/bin/vv "$pkgdir"/usr/bin/vv

  # Install man pages
  install -m 644 doc/man1/velvet.1 "$pkgdir"/usr/share/man/man1/
  install -m 644 doc/man3/*.3 "$pkgdir"/usr/share/man/man3/

  # Install lua scripts
  cp -r lua/velvet "$pkgdir"/usr/share/velvet/lua/
}

