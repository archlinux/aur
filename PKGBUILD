# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=atto-netbsd-git
pkgver=20261030065351.gbf6cefce
pkgrel=2
pkgdesc='Small Emacs-like terminal editor from NetBSD'
arch=('x86_64' 'aarch64')
url='https://github.com/NetBSD/src/tree/trunk/usr.bin/atto'
license=('LicenseRef-Public-Domain')
depends=('glibc>=2.38' 'ncurses')
makedepends=('git')
# The unrelated AUR Nano wallet also installs /usr/bin/atto.
conflicts=('atto')
options=(!debug)
source=('LICENSE')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/src"
  # Use a timestamp because depth-one history cannot provide a commit count.
  git log -1 --format='%cd.g%h' --date=format:%Y%m%d%H%M%S
}

prepare() {
  cd "$srcdir"
  # shortcut: custom sparse fetching bypasses helper devel tracking; use native sources when makepkg supports sparse Git clones.
  if [[ -d src/.git ]]; then
    git -C src fetch --depth 1 origin trunk
    git -C src checkout --detach FETCH_HEAD
  else
    git clone --filter=blob:none --no-checkout --depth 1 https://github.com/NetBSD/src.git
    cd src
    git sparse-checkout set usr.bin/atto
    git checkout trunk
  fi
}

build() {
  cd "$srcdir/src/usr.bin/atto"
  cc $CPPFLAGS $CFLAGS -D_DEFAULT_SOURCE -o atto *.c $LDFLAGS -lncursesw
}

package() {
  cd "$srcdir/src/usr.bin/atto"
  install -Dm755 atto "$pkgdir/usr/bin/atto"
  install -Dm644 atto.1 "$pkgdir/usr/share/man/man1/atto.1"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
