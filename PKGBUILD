# Maintainer: Marcel Huber <marcelhuberfoo@gmail.com>

pkgname=nvidia-docker
pkgver=1.0.0.rc.3
pkgrel=1
pkgdesc="Build and run Docker containers leveraging NVIDIA GPUs"
license=('custom')
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-docker'
makedepends=(libarchive)
optdepends=(cuda nvidia opencl-nvidia)
install=${pkgname}.install
source_x86_64=(https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.0-rc.3/nvidia-docker-${pkgver}-1.${arch}.rpm)
sha256sums_x86_64=('67e087eaf1941c997a052a5b57e3520fd3589e958167a0d71c21a214f1a9956a')

build() {
  cd $srcdir
  sed -r -i -e '/^User=/ d' \
            -e 's|^(.*SOCK_DIR=).*$|\1/run/docker/plugins"|' \
            -e 's|(SPEC_FILE=)/etc|\1/run|' \
    usr/lib/systemd/system/$pkgname.service
}

package() {
  cd $srcdir
  install -m755 -d $pkgdir/usr/{bin,share/licenses/$pkgname,lib/systemd/system}
  install -D -m755 usr/bin/$pkgname* "$pkgdir/usr/bin/"
  install -D -m644 usr/lib/systemd/system/$pkgname.service "$pkgdir/usr/lib/systemd/system/"
  install -D -m644 usr/share/licenses/$pkgname-*/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ft=sh syn=sh ts=2 sw=2 et:
