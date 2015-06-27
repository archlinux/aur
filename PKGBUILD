# Maintainer: spider-mario <spidermario@free.fr>
pkgname=openj-core-git
pkgver=701.62.g18fd23b
epoch=1
pkgrel=2
pkgdesc="Modern, high-level, general-purpose, high-performance programming language (core)"
arch=(i686 x86_64)
url="http://www.jsoftware.com/"
license=('GPL3')
depends=('readline')
makedepends=('git' 'cmake')
provides=('openj-core')
source=('j::git+https://github.com/openj/core.git'
        'j.vim::http://www.jsoftware.com/jwiki/Guides/Syntax%20Coloring?action=AttachFile&do=get&target=j.vim.txt'
        'j.xml::http://www.jsoftware.com/jwiki/Guides/Syntax%20Coloring?action=AttachFile&do=get&target=j.xml.txt')
sha512sums=('SKIP'
            'b6edc847a409a29807e1765a5f77d60b0ad57744e89959047123b3be234545318c4a7086524dad8390451766e7c4a90dd7abfeecafd7a7e0cec5cba89af08a53'
            '34c9daa59f540d769eeb3b27cc42daf8d87c9249fb19847f853ac78c3188a9512606ebc1944f666a685374f1f501b5778f24c0eab9e8ac42a32f157ee70c8dd9')

pkgver() {
  cd j
  git tag --message='701 archive' --force 701 b7c66ba3ac65151907973e86e270fa89786931cc
  git describe | tr - .
}

build() {
  mkdir j/build; cd j/build
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd j/build

  make DESTDIR="$pkgdir/" install

  install --directory "$pkgdir"/usr/share/vim/vimfiles/{ftdetect,syntax}
  echo 'au BufRead,BufNewFile *.ijs,*.ijt,*.ijp,*.ijx set filetype=j' > "$pkgdir"/usr/share/vim/vimfiles/ftdetect/j.vim
  cp -aL "$srcdir"/j.vim "$pkgdir"/usr/share/vim/vimfiles/syntax

  install --directory "$pkgdir"/usr/share/apps/katepart/syntax
  cp -aL "$srcdir"/j.xml "$pkgdir"/usr/share/apps/katepart/syntax

  # avoid an unfortunate conflict with OpenJDK
  mv "$pkgdir"/usr/bin/j{console,}

  # jpkg needs it…
  touch "$pkgdir"/usr/bin/installer.txt
}

# vim:set ts=2 sw=2 et:
