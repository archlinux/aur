# Maintainer: Kian Kasad <kian@kasad.com>
# Upstream Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
_pkgname=ttf-iosevka-kian
pkgname=${_pkgname}-git
pkgver=r2111.deaa6933
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs>=12.16.0' 'npm' 'ttfautohint')
depends=()
conflicts=(${_pkgname})
provides=(${_pkgname})
source=(
  'git+https://github.com/be5invis/Iosevka'
  'private-build-plans.toml'
)
sha256sums=('SKIP'
            'dc5bb8044eec0e931945862321f3e6c5aa438d95a8d12af68a3250dbcf223653')

pkgver() {
  cd Iosevka
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -T private-build-plans.toml Iosevka/private-build-plans.toml
}

configurations=("iosevka-custom" "iosevka-term-custom")

build() {
  cd Iosevka
  npm install
  npm update
  for configuration in "${configurations[@]}"; do
    npm run build -- ttf::$configuration
  done
}

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 Iosevka/dist/*/ttf/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 Iosevka/LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/"
}
