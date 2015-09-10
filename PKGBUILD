# Maintainer: Thermi <noel [at] familie-kuntze dot com>

pkgname=fence-virt-git
pkgver=0.4
pkgrel=3
pkgdesc="fencing daemon for a virtualised environment"
url='https://github.com/ClusterLabs/fence-virt'
license=("GPLv2")
arch=('i686' 'x86_64')
depends=()
conflicts=()
backup=('etc/fence_virt.conf')
source=("fence_virtd.service"
	"fence_virtd@.service"
	"git+https://github.com/Thermi/fence-virt.git")
md5sums=(
	'SKIP'
	'SKIP'
	'SKIP')

build() {
  cd ${srcdir}/fence-virt/
  ./autogen.sh
  ./configure --prefix=/ --sbindir=/usr/bin --libdir=/usr/lib --datarootdir=/usr/share --disable-libvirt-qmf-plugin 
  make
}

package() {
  cd "${srcdir}"
  install -Dm 644 fence_virtd.service "${pkgdir}/usr/lib/systemd/system/fence_virtd.service"
  install -Dm 644 fence_virtd@.service "${pkgdir}/usr/lib/systemd/system/fence_virtd@.service"
  mkdir -m755 -p "${pkgdir}/etc/cluster/clusters/"
  cd fence-virt
  make DESTDIR="${pkgdir}" install
}
