# Maintainer: Sebastian Korotkiewicz <skorotkiewicz@gmail.com>
pkgname=atto-netbsd-git
pkgver=20261109234841.gbfefb47c
pkgrel=1
pkgdesc='Small Emacs-like terminal editor from NetBSD'
arch=('x86_64' 'aarch64')
url='https://github.com/NetBSD/src/tree/trunk/usr.bin/atto'
license=('LicenseRef-Public-Domain' 'LicenseRef-NetBSD-menu')
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
  # glibc lacks the NetBSD compiler annotations and array/menu helpers.
  cc $CPPFLAGS $CFLAGS -D_DEFAULT_SOURCE \
    '-D__dead=__attribute__((__noreturn__))' \
    '-D__printflike(a,b)=__attribute__((__format__(__printf__,a,b)))' \
    '-D__arraycount(a)=(sizeof(a)/sizeof((a)[0]))' \
    '-D__UNCONST(a)=(a)' \
    -o atto *.c $LDFLAGS -lmenuw -lncursesw
}

package() {
  cd "$srcdir/src/usr.bin/atto"
  install -Dm755 atto "$pkgdir/usr/bin/atto"
  install -Dm644 atto.1 "$pkgdir/usr/share/man/man1/atto.1"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 menu.c "$pkgdir/usr/share/licenses/$pkgname/menu.c"
}
