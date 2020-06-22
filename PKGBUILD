# Contributor: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: foalsrock <foalsrock at gmail dot-com>
# Contributor: jebaum <jebaum at ucla dot edu>
# Maitainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fzf-git
pkgver=0.21.1.r24.g4ec144c
pkgrel=1
epoch=1
pkgdesc="Command-line fuzzy finder"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
depends=('ncurses')
makedepends=('git' 'go' 'make')
optdepends=('fish: fish keybindings'
            'fzf-extras: fzf keybindings from junegunn wiki and dotfiles'
            'tmux: fzf-tmux script for launching fzf in a tmux pane'
            'zsh: zsh keybindings')
url="https://github.com/junegunn/fzf"
license=('MIT')
source=(git+https://github.com/junegunn/fzf
        git+https://github.com/junegunn/fzf.wiki)
sha256sums=('SKIP'
            'SKIP')
provides=('fzf')
conflicts=('fzf')
install=fzf.install

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed "s+-+.r+" | tr - .
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  go build -o fzf .
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing documentation...'
  for _doc in README.md install uninstall; do
    install -Dm 644 $_doc -t "$pkgdir"/usr/share/doc/fzf
  done

  msg2 'Installing wiki...'
  cp -dpr --no-preserve=ownership "$srcdir"/fzf.wiki \
    "$pkgdir"/usr/share/doc/fzf/wiki

  msg2 'Installing manual...'
  install -Dm 644 man/man1/fzf.1 -t "$pkgdir"/usr/share/man/man1
  install -Dm 644 man/man1/fzf-tmux.1 -t "$pkgdir"/usr/share/man/man1

  msg2 'Installing executables...'
  install -Dm 755 fzf -t "$pkgdir"/usr/bin
  install -Dm 755 bin/fzf-tmux -t "$pkgdir"/usr/bin

  msg2 'Installing bash completion and keybindings...'
  install -Dm 644 shell/completion.bash \
    "$pkgdir"/usr/share/bash-completion/completions/fzf
  install -Dm 755 shell/key-bindings.bash "$pkgdir"/etc/profile.d/fzf.bash

  msg2 'Installing fish keybindings...'
  install -Dm 644 shell/key-bindings.fish \
    "$pkgdir"/usr/share/fish/functions/fzf.fish

  msg2 'Installing vimfiles...'
  install -Dm 644 plugin/fzf.vim \
    "$pkgdir"/usr/share/vim/vimfiles/plugin/fzf.vim

  msg2 'Installing zsh completion and keybindings...'
  install -Dm 644 shell/completion.zsh \
    "$pkgdir"/usr/share/zsh/site-functions/_fzf
  install -Dm 755 shell/key-bindings.zsh "$pkgdir"/etc/profile.d/fzf.zsh

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
