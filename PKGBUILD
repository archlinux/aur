# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-term-custom-git
pkgver=r1490.57ebf7b2
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('afdko' 'git' 'nodejs' 'npm' 'otfcc' 'ttfautohint')
depends=('fontconfig' 'xorg-font-utils')
conflicts=('ttf-iosevka-term-custom')
provides=('ttf-iosevka-term-custom')
replaces=('ttf-iosevka-termlig-custom-git')
source=(
  'git+https://github.com/be5invis/Iosevka'
  'private-build-plans.toml.example'
)
sha256sums=(
  'SKIP'
  '547612d75758d3489610bf6738e1236276e65b4af8473248cc4c710bf832d743'
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
    cp private-build-plans.toml.example Iosevka/private-build-plans.toml
  fi
}

build() {
  cd Iosevka
  npm install
  npm update
  npm run build -- ttf::iosevka-term-custom
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
