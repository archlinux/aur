# Maintainer: Ralph Plawetzki <ralph@purejava.org>

pkgname=keepassxc-cryptomator
pkgver=0.0.4
pkgrel=1
pkgdesc="Store Cryptomator vault passwords in KeePassXC"
arch=('x86_64')
url="https://plugin.purejava.org/"
license=('MIT')
depends=('java-environment=17' 'cryptomator' 'keepassxc')
makedepends=('maven')
source=("keepassxc-cryptomator-${pkgver}::https://github.com/purejava/keepassxc-cryptomator/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e0e08680422ea9bf678dd912a15d0331e95c257373113d82cc1d42adb2f3aa64')
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

  if ! archlinux-java status | grep default | grep 17 ; then
    echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}Configuration hint:${_COL_DEFAULT_} You don't have a ${_COL_BWHITE_}Java 17 JDK${_COL_DEFAULT_} selected as your Java environment but the following installed on your system:"
    echo -e "${_COL_BWHITE_}     `archlinux-java status | grep 17`${_COL_DEFAULT_}"
    echo -e "     Select a Java 17 JDK using ${_COL_LIGHTGREY_}\"sudo archlinux-java set <name from the list above>\"${_COL_DEFAULT_}\n"
    echo -e "     If done so, please re-run the installation.\n"
    return 1
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
