# Maintainer: Tim Savannah <kata198@gmail.com>

# _STANDALONE_VIRTUALENV - Set to "true" to not require dependencies
#   and build in a standalone virtualenv
_STANDALONE_VIRTUALENV="false"
#_STANDALONE_VIRTUALENV="true"

pkgname=pacman-utils
pkgver=0.7.0
pkgrel=1
pkgdesc="Some utils and helper scripts for archlinux packages "
# arch package url is https://github.com/kata198/pacman-utils-pkg
url="https://github.com/kata198/pacman-utils"
arch=(any)
license=(apache)
if [ "$_STANDALONE_VIRTUALENV" = "true" ];
then
    makedepends=(python python-virtualenv python-setuptools)
    depends=(wget curl python python-virtualenv python-setuptools)
    install=install.sh
else
    makedepends=(python python-setuptools python-cmp_version python-func_timeout)
    depends=(wget curl python python-setuptools python-cmp_version python-func_timeout)
fi
optdepends=('pacman-utils-data:  Data for whatprovides_upstream')
source=("https://github.com/kata198/pacman-utils/archive/${pkgver}.tar.gz")
sha512sums=("f13327f3956d4d867bb4c05aeb6b04f7d097e222a442032ab9e57e7b53423ff21a2fd32afd5f92d3c4a2840e53d99944fb497326d594bc6a877b7c2a1ba072dc")

build() {
  cd "${pkgname}-${pkgver}"

}

_virtualenv_package() {
  # _virtualenv_package - Called when _STANDALONE_VIRTUALENV is "true", 
  #   and will create and install deps into a local virtualenv.
  #
  # Doing it this way ensures no additional AUR dependencies,
  #  but is sub-optimal. cmp_version and function_timeout are BOTH
  #   available in AUR.
  mkdir -p "${pkgdir}/var/lib/pacman-utils"
  pushd "${pkgdir}"

  mkdir -p "${pkgdir}/var/lib/pacman-utils/env"
  virtualenv "var/lib/pacman-utils/env"

  source var/lib/pacman-utils/env/bin/activate

  pushd "${srcdir}/${pkgname}-${pkgver}"

  # Install deps into this virtualenv
  pip install -r requirements.txt

  ./install.sh DESTDIR="${pkgdir}"

  popd # back to pkgdir

  deactivate;

  sed -e "s|${pkgdir}||g" -i var/lib/pacman-utils/env/bin/activate


  cd usr/bin

  # Change all python code to use virtualenv root
  for fname in $(grep -l '^#!/usr/bin/env python' *);
  do
    sed -e 's|^#!/usr/bin/env python|#!/var/lib/pacman-utils/env/bin/python|g' -i "${fname}"
  done
  
  popd
}

_standalone_package() {
  # _standalone_package - Build this package the standard way.
  #  Called with _STANDALONE_VIRTUALENV is "false" (default).
  #
  #   So this way, unless you just want to try it quick
  #    and not have to deal with multiple dep packages

  cd ${pkgname}-$pkgver
  ./install.sh DESTDIR="${pkgdir}"

}

package() {
    if [ "$_STANDALONE_VIRTUALENV" = "false" ];
    then
        _standalone_package;
    else
        _virtualenv_package;
    fi
 }
