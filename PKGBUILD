# Maintainer: Taiki Sugawara <buzz.taiki@gmail.com>
pkgname=fzf-tab-completion-git
_pkgname=${pkgname%-git}
pkgver=r343.0874776
pkgrel=1
pkgdesc="Tab completion using fzf in zsh, bash, GNU readline apps (e.g. python, php -a etc.)"
arch=('i686' 'x86_64')
url="https://github.com/lincheney/fzf-tab-completion"
license=('GPL3')
depends=('fzf')
optdepends=('rl_custom_function: readline support')
makedepends=('rust' 'cargo')
provides=("$_pkgname")
install=$pkgname.install
source=("$_pkgname::git+https://github.com/lincheney/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  (cd readline && cargo build --release)
}

check() {
  cd "$srcdir/$_pkgname"
  (cd readline && cargo test --release)
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 readline/bin/rl_custom_complete $pkgdir/usr/bin/rl_custom_complete
  install -D -m755 readline/target/release/librl_custom_complete.so $pkgdir/usr/lib/librl_custom_complete.so

  install -D -m755 bash/fzf-bash-completion.sh $pkgdir/usr/share/$_pkgname/bash/fzf-bash-completion.sh
  install -D -m755 zsh/fzf-zsh-completion.sh $pkgdir/usr/share/$_pkgname/zsh/fzf-zsh-completion.sh
  install -D -m755 node/fzf-node-completion.js $pkgdir/usr/share/$_pkgname/node/fzf-node-completion.js

  install -D -m644 README.md $pkgdir/usr/share/doc/$_pkgname/README.md
}
