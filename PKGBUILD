# Maintainer: Andy Kluger <AndyKluger@gmail.com>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-slab-custom-git
pkgver=2018.10.05T06.46.02Z.68b55c13
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs' 'npm' 'ttfautohint' 'otfcc')
depends=('fontconfig' 'xorg-font-utils')
conflicts=()
provides=()
source=("private-build-plans.toml")
md5sums=('7d6b77730ff5400d69e004cc1921ea19')

pkgver() {
  commits=$(curl --silent https://api.github.com/repos/be5invis/Iosevka/commits)
  tstamp=$(printf "$commits" | grep '\s*"date":' | head -1 | cut -d '"' -f 4 | sed -E 's/-|:/./g')
  short_sha=$(printf "$commits" | grep '\s*"sha":' | head -1 | cut -d '"' -f 4 | cut -c -8)
  printf "$tstamp.$short_sha"
}

prepare() {
  git clone --depth=1 https://github.com/be5invis/Iosevka
  buildplans="$HOME/.config/iosevka/private-build-plans.toml"
  [[ -f "$buildplans" ]] && cp "$buildplans" ../ || echo "$buildplans not found, using pkgbuild creator's"
  cp ../private-build-plans.toml Iosevka/
}

build() {
  cd Iosevka
  npm install
  npm run build -- ttf:iosevka-slab-custom
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
