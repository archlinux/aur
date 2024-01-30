# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Sergio Jovani Guzman <moret.sjg@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint
pkgver=0.9.32
pkgrel=1
pkgdesc='Drawing program designed for young children'
arch=('x86_64')
url='https://tuxpaint.org/'
license=('GPL-2.0-only')
backup=('etc/tuxpaint/tuxpaint.conf')
depends=('glibc' 'cairo' 'gdk-pixbuf2' 'zlib' 'fontconfig' 'libpng' 'pango'
         'glib2' 'freetype2' 'harfbuzz' 'fribidi' 'libpaper' 'librsvg' 'libimagequant'
         'sdl2' 'sdl2_image' 'sdl2_gfx' 'sdl2_mixer' 'sdl2_pango' 'sdl2_ttf')
makedepends=('gperf' 'setconf' 'imagemagick')
optdepends=('tuxpaint-stamps: more stamps'
            'tuxpaint-config: configuration manager'
            'python2: zh_tw font generator script'
            'bash: for tp-magic-config, zh_tw doc generstor, tuxpaint-import scripts')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('09cce22241481dc1360fc4bc5d4da1d31815d7a2563b9e9fa217a672ba974bf2')

prepare() {
  cd "$pkgname-$pkgver"

  # python2 fix
  for f in docs/outdated/zh_tw/mkTuxpaintIM.py fonts/locale/zh_tw_docs/maketuxfont.py; do
    sed -i '0,/python$/s//python2/' $f
  done

  # native fullscreen by default
  setconf -u src/tuxpaint.conf fullscreen=yes
  setconf -u src/tuxpaint.conf native=yes

  # location of bash completion files
  setconf Makefile COMPLETIONDIR='$(DESTDIR)/usr/share/bash-completion/completions'

  # no KDE4-related requirements at installation-time
  setconf Makefile ARCH_INSTALL='install-man install-importscript install-bash-completion'
}

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr clean translations all -j1
}

package() {
  make -C "$pkgname-$pkgver" \
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
  install -Dm644 "$pkgname-$pkgver/src/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# getver: tuxpaint.org/download/source
# vim: ts=2 sw=2 et:
