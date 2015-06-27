# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: foalsrock <foalsrock at gmail dot-com>
# Contributor: jebaum <jebaum at ucla dot edu>

pkgname=fzf
pkgver=0.10.0
pkgrel=1
pkgdesc="Command-line fuzzy finder"
arch=('i686' 'x86_64')
depends=('ncurses' 'tmux')
makedepends=('git' 'go' 'make')
optdepends=('fish: fish keybindings'
            'fzf-extras: fzf keybindings from junegunn wiki and dotfiles'
            'vim-fzf: vim plugin'
            'zsh: zsh keybindings')
url="https://github.com/junegunn/fzf"
license=('MIT')
source=($pkgname-$pkgver.tar.gz::https://codeload.github.com/junegunn/$pkgname/tar.gz/$pkgver
        key-bindings.bash.patch
        key-bindings.zsh.patch)
sha256sums=('7d0b3ced40c99934590e3b0a2302a79ca13f36b7558d1643a89b1800021252ee'
            '72d90ed4eff98e83786e713d69452c086194d901cc69422df1b4a276172e0825'
            '2d181a7964eb179edcddd5063223f8ad831620ade185f8673f6347f255972fc2')
install=fzf.install

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Fixing bash and zsh key bindings...'

  msg2 'Making fzf key-bindings.bash source bash completions...'
  patch -p1 < "$srcdir/key-bindings.bash.patch"

  msg2 'Making fzf key-bindings.zsh source zsh completions...'
  patch -p1 < "$srcdir/key-bindings.zsh.patch"

  msg2 'Removing instances of "source ~/.fzf.bash"...'
  sed -i 's@source ~/.fzf.bash;\s@@' shell/key-bindings.bash

  msg2 'Removing instances of "source ~/.fzf.zsh"...'
  sed -i 's@source ~/.fzf.zsh;\s@@' shell/key-bindings.zsh
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Building...'
  GOPATH="$srcdir" TMPDIR=/tmp go get -u github.com/junegunn/fzf/...
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 'Installing documentation...'
  for _doc in install uninstall README.md; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/fzf/$_doc"
  done

  msg2 'Installing manual...'
  install -Dm 644 "man/man1/fzf.1" "$pkgdir/usr/share/man/man1/fzf.1"

  msg2 'Installing executables...'
  install -Dm 755 "$srcdir/bin/fzf" "$pkgdir/usr/bin/fzf"
  install -Dm 755 "bin/fzf-tmux" "$pkgdir/usr/bin/fzf-tmux"

  msg2 'Installing bash completion and keybindings...'
  install -Dm 644 "shell/completion.bash" "$pkgdir/usr/share/bash-completion/completions/fzf"
  install -Dm 755 "shell/key-bindings.bash" "$pkgdir/etc/profile.d/fzf.bash"

  msg2 'Installing fish keybindings...'
  install -Dm 644 "shell/key-bindings.fish" "$pkgdir/usr/share/fish/functions/fzf.fish"

  msg2 'Installing zsh completion and keybindings...'
  install -Dm 644 "shell/completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_fzf"
  install -Dm 755 "shell/key-bindings.zsh" "$pkgdir/etc/profile.d/fzf.zsh"
}
