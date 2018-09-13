# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Sylvain HENRY <hsyl20@yahoo.fr>

# TODO: Move out of /opt
# TODO: Implement DKMS
# TODO: Provide simple test instructions

set -u
pkgname='knem'
#pkgver='1.1.2'; _relno='34521'
pkgver='1.1.3'; _relno='37186'
pkgrel='1'
pkgdesc='High-Performance Intra-Node MPI Communication'
arch=('any')
url='http://knem.gforge.inria.fr'
license=('BSD')
depends=('hwloc')
makedepends=('make')
install='knem.install'
_verwatch=("${url}/download/" "http://gforge.inria.fr/frs/download.php/[0-9]\+/${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
_srcdir="${pkgname}-${pkgver}"
source=(
  #"http://runtime.bordeaux.inria.fr/knem/download/knem-${pkgver}.tar.gz"
  "http://gforge.inria.fr/frs/download.php/${_relno}/knem-${pkgver}.tar.gz"
  "0000-gentoo-knem-1.1.3-setup_timer.patch::https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-cluster/knem/files/knem-1.1.3-setup_timer.patch?id=768341030da4acb06798dc0d444ba8ca9dfea5f8"
)
sha256sums=('50d3c4a20c140108b8ce47aaafd0ade0927d6f507e1b5cc690dd6bddeef30f60'
            'd0871602c83047adf60fcc96e34cf4d2d79b9b4b76c3842f64b731fa91cf4380')

prepare() {
  set -u
  cd "${_srcdir}"
  patch -Nup1 -i "${srcdir}/0000-gentoo-knem-1.1.3-setup_timer.patch"
  set +u
}

build() {
  set -u
  cd "${_srcdir}"
  [ -s 'Makefile' ] || ./configure --prefix='/opt/knem'
  #[ -s 'Makefile' ] || ./configure --prefix='/usr' --sbindir='/usr/bin' --sysconfdir='/etc'
  make -s
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 install DESTDIR="${pkgdir}"
  set +u
}
set +u
