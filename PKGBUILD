# Maintainer: Kian Kasad <kian@kasad.com>
# Upstream Maintainer: Andy Kluger <https://t.me/andykluger>
# Contributor: Markus Weimar <mail@markusweimar.de>
pkgname=ttf-iosevka-kian-git
_pkgname=${pkgname%-git}
pkgver=r2162.d8329fd7
pkgrel=1
pkgdesc='A slender monospace sans-serif and slab-serif typeface inspired by Pragmata Pro, M+ and PF DIN Mono.'
arch=('any')
url='https://be5invis.github.io/Iosevka/'
license=('custom:OFL')
makedepends=('git' 'nodejs>=12.16.0' 'npm' 'ttfautohint')
depends=()
conflicts=('ttf-iosevka' ${pkgname%-git})
provides=('ttf-iosevka' ${pkgname%-git})
source=(
  'git+https://github.com/be5invis/Iosevka'
  'private-build-plans.toml'
)
sha256sums=('SKIP'
            '0f7efd3a5dcc8c2c36391185e1f6551cc7c1c83a3fca55021b7ea1c6cc1367c6')

pkgver() {
  cd Iosevka
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cp -T private-build-plans.toml Iosevka/private-build-plans.toml
}

configurations=("iosevka-kian" "iosevka-term-kian")

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
