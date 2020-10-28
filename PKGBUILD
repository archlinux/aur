# $Id$
# Maintainer:
# Contributor: 😂👌

pkgname=ttf-dejavu-emojiless
pkgver=2.37
pkgrel=2
pkgdesc="Derivate of DejaVu without characters listed as emoji, in order not to override color fonts"
arch=('any')
url="https://dejavu-fonts.github.io/"
license=('custom')
depends=()
makedepends=('fontforge')
provides=('ttf-font' 'ttf-dejavu')
conflicts=('ttf-dejavu')
source=(https://downloads.sourceforge.net/project/dejavu/dejavu/${pkgver}/dejavu-fonts-ttf-${pkgver}.tar.bz2
        remove-generic-name-assignment-and-aliasing.patch
        http://www.unicode.org/Public/emoji/1.0/emoji-data.txt
        cleaner.py)
sha256sums=('fa9ca4d13871dd122f61258a80d01751d603b4d3ee14095d65453b4e846e17d7'
            '21d85a4f6ea7856074a4eb5c5fce6a10e764d11ff4336e92c4f009815efebb0c'
            'SKIP'
            '67056b33de2550ecbb93d269eacd08d508f47892d5fc582d8bd0c211d5787b78')

prepare() {
  cd dejavu-fonts-ttf-$pkgver
  patch -Np1 -i ../remove-generic-name-assignment-and-aliasing.patch
  cd "${srcdir}"
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
