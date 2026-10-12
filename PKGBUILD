# Maintainer: Evgeniy Dombek <edombek@yandex.ru>

pkgname=gildas-last
pkgver=2026.10.gad05e75e57
pkgrel=1
pkgdesc='GILDAS'
arch=('x86_64')
url="https://www.iram.fr/IRAMFR/GILDAS/"
license=('custom')
makedepends=(python python-setuptools python-numpy which)
depends=(gcc-fortran cfitsio gtk3)
optdepends=(python-numpy)
provide=(gildas)

source=("git+https://git.iram.fr/gildas/gildas.git")
sha512sums=(SKIP)
options=('!strip')

prepare() {
  cd "${srcdir}/gildas"
  # Get new tags from remote
  git fetch --tags
  git rev-list --tags --max-count=1
  # Get latest tag name
  latestTag=$(git describe --tags "$(git rev-list --tags --max-count=1)")
  # Checkout latest tag
  git checkout $latestTag
}

pkgver() {
  cd "${srcdir}/gildas"
  git log -1 --format="%cd.g%h" --date=format:'%Y.%m'
}

build() {
    cd ${srcdir}/gildas
    source admin/gildas-env.sh # -n python
    make
}

package() {
    cd ${srcdir}/gildas
    source admin/gildas-env.sh # -n python
    make install
    
    target="opt/gildas"
    cd "$pkgdir"
    mkdir opt
    cp -r ${srcdir}/gildas-exe $target
    
    #Ading /etc/profile
    mkdir -p etc/profile.d
    echo export GAG_ROOT_DIR=/opt/gildas >> etc/profile.d/gildas.sh
    echo export GAG_EXEC_SYSTEM=$GAG_EXEC_SYSTEM >> etc/profile.d/gildas.sh
    echo source /opt/gildas/etc/bash_profile >> etc/profile.d/gildas.sh
    chmod +x etc/profile.d/gildas.sh
}
