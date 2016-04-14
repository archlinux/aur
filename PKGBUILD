# Maintainer : Dobroslaw Kijowski [dobo] <dobo90_at_gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: JIN Xiao-Yong <jinxiaoyong@gmail.com>
# Contributor: bohoomil <@zoho.com>

pkgname=freetype2-infinality
pkgver=2.6.3
pkgrel=1
_patchrel=2016.03.26
_commit=36b60ecefe1fd0e042cad51105b0ffb29315e577
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
        "01-freetype-2.6.3-enable-valid.patch::https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/freetype/01-freetype-2.6.2-enable-valid.patch"
        "https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/freetype/02-upstream-2016.03.26.patch"
        "https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/freetype/03-infinality-2.6.3-2016.03.26.patch"
        "https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/freetype/xft-settings.sh"
        "https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/freetype/infinality-settings.sh"
        "infinality-settings-generic::https://raw.githubusercontent.com/bohoomil/fontconfig-ultimate/${_commit}/freetype/generic_settings/infinality-settings.sh")

sha1sums=('6c98bd5d0be313207c37ca23d25faf983486aee5'
          'abf7a8f726ad6359533651a8942636880febf9f6'
          'dc527dc3b45bb5f17533e7e049d16c475007a945'
          'fa848046558c4ac59ef77775ab4a1a9d7200417f'
          'a1859f2eacae2046a9ef705ac2bcc4bdf4fd9717'
          '44ca94634f894011db9ed7edbb105b50ca591e52'
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
