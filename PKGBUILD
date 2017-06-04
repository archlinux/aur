# Maintainer: Tim Savannah <kata198@gmail.com>


pkgname=pacman-utils
pkgver=0.5.2
pkgrel=1
pkgdesc="Some utils and helper scripts for archlinux packages "
# arch package url is https://github.com/kata198/pacman-utils-pkg
url="https://github.com/kata198/pacman-utils"
arch=(i686 x86_64)
license=(apache)
depends=(python python-virtualenv python-setuptools)
optdepends=('pacman-utils-data:  Data for whatprovides_upstream')
source=("https://github.com/kata198/pacman-utils/archive/${pkgver}.tar.gz")
sha512sums=('b7ceab1984abc828ad3f368317cd0c82d8bc27b18eded38e87b276435d2e011736dad895a32554522e76720c4b6086a660372637ce8a5fa13277ccd210284546')
install=install.sh

build() {
  cd "${pkgname}-${pkgver}"

}

package() {
  mkdir -p "${pkgdir}/var/lib/pacman-utils"
  pushd "${pkgdir}"

  mkdir -p "${pkgdir}/var/lib/pacman-utils/env"
  virtualenv "var/lib/pacman-utils/env"

  source var/lib/pacman-utils/env/bin/activate

  pushd "${srcdir}/${pkgname}-${pkgver}"

  # TODO: Need to add cmp_version and func_timeout packages, which will remove
  #   the need for this virtualenv
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
