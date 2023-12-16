# Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
_pkgname=ttf-iosevka-fixed-custom
pkgname=${_pkgname}-git
pkgver=1702712905
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
sha256sums=('06c50b69add84b3bf4fcfdec4b190ef130942440877a0842e3a575d54fe5909e')

prepare () {
  rm -rf Iosevka
  git clone --depth 1 --branch dev 'https://github.com/be5invis/Iosevka'

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
  NO_COLOR=1 npm run build -- contents::IosevkaFixedCustom
}

package () {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/IosevkaFixedCustom/TTF/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/fonts/WOFF2"
  install -m644 Iosevka/dist/IosevkaFixedCustom/WOFF2/*.woff2 "${pkgdir}/usr/share/fonts/WOFF2/"
  printf '%s\n' 'CSS BELOW:'
  cat Iosevka/dist/IosevkaFixedCustom/*.css
  printf '%s\n' 'CSS ABOVE'
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
