# Maintainer: Evgeniy Dombek <edombek@yandex.ru>

pname=gildas
pkgname=gildas-last
pkgver=2026.10.gad05e75e57
pkgrel=2
pkgdesc='GILDAS build last tag from git'
arch=('x86_64')
url="https://www.iram.fr/IRAMFR/GILDAS/"
license=('custom')
makedepends=(python python-setuptools python-numpy which)
depends=(gcc-fortran cfitsio gtk3)
optdepends=(python-numpy)
provides=(gildas)
conflicts=(gildas)

source=("git+https://git.iram.fr/gildas/gildas.git")
sha512sums=(SKIP)
options=('!strip')

prepare() {
  cd "${srcdir}/$pname"
  git fetch --tags
  git rev-list --tags --max-count=1
  latestTag=$(git describe --tags "$(git rev-list --tags --max-count=1)")
  git checkout $latestTag
}

pkgver() {
  cd "${srcdir}/$pname"
  git log -1 --format="%cd.g%h" --date=format:'%Y.%m'
}

build() {
    cd ${srcdir}/$pname
    source admin/gildas-env.sh # -n python
    make
}

package() {
    cd ${srcdir}/$pname
    source admin/gildas-env.sh # -n python
    make install
    
    target="opt/$pname"
    cd "$pkgdir"
    mkdir opt
    cp -r ${srcdir}/gildas-exe $target
    
    #Ading /etc/profile
    mkdir -p etc/profile.d
    echo export GAG_ROOT_DIR=/opt/$pname >> etc/profile.d/$pname.sh
    echo export GAG_EXEC_SYSTEM=$GAG_EXEC_SYSTEM >> etc/profile.d/$pname.sh
    echo source /opt/$pname/etc/bash_profile >> etc/profile.d/$pname.sh
    chmod +x etc/profile.d/$pname.sh


    echo setenv GAG_ROOT_DIR /opt/$pname >> etc/profile.d/$pname.csh
    echo setenv GAG_EXEC_SYSTEM $GAG_EXEC_SYSTEM >> etc/profile.d/$pname.csh
    echo source /opt/$pname/etc/login >> etc/profile.d/$pname.csh
    chmod +x etc/profile.d/$pname.csh
}
