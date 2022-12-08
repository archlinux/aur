# Maintainer: grainrigi <naonaokiryu2 at gmail.com>

pkgname=cri-dockerd-git
pkgver=0.2.6
pkgrel=1
pkgdesc='A CRI implementation on top of Docker'
url='https://github.com/mirantis/cri-dockerd'
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
license=(Apache)
makedepends=('go')
depends=('docker')
provides=('cri-dockerd')
_srcname=cri-dockerd
source=(
  'git+https://github.com/mirantis/cri-dockerd.git'
)
sha256sums=('SKIP')

pkgver() {
  cd $_srcname

  (git describe --abbrev=0 --tags | sed -e 's/v//') || echo $(cat VERSION)-$(git log -1 --pretty='%h')
}

build() {
  cd $_srcname

  mkdir -p bin
  echo 'Building...'
  go build -o bin/cri-dockerd
}

package() {
  cd $_srcname

  mkdir -p ${pkgdir}/usr/bin
  install -o root -g root -m 0755 bin/cri-dockerd ${pkgdir}/usr/bin/cri-dockerd
  mkdir -p ${pkgdir}/usr/lib/systemd/system
  cp -a packaging/systemd/* ${pkgdir}/usr/lib/systemd/system
}
