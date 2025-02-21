# Maintainer : 00ein00 <Ein420@proton.me>

VUFIND_HOME=usr/local/vufind/
VUFIND_CONF_DIR=$VUFIND_HOME/config/vufind

DLAGENTS=("https::/usr/bin/wget -N --timestamping %u")

pkgname='vufind'
pkgver=10.1.1
pkgrel=1
pkgdesc='VuFind® is a discovery system designed and developed for libraries by libraries.'
arch=('any')
source=(
  'https://github.com/vufind-org/vufind/releases/download/v10.1.1/vufind_10.1.1.deb'
)

url='https://vufind.org/'

license=('GPL-2.0')
makedepends=('wget')
depends=('apache' 'java-runtime' 'java-environment' 'mariadb' 'php' 'php-pear' 'php-gd')
optdepends=('composer: update php packages')
provides=('vufind=${pkgver}')
conflicts=('vufind')

install=vufind.install

sha256sums=('e07b62d793d0d1bb197aa301c668b02bd6a2fa3559129daa94c1ac0475db3133')

pre_remove() {
  if [[ -f "/${VUFIND_HOME}" ]]; then
    rm -rvf "/${VUFIND_HOME}"
  fi
}

post_remove() {
  xdg-icon-resource forceupdate --theme hicolor &>/dev/null
  update-desktop-database -q
}

package() {

  bsdtar -xf "${srcdir}/data.tar.zst" -C "${pkgdir}/"
  mkdir -p "${pkgdir}/usr/share/licenses/"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/vufind" "${pkgdir}/usr/local/vufind/LICENSE"
}
