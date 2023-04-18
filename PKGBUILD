# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

# previous freetype2-ultimate5 maintainer
# Maintainer: Tomasz Gąsior <tomaszgasior.pl>

# This file is based on original PKGBUILD of FreeType package.
# https://github.com/archlinux/svntogit-packages/tree/packages/freetype2/trunk

# These links were helpful while creating this patch.
# * https://aur.archlinux.org/cgit/aur.git/tree/0007-cleartype.patch?h=freetype2-cleartype
# * https://wiki.archlinux.org/index.php/Font_configuration#Advanced_LCD_filter_specification
# * https://github.com/bohoomil/fontconfig-ultimate/blob/master/freetype/03-infinality-2.6.3-2016.04.16.patch#L2092
# * https://www.reddit.com/r/archlinux/comments/5qkvqb/best_way_to_approximate_infinalitys_ultimate5

__arch_pkg_commit="74eded8ecf7ea281ebb75573989dfc67261ee700"

pkgname=freetype2-ultimate5
pkgver=2.13.0
pkgrel=2
pkgdesc="FreeType patched for effect similar to Infinality's ultimate5 preset."
url="https://www.freetype.org/"
conflicts=(freetype2)
provides=(freetype2=$pkgver libfreetype.so)
install=freetype2-ultimate5.install
backup=(etc/profile.d/freetype2.sh)
arch=(x86_64)
license=(GPL)
# adding harfbuzz for improved OpenType features auto-hinting
# introduces a cycle dep to harfbuzz depending on freetype wanted by upstream
depends=(
  brotli
  bzip2
  harfbuzz
  libpng
  sh
  zlib
)
makedepends=(
  librsvg
  libx11
  meson
  qt5-base
)
source=(
  https://download-mirror.savannah.gnu.org/releases/freetype/freetype-$pkgver.tar.xz{,.sig}
  0001-Enable-table-validation-modules.patch
  0002-Enable-subpixel-rendering.patch
  0003-Enable-infinality-subpixel-hinting.patch
  0004-Enable-long-PCF-family-names.patch
  0005-builds-meson-parse_modules_cfg.py-Handle-gxvalid-and.patch
  freetype2.sh
	"like-ultimate5.patch"
)
sha256sums=('5ee23abd047636c24b2d43c6625dcafc66661d1aca64dec9e0d05df29592624c'
            'SKIP'
            'd279a9d4b2c146722dbc03f9a33009846efe8bbbe3ada52beb4a1aa4d4dfaa38'
            'f2e8a16126723458b413e58da267fb30332d0b42fef972f951e3e9fc081fa492'
            '8e61d12ebdbbcb764a38d4798ee728074bac0aa20978d538b6e7045a63949ab8'
            'cc364cc0ca21b8b30f29d90ab394d82f3303ca7d9813d866e6bf14f9bccd9564'
            '08cf087d7d612b4228e24d74df95cf1f397f7c41054c42837c63c1f33ffaee09'
            'f7f8e09c44f7552c883846e9a6a1efc50377c4932234e74adc4a8ff750606467'
            '9554d3a23619a46cf48e512e5b6336afd0802f42fdaf9b2e47ba0c718143f1dd')
validpgpkeys=(E30674707856409FF1948010BE6C3AAC63AD8E3F) # Werner Lemberg <wl@gnu.org>

prepare() {
  cd freetype-$pkgver
  patch -Np1 -i ../0001-Enable-table-validation-modules.patch
  patch -Np1 -i ../0002-Enable-subpixel-rendering.patch
  patch -Np1 -i ../0003-Enable-infinality-subpixel-hinting.patch
  patch -Np1 -i ../0004-Enable-long-PCF-family-names.patch
  patch -Np1 -i ../0005-builds-meson-parse_modules_cfg.py-Handle-gxvalid-and.patch
	# apply ultimate5 patch
	patch -Np1 -i ../like-ultimate5.patch
}

build() {
  local meson_options=(
    -D default_library=both
  )

  cd freetype-$pkgver
  arch-meson build "${meson_options[@]}"
  meson compile -C build
}

package()
{
  cd freetype-$pkgver
  meson install -C build --destdir="$pkgdir"
  install -Dt "$pkgdir/etc/profile.d" -m644 ../freetype2.sh
  install -Dt "$pkgdir/usr/share/aclocal" -m644 \
    ./builds/unix/freetype2.m4
}
# vim:set sw=2 sts=-1 et:
