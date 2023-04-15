# Maintainer: Ralph Plawetzki <ralph@purejava.org>

pkgname=keepassxc-cryptomator
pkgver=1.2.2
pkgrel=1
pkgdesc="Store Cryptomator vault passwords in KeePassXC"
arch=('x86_64')
url="https://plugin.purejava.org/"
license=('MIT')
depends=('cryptomator' 'keepassxc')
makedepends=('java-environment>=17' 'maven')
source=("keepassxc-cryptomator-${pkgver}.tar.gz::https://github.com/purejava/keepassxc-cryptomator/releases/download/${pkgver}/keepassxc-cryptomator-${pkgver}.tar.gz"
        "keepassxc-cryptomator-${pkgver}.tar.gz.sig::https://github.com/purejava/keepassxc-cryptomator/releases/download/${pkgver}/keepassxc-cryptomator-${pkgver}.tar.gz.sig")
sha256sums=('be32d6b6d1cf6edde4bd2fc49ce583ecfba0ffec5d2b50b1e98ef743cfb90b68'
            'SKIP')
options=('!strip')

validpgpkeys=('54CF8E1F55CE7E977A0E41895BFB2076ABC48776')

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

  if ! archlinux-java get | grep -E "17|18|19" ; then
    echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}Configuration hint:${_COL_DEFAULT_} You don't have a ${_COL_BWHITE_}Java 17 JDK (or later)${_COL_DEFAULT_} selected as your Java environment but the following installed on your system:"
    echo -e "${_COL_BWHITE_}`archlinux-java status | sed '1,${/^Available Java environments/d}' | sed 's/^/     /'`${_COL_DEFAULT_}\n"
    echo -e "     Select a Java 17 JDK or later using ${_COL_LIGHTGREY_}\"sudo archlinux-java set <name from the list above>\"${_COL_DEFAULT_}\n"
    echo -e "     If done so, please re-run the installation.\n"
    return 1
  fi

  msg "Packaging ${pkgname}..."

  echo -e "\n  ${_COL_BBLUE_}->${_COL_DEFAULT_} ${_COL_BRED_}NOTE:${_COL_BWHITE_} ${pkgname}${_COL_DEFAULT_} gets installed to ${_COL_LIGHTGREY_}/usr/local/share/Cryptomator/plugins/${_COL_DEFAULT_}\n"
  echo -e "     In order to make it available to Cryptomator, you need to create a symlink to the Cryptomator plugin directory.\n"
  echo '     For instance:'
  echo -e "\n        ${_COL_LIGHTGREY_}ln -s /usr/local/share/Cryptomator/plugins/keepassxc-cryptomator-${pkgver}.jar ~/.local/share/Cryptomator/plugins/${_COL_DEFAULT_}\n"

}

build() {
  cd "${srcdir}/keepassxc-cryptomator-${pkgver}"
  mvn -B clean package --file pom.xml
}

package() {
  mkdir -p "${pkgdir}/opt/keepassxc-cryptomator/"
  cp -R "${srcdir}/keepassxc-cryptomator-${pkgver}/target/keepassxc-cryptomator-${pkgver}.jar" ${pkgdir}/opt/keepassxc-cryptomator/

  mkdir -p "${pkgdir}/usr/local/share/Cryptomator/plugins"
  ln -s "/opt/keepassxc-cryptomator/keepassxc-cryptomator-${pkgver}.jar" "${pkgdir}/usr/local/share/Cryptomator/plugins/keepassxc-cryptomator-${pkgver}.jar"
}
