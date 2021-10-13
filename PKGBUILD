# Maintainer: Ralph Plawetzki <ralph@purejava.org>

pkgname=keepassxc-cryptomator
pkgver=0.0.3
pkgrel=2
pkgdesc="Store Cryptomator vault passwords in KeePassXC"
arch=('x86_64')
url="https://plugin.purejava.org/"
license=('MIT')
depends=('java-environment=17' 'cryptomator' 'keepassxc')
makedepends=('maven')
source=("keepassxc-cryptomator-${pkgver}::https://github.com/purejava/keepassxc-cryptomator/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f25cd9ba9bd446d12f9430490781a29ec97dbd1913e09033919e7d6ca52e4292')
options=('!strip')

build() {
  cd "${srcdir}/keepassxc-cryptomator-${pkgver}"
  mvn -B clean package --file pom.xml
}

prepare() {

  # use colors only if we have them
  if [[ $(which tput > /dev/null 2>&1 && tput -T "${TERM}" colors || echo -n '0') -ge 8 ]] ; then
    local _COL_YELLOW_='\e[0;33m'
    local _COL_LIGHTGREY_='\e[0;37m'
    local _COL_BRED_='\e[1;31m'
    local _COL_BBLUE_='\e[1;34m'
    local _COL_BWHITE_='\e[1;37m'
    local _COL_DEFAULT_='\e[0m'
  fi

  msg "Packaging ${pkgname}..."

  echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}NOTE:${_COL_BWHITE_} ${pkgname}${_COL_DEFAULT_} gets installed to ${_COL_LIGHTGREY_}/usr/local/share/Cryptomator/plugins/${_COL_DEFAULT_}\n"
  echo -e "     In order to make it available to Cryptomator, you need to create a symlink to the Cryptomator plugin directory.\n"
  echo '     For instance:'
  echo -e "\n        ${_COL_LIGHTGREY_}ln -s /usr/local/share/Cryptomator/plugins/keepassxc-cryptomator-${pkgver}.jar ~/.local/share/Cryptomator/plugins/${_COL_DEFAULT_}\n"

}

package() {
  mkdir -p "${pkgdir}/opt/keepassxc-cryptomator/"
  cp -R "${srcdir}/keepassxc-cryptomator-${pkgver}/target/keepassxc-cryptomator-${pkgver}.jar" ${pkgdir}/opt/keepassxc-cryptomator/

  mkdir -p "${pkgdir}/usr/local/share/Cryptomator/plugins"
  ln -s "/opt/keepassxc-cryptomator/keepassxc-cryptomator-${pkgver}.jar" "${pkgdir}/usr/local/share/Cryptomator/plugins/keepassxc-cryptomator-${pkgver}.jar"
}
