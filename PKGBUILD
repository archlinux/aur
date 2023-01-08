# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Sergio Jovani Guzman <moret.sjg@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

_pkgtype=sdl2
pkgname=tuxpaint
pkgver=0.9.28
pkgrel=2
pkgdesc='Drawing program designed for young children'
arch=('x86_64')
url='https://tuxpaint.org/'
license=('GPL')
backup=('etc/tuxpaint/tuxpaint.conf')
depends=('fribidi' 'libpaper' 'librsvg' 'libimagequant' 'sdl2_image'
         'sdl2_gfx' 'sdl2_mixer' 'sdl2_pango' 'sdl2_ttf')
makedepends=('gperf' 'setconf' 'imagemagick')
optdepends=('tuxpaint-stamps: more stamps'
            'tuxpaint-config: configuration manager'
            'python2: zh_tw font generator script')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver-$_pkgtype.tar.gz" "freetype2.patch")
sha256sums=('4f1ed9330feab324070b93630d79ced50ccc4816ab76750119f012b5d904709d' SKIP)

prepare() {
  cd "$pkgname-$pkgver-$_pkgtype"

  # python2 fix
  for f in docs/outdated/zh_tw/mkTuxpaintIM.py fonts/locale/zh_tw_docs/maketuxfont.py; do
    sed -i '0,/on/s//on2/' $f
  done

  # desktop shortcut categories
  setconf src/tuxpaint.desktop Categories='Game;KidsGame;Graphics;RasterGraphics;'

  # fullscreen by default
  setconf -u src/tuxpaint.conf fullscreen=true

  # location of bash completion files
  setconf Makefile COMPLETIONDIR='$(DESTDIR)/usr/share/bash-completion/completions'

  # no KDE4-related requirements at installation-time
  setconf Makefile ARCH_INSTALL='install-man install-importscript install-bash-completion'

  patch -Np1 < "../freetype2.patch"
}

build() {
  make -C "$pkgname-$pkgver-$_pkgtype" PREFIX=/usr clean translations all -j1
}

package() {
  make -C "$pkgname-$pkgver-$_pkgtype" \
    PREFIX=/usr \
    GNOME_PREFIX=/usr \
    X11_ICON_PREFIX="$pkgdir/usr/share/pixmaps" \
    DESTDIR="$pkgdir" \
    install -j1

  # bash completions
  mv "$pkgdir/usr/share/bash-completion/completions/tuxpaint-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/tuxpaint"

  # docs
  mv "$pkgdir/usr/share/doc/$pkgname-$pkgver" \
    "$pkgdir/usr/share/doc/$pkgname"

  # desktop shortcut
  install -Dm644 "$pkgname-$pkgver-$_pkgtype/src/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# getver: tuxpaint.org/download/source
# vim: ts=2 sw=2 et:
