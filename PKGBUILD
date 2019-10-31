# Contributor: Joyfulgirl <joyfulgirl (at) archlinux.us> a.k.a. escondida
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=emms-git
epoch=1
pkgver=5.2.r9.rg2bad5e6
pkgrel=1
pkgdesc="Emacs MultiMedia System -- git version"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/emms/"
makedepends=('git' 'texinfo')
depends=('emacs' 'taglib')
optdepends=('vorbis-tools: ogg support' 
            'mpg123: mp3 support' 
            'mp3info: mp3 tag support'
            'mpd: mpd support'
            'mplayer: mplayer support'
            'xine: xine support')
license=('GPL')
conflicts=('emms')
provides=('emms')
source=('git://git.sv.gnu.org/emms.git')
md5sums=('SKIP')

pkgver() {
  cd emms
  git describe --long | sed 's+-+.r+g'
}

prepare() {
  cd emms/lisp
  sed -i '5s+$+ emms-setup.el+' Makefile
}
  
build() {
    cd emms
    PREFIX=/usr make
    PREFIX=/usr make emms-print-metadata 
}

package() {
  cd emms
  install -d "$pkgdir"/usr/share/{emacs/site-lisp/emms,man/man1,info}
  install -m 644 -t "$pkgdir"/usr/share/emacs/site-lisp/emms lisp/*.el
  install -m 644 -t "$pkgdir"/usr/share/emacs/site-lisp/emms lisp/*.elc
  install -m 644 -t "$pkgdir"/usr/share/info doc/emms.info 
  install -m 644 -t "$pkgdir"/usr/share/man/man1 emms-print-metadata.1 
  install -Dm755 src/emms-print-metadata "$pkgdir"/usr/bin/emms-print-metadata
}
