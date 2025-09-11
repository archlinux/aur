# Maintainer: Marco Russo <tray-kebab-uneven@duck.com>
pkgname=expert-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r786.e9d69dd3
pkgrel=1
pkgdesc="Official Elixir Language Server Protocol implementation"
arch=('x86_64')
url="https://expert-lsp.org/"
license=('Apache-2.0')
depends=('zig' 'just' 'erlang' 'elixir')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=()
options=()
install=
#source=('expert::git+https://github.com/elixir-lang/expert.git#commit=e9d69dd')
source=('expert::git+https://github.com/elixir-lang/expert.git')
noextract=()
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/expert"

  # The examples below are not absolute and need to be adapted to each repo. The
  # primary goal is to generate version numbers that will increase according to
  # pacman's version comparisons with later commits to the repo. The format
  # VERSION='VER_NUM.rREV_NUM.HASH', or a relevant subset in case VER_NUM or HASH
  # are not available, is recommended.

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/expert"
  just deps forge
  just deps engine
  just deps expert
}

build() {
  cd "$srcdir/expert"
  just release-local
}

package() {
  cd "$srcdir/expert"
  install -Dm755 ./apps/expert/burrito_out/expert_linux_amd64 "$pkgdir/usr/bin/expert"
}
