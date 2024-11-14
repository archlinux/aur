# Contributor: royrocks <royrocks13@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=tuxpaint-git
_pkgname=tuxpaint
pkgver=0.9.34.r0.g5de3c87
pkgrel=1
arch=(i686 x86_64 aarch64)
pkgdesc="A free drawing program designed for young children. Checkout from git"
url='https://tuxpaint.org/'
license=(GPL-2.0-only)
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
provides=('tuxpaint')
conflicts=('tuxpaint')
source=("git+https://git.code.sf.net/p/tuxpaint/tuxpaint")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long --abbrev=7 | cut -f2,6,7 -d- | sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

prepare() {
  cd "${_pkgname}"

  # python2 fix
  for f in docs/outdated/zh_tw/mkTuxpaintIM.py fonts/locale/zh_tw_docs/maketuxfont.py; do
    sed -i '0,/python$/s//python2/' $f
  done
}

build() {
  make -C "${_pkgname}" PREFIX=/usr \
    LDFLAGS="$LDFLAGS" \
    OPTFLAGS="$CFLAGS -ffast-math" FASTMATH="$CFLAGS -ffast-math" \
    all
}

package() {
  make -C "${_pkgname}" \
    PREFIX=/usr \
    GNOME_PREFIX=/usr \
    X11_ICON_PREFIX="$pkgdir/usr/share/pixmaps" \
    DOC_PREFIX="$pkgdir/usr/share/doc/tuxpaint" \
    COMPLETIONDIR="$pkgdir/usr/share/bash-completion/completions" \
    DESTDIR="$pkgdir" \
    PACKAGE_ONLY=yes \
    install

  # bash completions
  mv "$pkgdir/usr/share/bash-completion/completions/010_tuxpaint-completion.bash" \
    "$pkgdir/usr/share/bash-completion/completions/tuxpaint"
}
