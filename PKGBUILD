# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: schuay <jakob.gruber@gmail.com>

pkgname=pcurses
pkgver=5
pkgrel=6
pkgdesc='A curses package management tool using libalpm'
arch=('x86_64')
url="https://github.com/schuay/$pkgname"
license=('GPL-3.0-or-later')
depends=('ncurses' 'pacman')
makedepends=('boost' 'cmake')
# Upstream's tag pcurses-5 tarball no longer builds against a modern toolchain
# (opaque ncurses WINDOW, libalpm typedef conflict, cmake_minimum_required <3.5).
# All of it is fixed on master, but upstream has not cut a new tag, so we pin the
# fixed commit. pkgver stays 5 (upstream's current version); bump _commit + pkgrel
# when newer fixes land before a real release.
_commit=67a6fc200c9cf37829a83ebac6048dd2ab5b1a11
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('ea98df4dd7f7613391bfc22ab88fcd8dbe526d0b9f8cd7c42f391aeccf040fea')

latestver() {
  gh api --paginate repos/schuay/pcurses/tags --jq '.[].name' |
      sed -nE 's/^pcurses-([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

prepare() {
  cd "$pkgname-$_commit"
  # Upstream passes std::string contents directly as the *printw format string,
  # which trips Arch's -Werror=format-security. Route them through a "%s" format.
  sed -i \
    -e 's/mvwprintw(w_border, 0, 1, header.c_str());/mvwprintw(w_border, 0, 1, "%s", header.c_str());/' \
    -e 's/mvwprintw(w_border, getmaxy(w_border) - 1, 1, footer.c_str());/mvwprintw(w_border, getmaxy(w_border) - 1, 1, "%s", footer.c_str());/' \
    -e 's/wprintw(w_main, fitstrtowin(str).c_str());/wprintw(w_main, "%s", fitstrtowin(str).c_str());/' \
    -e 's/mvwprintw(w_main, y, x, fitstrtowin(str, x).c_str());/mvwprintw(w_main, y, x, "%s", fitstrtowin(str, x).c_str());/' \
    src/cursesframe.cpp
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -W no-dev \
        -B build \
        -S "$pkgname-$_commit"
  make VERBOSE=1 -C build
}

package() {
  make DESTDIR="$pkgdir" install -C build
}

# vim:set ts=2 sw=2 et:
