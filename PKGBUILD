# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-custom-git
pkgver=r1397.d5dd611b
pkgrel=2
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs' 'npm' 'ttfautohint' 'otfcc')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
provides=()
source=(
  "git+https://github.com/be5invis/Iosevka"
  "private-build-plans.toml.example"
  "toothless-G.patch"
)
sha256sums=(
  'SKIP'
  '930cc4b63f9076e6cb40599ef7d51fc7fdab2eaac6a76bf344eb2d79ee4a950e'
  '56d1d97b421ab462d71875ecadf57d65ee45fe26edee50922ae9ae96350cff52'
)

pkgver() {
  cd Iosevka
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  buildplans="$HOME/.config/iosevka/private-build-plans.toml"
  if [[ -f "$buildplans" ]]; then
    cp "$buildplans" Iosevka/
  else
    echo ">>> $buildplans not found, using private-build-plans.toml.example"
    cp private-build-plans.toml.example Iosevka/
  fi

  cd Iosevka
  # patch -p1 < ../toothless-G.patch

  # Uncomment the above line to get back the smoother capital G,
  # as seen in this image (look for "LIGHT"):
  # https://raw.githubusercontent.com/be5invis/Iosevka/47023ab4058987f58844f6308d8175e735106b8a/images/preview-all.png
}

build() {
  cd Iosevka
  npm install
  npm run build -- ttf::iosevka-custom
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
