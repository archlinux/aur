# Maintainer: Severin Glöckner <severin.gloeckner@stud.htwk-leipzig.de>

pkgname=freetennis
pkgver=0.4.8
pkgrel=2
pkgdesc="A tennis simulation game"
arch=('x86_64')
url="http://freetennis.sourceforge.net/"
license=('GPL')
depends=('sdl_gfx' 'sdl_image' 'sdl_mixer' 'sdl_ttf' 'gdk-pixbuf2')
makedepends=('ocaml-ocamlsdl' 'ocaml-graphics' 'lablgtk2' )
install=freetennis.install
source=("https://downloads.sourceforge.net/project/freetennis/freetennis/0.4.8/freetennis-0.4.8.tar.bz2" # source
        "http://deb.debian.org/debian/pool/main/f/freetennis/freetennis_0.4.8-10.debian.tar.xz"          # packaging files
        "freetennis.desktop")
sha256sums=('0d4663d1c9ce5bbef4d87a9d9f85a4570016a2945c41d1d293fb1357e426bebf'
            '961ea9902c39c2e2e75564be6c412462b9261d45b825d8b5f8b6dc7e217a2d4a'
            '1dcb1eb0d624b3df365e0bcb9c875217cef87fcef10b80698c04f168d0a75475')

prepare() {
  cd $pkgname-$pkgver

  rm freetennis freetennis.o freetennis.cmi freetennis.cmx
  
  sed -e '/where the wav files are located/ s/"sfx"/"\/usr\/share\/freetennis\/sfx"/' \
      -e '/where the pngs and subdirs are located/ s/"graphics"/"\/usr\/share\/freetennis\/graphics"/' \
      -i freetennis.ml

  cp "$srcdir"/debian/Makefile "$srcdir"/$pkgname-$pkgver/
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  install -Dm755 freetennis "$pkgdir"/usr/bin/freetennis

  mkdir -p "$pkgdir"/usr/share/freetennis/
  cp -a graphics "$pkgdir"/usr/share/freetennis/
  cp -a sfx "$pkgdir"/usr/share/freetennis/

  mkdir -p "$pkgdir"/usr/share/doc/freetennis/
  cp -a web-site "$pkgdir"/usr/share/doc/freetennis/
  cp -a TODO.txt "$pkgdir"/usr/share/doc/freetennis/

  # launcher
  install -Dm644 "$srcdir"/freetennis.desktop "$pkgdir"/usr/share/applications/freetennis.desktop

  # icon
  install -Dm644 "$srcdir"/debian/freetennis.xpm "$pkgdir"/usr/share/pixmaps/freetennis.xpm

  # manpage
  install -Dm644 "$srcdir"/debian/freetennis.6 "$pkgdir"/usr/share/man/man6/freetennis.6
  sed 'sX/usr/share/doc/freetennis-common/web-site/index.htmlX/usr/share/doc/freetennis/web-site/index.htmlX' \
    -i "$pkgdir"/usr/share/man/man6/freetennis.6
}
