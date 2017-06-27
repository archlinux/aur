# Maintainer: Wael Nasreddine <aur@kalbas.it>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Ray Kohler <ataraxia@gmail.com>
# Contributor: muflax <muflax@gmail.com>
# Contributor: coolkehon <coolkehon@gmail.com>

pkgname=task-context-env
_pkgname=task
pkgver=2.5.1
pkgrel=1
pkgdesc="A command-line todo list manager"
arch=('i686' 'x86_64')
url="http://taskwarrior.org/"
license=('MIT')
depends=('util-linux' 'gnutls')
makedepends=('cmake')
provides=('task')
conflicts=('task')
optdepends=('bash-completion: for bash completion' 'python: for python export addon' 'ruby: for ruby export addon' 'perl: for perl export addon' 'perl-json: for perl export addon')
source=("https://taskwarrior.org/download/$_pkgname-$pkgver.tar.gz" "env.patch")
sha256sums=('d87bcee58106eb8a79b850e9abc153d98b79e00d50eade0d63917154984f2a15'
            'c9d3dacb79a0cfcfc7101d98edc6239d8b1a8c912b79a1fcec5b39496bdb22cd')

prepare() {
  bsdtar -xf "$srcdir/$_pkgname-$pkgver.tar.gz"
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  patch -Np1 -i "$srcdir/env.patch"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  # Note that we rename the bash completion script for bash-completion > 1.99, until upstream does so.
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/bash/task.sh" "$pkgdir/usr/share/bash-completion/completions/task"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/fish/task.fish" "$pkgdir/usr/share/fish/completions/task.fish"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/zsh/_task" "$pkgdir/usr/share/zsh/site-functions/_task"

  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/ftdetect/task.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/task.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskdata.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskdata.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskedit.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskedit.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskrc.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskrc.vim"

  install -Dm644 "$srcdir/$_pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/task/LICENSE"
}
