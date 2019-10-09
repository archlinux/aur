# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=booth-git
_pkgname=booth
pkgver=1.0.r174.gce9f821
pkgrel=1
pkgdesc="RAFT cluster ticket manager for pacemaker"
arch=('i686' 'x86_64')
url="https://github.com/ClusterLabs/${_pkgname}/"
license=('GPL2')
depends=('pacemaker-git' 'ha-glue')
provides=(${_pkgname})
conflicts=(${_pkgname})
optdepends=('pcs-git: for cluster shell support'
	    'crmsh-git: for cluster shell support')
makedepends=('git')
source=("$pkgname::git+https://github.com/ClusterLabs/${_pkgname}.git"
	"pcs.patch::https://patch-diff.githubusercontent.com/raw/ClusterLabs/$_pkgname/pull/41.patch")
sha512sums=('SKIP'
            '5b6297c444ef326c59705170717865572812639f8a9c6e23a02b73234ae6edd23b9337b9284fa12ae489f3a599fe538dd92c26db12a011ca0eac09c2b15289cb')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd $pkgname
  patch -Np1 -b -z .orig <../pcs.patch
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --libdir=/usr/lib \
    --libexecdir=/usr/lib \
    --localstatedir=/var
  make V=0
}

package() {
  cd $pkgname
  make DESTDIR="${pkgdir}" install
}
