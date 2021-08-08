# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
_pkgname=ttf-iosevka-fixed-custom
pkgname=${_pkgname}-git
pkgver=1627815710
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs>=12.22.0' 'npm' 'ttfautohint')
depends=()
conflicts=(${_pkgname})
provides=(${_pkgname})
source=('private-build-plans.toml.example')
sha256sums=('cce26afc81543505be3eea8d8fb465c903a428673406b43b5d4ad23821eed066')

prepare () {
  rm -rf Iosevka
  git clone --depth 1 --branch master 'https://github.com/be5invis/Iosevka'

  buildplans="$HOME/.config/iosevka/private-build-plans.toml"
  if [[ -f "$buildplans" ]]; then
    cp "$buildplans" Iosevka/
  else
    echo ">>> $buildplans not found, using private-build-plans.toml.example"
    cp private-build-plans.toml.example Iosevka/private-build-plans.toml
  fi
}

pkgver () {
  cd Iosevka
  git log -1 --format=%ct
}

build () {
  cd Iosevka
  npm install
  npm update
  NO_COLOR=1 npm run build -- ttf::${_pkgname#*-}
}

package () {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
