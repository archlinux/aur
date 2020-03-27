# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Fabio Zanini <fabio . zanini at fastmail dot fm>

pkgname='singularity-container-git'
_pkgname=singularity
pkgver=v3.5.2.r400.g4660f35c8
pkgrel=1
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='https://sylabs.io/singularity/'
license=('BSD')
makedepends=('go')
depends=('squashfs-tools' 'libseccomp')
provides=('singularity-container')
conflicts=('singularity-container')
source=("git+https://github.com/sylabs/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  mkdir -p gopath/src/github.com/sylabs
  mv $_pkgname gopath/src/github.com/sylabs/
  ln -sf gopath/src/github.com/sylabs/${_pkgname} ./
}

build() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/sylabs/${_pkgname}"
  ./mconfig --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib --localstatedir=/var -V ${pkgver}
  cd builddir
  make
}

package() {
  export GOPATH="${srcdir}/gopath"
  cd "${GOPATH}/src/github.com/sylabs/${_pkgname}/builddir"
  make DESTDIR="$pkgdir" install
}
