# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-custom-git
pkgver=r991.79a6f89
pkgrel=2
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs' 'npm' 'ttfautohint' 'otfcc')
depends=('fontconfig' 'xorg-font-utils')
conflicts=(ttf-iosevka-term{,-hooky,-zshaped,-slab})
provides=('ttf-iosevka-term')
source=("git+https://github.com/be5invis/Iosevka")
md5sums=('SKIP')

pkgver() {
  cd "Iosevka"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  : ${IOSEVKA_DESIGN='v-l-tailed v-i-hooky v-g-opendoublestorey v-m-shortleg v-zero-dotted'}
  [[ $IOSEVKA_DESIGN = *term* ]] && design="$IOSEVKA_DESIGN" || design="term $IOSEVKA_DESIGN"
  cd Iosevka
  npm install
  make custom-config design="$design"
  make custom
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
  for font in "${pkgdir}"/usr/share/fonts/TTF/*; do
    mv "$font" "${font%.*}-term.${font##*.}"
  done
}

# letter l:
#     v-l-hooky : Hooky l.
#     v-l-zshaped : Z-shaped l.
#     v-l-serifed : Serifed l (default for upright and oblique).
#     v-l-italic : Italic l (default for italic).
#     v-l-tailed : l with a curved tail.
#     v-l-hookybottom : l with a straight tail.
# letter i:
#     v-i-hooky : Hooky i.
#     v-i-zshaped : Z-shaped i.
#     v-i-serifed : Serifed i (default for upright and oblique).
#     v-i-italic : Italic i (default for italic).
# letter a:
#     v-a-doublestorey : Double-storey a (default for upright and oblique).
#     v-a-singlestorey : Single-storey a (default for italic).
# letter g:
#     v-g-doublestorey : Double-storey g (default).
#     v-g-singlestorey : Single-storey g.
#     v-g-opendoublestorey : Open Single-storey g.
# letter m:
#     v-m-longleg : m with long middle leg (default).
#     v-m-shortleg : m with shorter middle leg.
# letter t:
#     v-t-standard : Standard t shape (default).
#     v-t-cross : Futura-like t shape.
# letter Q:
#     v-q-taily : Q with a curly tail (default).
#     v-q-straight : Q with a straight tail in the old versions.
# zero (0):
#     v-zero-slashed : Slashed Zero 0 (default).
#     v-zero-dotted : Dotted Zero 0.
#     v-zero-unslashed : O-like 0.
# ASCII tilde (~), asterisk (*), paragaraph(¶), underscore (_) and ASCII Caret (^):
#     v-tilde-high : Higher tilde ~.
#     v-tilde-low : Lower tilde ~ (default).
#     v-asterisk-high : Higher asterisk * (default).
#     v-asterisk-low : Lower asterisk *.
#     v-paragraph-high : Higher paragraph symbol ¶ (default).
#     v-paragraph-low : Lower paragraph symbol ¶.
#     v-caret-high : Higher circumflex ^ (default).
#     v-caret-low : Lower circumflex ^.
#     v-underscore-high : Higher underscore _ (default).
#     v-underscore-low : Lower underscore _.
# At (@):
#     v-at-long : The long, three-fold At symbol in Iosevka 1.7.x.
#     v-at-fourfold : The traditional, four-fold At symbol.
#     v-at-short : The shorter, Fira-like At symbol introduced in Iosevka 1.8.
# Eszet(ß)
#     v-eszet-traditional : Tratidional, Fraktur-like Eszet.
#     v-eszet-sulzbacher : A more modern, beta-like Eszet (default).
# curly brackets ({})
#     v-brace-straight : More straight braces.
#     v-brace-curly : More curly braces (default).
# dollar symbol ($):
#     v-dollar-open : Dollar symbol with open contour.
#     v-dollar-through : Dollar symbol with strike-through vertical bar (default).
# Number sign (#):
#     v-numbersign-upright : Number sign with vertical bars (default).
#     v-numbersign-slanted : Number sign with slanted bars.
