# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Maintainer: bohoomil <@zoho.com>

pkgname=freetype2-infinality
pkgver=2.6.2
pkgrel=1
_patchrel=2015.12.05
pkgdesc="TrueType font rendering library with Infinality patches and custom settings."
arch=('armv7h' 'i686' 'x86_64')
changelog=CHANGELOG
license=('GPL' 'MIT')
groups=('infinality-bundle')
url="http://freetype.sourceforge.net"
depends=('zlib' 'bzip2' 'sh' 'xorg-xrdb' 'libpng' 'harfbuzz')
conflicts=('freetype2' 'freetype2-infinality')
provides=("freetype2=$pkgver" 'freetype2-infinality' 'freetype2-infinality-ultimate')
install='infinality.install'
source=(http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2
        "01-freetype-${pkgver}-enable-valid.patch"
        "02-upstream-${_patchrel}.patch"
        "03-infinality-${pkgver}-${_patchrel}.patch"
         xft-settings.sh
         infinality-settings.sh
         infinality-settings-generic)

sha1sums=('29c22b85b77cb22cf95c13e7062e21f39fe6b17a'
          'abf7a8f726ad6359533651a8942636880febf9f6'
          '319c377ef4e3f6bc2f52acb893c9b880ef9578b4'
          'a19a000e778a0b29b0ef0623d566b12187b7f24a'
          'a1859f2eacae2046a9ef705ac2bcc4bdf4fd9717'
          '5624c40049a73f8c75d01537212b4c7040f1761f'
          '4d219670cb9641b649f6ba0f2a799006f7c3c3c5')

prepare() {
  cd "freetype-${pkgver}"

  patches=("01-freetype-${pkgver}-enable-valid.patch"
           "02-upstream-${_patchrel}.patch"
           "03-infinality-${pkgver}-${_patchrel}.patch")

  # infinality & post release fixes
  for patch in "${patches[@]}"; do
    patch -Np1 -i ${srcdir}/"${patch}"
  done

}

build() {
  cd "freetype-${pkgver}"

  ./configure \
    --prefix=/usr \
    --disable-static \
    --with-harfbuzz \
    --with-png

  make
}

#check() {
  #cd "freetype-${pkgver}"
  #make -k check
#}

package() {
  cd "freetype-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # freetype2 runtime settings
  install -m755 -d "${pkgdir}/etc/X11/xinit/xinitrc.d"
  install -m755 "${srcdir}/xft-settings.sh" \
    "${pkgdir}/etc/X11/xinit/xinitrc.d/xft-settings.sh"

  install -m755 -d "${pkgdir}/usr/share/doc/freetype2-infinality-ultimate"
  install -m755 "${srcdir}/infinality-settings.sh" \
    "${pkgdir}/usr/share/doc/freetype2-infinality-ultimate/infinality-settings.sh"
  install -m755 "${srcdir}/infinality-settings-generic" \
    "${pkgdir}/usr/share/doc/freetype2-infinality-ultimate/infinality-settings-generic"
}
