# Maintainer: Brenden Hoffman <hbrenden@fastmail.com>

pkgname=fzf-tab-bin-git
_pkgname=fzf-tab
pkgver=r199.220bee3
pkgrel=1
pkgdesc="Replace zsh's default completion selection menu with fzf (git version). This package also compiles the optional binary module."
url='https://github.com/Aloxaf/fzf-tab'
arch=('any')
license=('MIT')
depends=('zsh' 'fzf')
makedepends=('git')
conflicts=('fzf-tab-git')
source=("git+https://github.com/Aloxaf/fzf-tab.git")
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cd modules
  ./configure --disable-gdbm --without-tcsetpgrp
  make -j
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -dm755 "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
  cp -dr --no-preserve=ownership {fzf-tab.zsh,lib,modules,test} \
    "${pkgdir}/usr/share/zsh/plugins/${pkgname}"
  ln -s "fzf-tab.zsh" \
    "${pkgdir}/usr/share/zsh/plugins/${pkgname}/fzf-tab.plugin.zsh"
}
