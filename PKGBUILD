# $Id$
# Maintainer:
# Contributor: 😂👌

pkgname=ttf-dejavu-emojiless
pkgver=2.37
pkgrel=1
pkgdesc="Derivate of DejaVu without characters listed as emoji, in order not to override color fonts"
arch=('any')
url="http://dejavu-fonts.org/wiki/Main_Page"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-mkfontscale' 'xorg-mkfontdir')
makedepends=('fontforge')
provides=('ttf-font' 'ttf-dejavu')
conflicts=('ttf-dejavu')
source=(http://downloads.sourceforge.net/project/dejavu/dejavu/${pkgver}/dejavu-fonts-ttf-${pkgver}.tar.bz2
        https://github.com/iamcal/emoji-data/raw/master/emoji.json
        cleaner.py)
sha256sums=('fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7'
            'SKIP'
            '415ba5000c5dbaf15b56d91d137a60ee257b5ef31c17cb2fd54ed015220b1f8c')

prepare() {
  ttfdir="${srcdir}"/dejavu-fonts-ttf-${pkgver}/ttf
  for ttf in "${ttfdir}"/*.ttf; do
    fontforge -script cleaner.py $ttf
  done
}

package() {
  install -dm755 "${pkgdir}"/etc/fonts/conf.avail
  install -dm755 "${pkgdir}"/etc/fonts/conf.d
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF

  cd "${srcdir}"/dejavu-fonts-ttf-${pkgver}
  install -m644 ttf/*.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -m644 fontconfig/*.conf "${pkgdir}"/etc/fonts/conf.avail/

  pushd "${pkgdir}"/etc/fonts/conf.avail
  for config in *; do
    ln -sf ../conf.avail/${config} ../conf.d/${config}
  done
  popd

  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}