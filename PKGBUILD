# Maintainer: David Gale <top.map4657@mailforce.link>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: juergen <juergen@archlinux.org>
# Contributor: John Proctor <jproctor@prium.net>

pkgname=ratpoison
pkgver=1.4.9
pkgrel=5
pkgdesc="A simple keystroke-driven window manager"
arch=('x86_64')
license=('GPL')
depends=('libxinerama' 'readline' 'bash' 'perl' 'libxtst' 'libxft' 'texinfo' 'libxrandr' 'ttf-font')
url="https://www.nongnu.org/ratpoison/"
source=("https://savannah.nongnu.org/download/${pkgname}/${pkgname}-${pkgver}.tar.xz"{,.sig}
        "${pkgname}.desktop")
md5sums=('912b01564d24734e1a68d36e2d85faa4'
         'SKIP'
         '29c3cb9be59758e39d8471391231a74a')
sha256sums=('d98fa4be025ecca453c407ff311ab3949f29f20d6d8abedf8f0716b85fc8d1f1'
            'SKIP'
            '45e3f34bb6dca21dfddaeeb9413d5bdaa7b1f92f73e8c3b06dc4ddcc6dbf26fb')
validpgpkeys=('513592C1AD3652932BDFDDCC0DFA74AE1524E7EE') # Jérémie Courrèges-Anglas <jca@wxcvbn.org>

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # FS#38726, v1.4.6-2 
  sed -i 's|PRINT_ERROR (("XGetWMName|PRINT_DEBUG (("XGetWMName|' src/manage.c

  ./configure --prefix=/usr
  make CFLAGS="$CFLAGS -DHAVE_GETLINE"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  # fix permissions
  chmod a+x "${pkgdir}/usr/share/ratpoison/"{allwindows.sh,clickframe.pl,rpshowall.sh,rpws,split.sh}

  # Not useful outside the source tree.
  rm "${pkgdir}/usr/share/ratpoison/genrpbindings"

  cd contrib
  ./genrpbindings
  install -dm755 "${pkgdir}/usr/share/ratpoison/bindings"
  install -m644 {Ratpoison.pm,ratpoison-cmd.el,ratpoison.rb,ratpoison.lisp,ratpoison.py} \
    "${pkgdir}/usr/share/ratpoison/bindings/"

  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "${pkgdir}/etc/X11/sessions/${pkgname}.desktop"
}
