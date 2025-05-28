# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Mateusz Herych <heniekk@gmail.com>
# Contributor: Sergio Jovani Guzman <moret.sjg@gmail.com>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint
pkgver=0.9.35
pkgrel=1
pkgdesc='Drawing program designed for young children'
arch=('x86_64')
url='https://tuxpaint.org/'
license=('GPL-2.0-only')
backup=('etc/tuxpaint/tuxpaint.conf')
depends=('glibc' 'cairo' 'zlib' 'fontconfig' 'libpng' 'pango'
         'glib2' 'fribidi' 'libpaper' 'librsvg' 'libimagequant' 'hicolor-icon-theme'
         'sdl2' 'sdl2_image' 'sdl2_gfx' 'sdl2_mixer' 'sdl2_pango' 'sdl2_ttf')
makedepends=('gperf' 'imagemagick')
optdepends=('tuxpaint-stamps: more stamps'
            'tuxpaint-config: configuration manager'
            'python2: zh_tw font generator script'
            'fontforge: zh_tw doc generator script'
            'bash: for tp-magic-config, tuxpaint-import, zh_tw doc generator scripts')
source=("https://downloads.sourceforge.net/sourceforge/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('c1c18af91be77e94fdaab2c928204c4c39ba39ac5da2f441aaf2ecab6d8bd0ad')

prepare() {
  cd "$pkgname-$pkgver"

  # python2 fix
  for f in docs/outdated/zh_tw/mkTuxpaintIM.py fonts/locale/zh_tw_docs/maketuxfont.py; do
    sed -i '0,/python$/s//python2/' $f
  done
}

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr \
    LDFLAGS="$LDFLAGS" \
    OPTFLAGS="$CFLAGS -ffast-math" FASTMATH="$CFLAGS -ffast-math" \
    all
}

package() {
  make -C "$pkgname-$pkgver" \
    SHELL=/bin/bash \
    PREFIX=/usr \
    GNOME_PREFIX=/usr \
    X11_ICON_PREFIX="$pkgdir/usr/share/pixmaps" \
    COMPLETIONDIR="$pkgdir/usr/share/bash-completion/completions" \
    DESTDIR="$pkgdir" \
    PACKAGE_ONLY=yes \
    install

  # bash completions
  mv "$pkgdir/usr/share/bash-completion/completions/010_tuxpaint-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/tuxpaint"

  # docs
  mv "$pkgdir/usr/share/doc/$pkgname-$pkgver" \
    "$pkgdir/usr/share/doc/$pkgname"
}

# getver: tuxpaint.org/download/source
# vim: ts=2 sw=2 et:
