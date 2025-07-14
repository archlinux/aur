# Maintainer: Max Rossmannek <max@rossmannek.de>

# The following PKGBUILD was copied from the official task package in order to
# provide a 2.X version of Taskwarrior in the AUR. The exact source from which
# it was taken is the following:
# https://gitlab.archlinux.org/archlinux/packaging/packages/task/-/tree/2.6.2-2
#
# Below are the original maintainers and contributors:
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Orhun Parmaksız <orhun@archlinux.org>
# Contributor: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Ray Kohler <ataraxia@gmail.com>
# Contributor: muflax <muflax@gmail.com>
# Contributor: coolkehon <coolkehon@gmail.com>

_pkgname='task'
pkgname='task2'
pkgver=2.6.2
pkgrel=3
pkgdesc="Taskwarrior 2.X, a command-line todo list manager (prior to its breaking-change rewrite of version 3.0)"
arch=('x86_64')
url="https://taskwarrior.org/"
license=('MIT')
depends=('util-linux' 'gnutls')
makedepends=('cmake')
optdepends=('bash-completion: for bash completion' 'python: for python export addon' 'ruby: for ruby export addon' 'perl: for perl export addon' 'perl-json: for perl export addon')
source=("https://taskwarrior.org/download/${_pkgname}-$pkgver.tar.gz")
sha256sums=('b1d3a7f000cd0fd60640670064e0e001613c9e1cb2242b9b3a9066c78862cfec')
provides=('task')
conflicts=('task')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install

  # Note that we rename the bash completion script for bash-completion > 1.99, until upstream does so.
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/bash/task.sh" "$pkgdir/usr/share/bash-completion/completions/task"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/fish/task.fish" "$pkgdir/usr/share/fish/vendor_completions.d/task.fish"

  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/ftdetect/task.vim" "$pkgdir/usr/share/vim/vimfiles/ftdetect/task.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskdata.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskdata.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskedit.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskedit.vim"
  install -Dm644 "$pkgdir/usr/share/doc/task/scripts/vim/syntax/taskrc.vim" "$pkgdir/usr/share/vim/vimfiles/syntax/taskrc.vim"

  install -Dm644 "$srcdir/${_pkgname}-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/task/LICENSE"
}

