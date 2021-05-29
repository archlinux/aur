# $Id$
# Maintainer:
# Contributor: 😂👌

pkgname=ttf-dejavu-emojiless
pkgver=2.37
pkgrel=3
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
            '4822fed8b857ca26490fe13ab504904a1da59ed18f34ed25cc27fcace0fdf88b'
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
  cd dejavu-fonts-ttf-$pkgver

  install -Dt "$pkgdir/usr/share/fonts/TTF" -m644 ttf/*.ttf
  install -Dt "$pkgdir/usr/share/fontconfig/conf.avail" -m644 fontconfig/*.conf

  mkdir "$pkgdir/usr/share/fontconfig/conf.default"
  ln -srt "$pkgdir/usr/share/fontconfig/conf.default" \
    "$pkgdir"/usr/share/fontconfig/conf.avail/*

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 LICENSE
}
