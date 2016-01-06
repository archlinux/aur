# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com

# cli functionality has been tested.
# Web functionality has not been tested.

set -u
pkgname='mysqlconvertertool-git'
pkgver=r7.0fc9af5
pkgrel=1
pkgdesc='A fork of the MySQL Converter Tool (mysql to mysqli)'
arch=('any')
url='https://github.com/philip/MySQLConverterTool'
license=('PHP')
depends=('php')
makedepends=('git')
provides=("${pkgname%%-*}=1.0")
conflicts=("${pkgname%%-*}")
_srcdir="MySQLConverterTool"
source=("git+https://github.com/philip/MySQLConverterTool.git")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_srcdir}"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  set +u
}

prepare(){
  set -u
  cd "${_srcdir}"
  #sed -i -e "s:^require_once(':&/usr/lib/mysqlconvertertool/:g" 'Converter.php' 'cli.php'
  set +u
}

package(){
  set -u
  cd "${_srcdir}"
  install -d "${pkgdir}/usr/lib/mysqlconvertertool"
  mv 'Function' 'GUI' 'Converter.php' 'cli.php' 'index.php' "${pkgdir}/usr/lib/mysqlconvertertool/"

  install -Dm755 <(cat << EOF
#!/usr/bin/bash
php -d 'open_basedir=NULL' -d 'include_path=/usr/lib/mysqlconvertertool/' -f /usr/lib/mysqlconvertertool/cli.php -- "\$@"
EOF
  ) "${pkgdir}/usr/bin/mysqlconvertertool"
  set +u
}
set +u
