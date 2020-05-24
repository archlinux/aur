# Maintainer: Roman Perepelitsa <roman.perepelitsa@gmail.com>

pkgname=zsh-theme-powerlevel10k-bin
pkgver=1.10.1
pkgrel=1
pkgdesc="Powerlevel10k is a theme for Zsh. It emphasizes speed, flexibility and out-of-the-box experience."
arch=('any')
url='https://github.com/romkatv/powerlevel10k'
license=('MIT')
depends=('zsh')
optdepends=(
  'ttf-meslo-nerd-font-powerlevel10k: terminal font recommended by powerlevel10k'
  'powerline-fonts: patched fonts for powerline'
  'awesome-terminal-fonts: icon package')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/romkatv/powerlevel10k/archive/v${pkgver}.tar.gz")
sha512sums=('4004d86ad00cec9c23f7f1af1a82708cd17fa7e5aa2eddd5300c7a900aeee8e22e50c687bb45169979c713325ed1b684110de473ff58c4edb3f284133e927cb1')
makedepends=('zsh')
provides=('zsh-theme-powerlevel10k')
conflicts=('zsh-theme-powerlevel10k')

build() {
  cd "$srcdir/powerlevel10k-${pkgver}"
  zsh -fc '
    emulate zsh -o no_aliases
    unset -m "GITSTATUS_*"
    GITSTATUS_CACHE_DIR="$PWD"/gitstatus/usrbin ./gitstatus/install -f'
  for file in *.zsh-theme internal/*.zsh gitstatus/*.zsh gitstatus/install; do
    zsh -fc "emulate zsh -o no_aliases && zcompile -R -- $file.zwc $file"
  done
}

package() {
  cd "$srcdir/powerlevel10k-${pkgver}"
  find . -type f -exec install -D '{}' "$pkgdir/usr/share/zsh-theme-powerlevel10k/{}" ';'
}
