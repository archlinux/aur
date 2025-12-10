# Maintainer: AtticFinder65536 <atticfinder -AT- rocklabs -DOT- xyz>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Ray Kohler <ataraxia@gmail.com>
# Contributor: muflax <muflax@gmail.com>
# Contributor: coolkehon <coolkehon@gmail.com>

pkgname=task-git
pkgver=3.4.2.r13.gf551619
pkgrel=1
epoch=1
pkgdesc="A command-line todo list manager"
arch=('i686' 'x86_64')
url="https://taskwarrior.org/"
license=('MIT')
depends=('util-linux' 'gnutls')
makedepends=('cmake' 'git' 'cargo')
optdepends=('bash-completion: for bash completion'
            'python: for python export addon'
            'ruby: for ruby export addon'
            'perl: for perl export addon'
            'perl-json: for perl export addon')
source=("git+https://github.com/GothenburgBitFactory/taskwarrior.git#branch=develop"
        "git+https://github.com/GothenburgBitFactory/libshared.git"
        "git+https://github.com/Devolutions/CMakeRust.git")
b2sums=('SKIP'
        'SKIP'
        'SKIP')
provides=('task')
conflicts=('task')

prepare() {
  cd taskwarrior
  git submodule init
  git config submodule.src/libshared.url "$srcdir/libshared"
  git config submodule.cmake/CMakeRust.url "$srcdir/CMakeRust"
  git -c protocol.file.allow=always submodule update
}

pkgver() {
  cd taskwarrior
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd taskwarrior

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd taskwarrior
  make DESTDIR="$pkgdir" install

  # Note that we rename the bash completion script for bash-completion > 1.99, until upstream does so.
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/bash/task.sh" "$pkgdir/usr/share/bash-completion/completions/task"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/fish/task.fish" "$pkgdir/usr/share/fish/vendor_completions.d/task.fish"

  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/ftdetect/task.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/task.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskdata.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskdata.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskedit.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskedit.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskrc.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskrc.vim"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
