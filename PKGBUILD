# Maintainer: Marcel Huber <marcelhuberfoo@gmail.com>

pkgname=nvidia-docker-1.0.1
pkgver=1.0.1
pkgrel=1
pkgdesc="Build and run Docker containers leveraging NVIDIA GPUs"
license=('custom')
arch=('x86_64')
url='https://github.com/NVIDIA/nvidia-docker'
makedepends=(libarchive)
optdepends=(cuda nvidia opencl-nvidia)
conflicts=(nvidia-docker)
install=nvidia-docker.install
source_x86_64=(https://github.com/NVIDIA/nvidia-docker/releases/download/v${pkgver}/nvidia-docker-${pkgver}-1.${arch}.rpm)
sha256sums_x86_64=('f05dfe7fe655ed39c399db0d6362e351b059f2708c3e6da17f590a000237ec3a')

build() {
  cd $srcdir
  sed -r -i -e '/^User=/ d' \
            -e 's|^(.*SOCK_DIR=).*$|\1/run/docker/plugins"|' \
            -e 's|(SPEC_FILE=)/etc|\1/run|' \
    usr/lib/systemd/system/nvidia-docker.service
}

package() {
  cd $srcdir
  install -m755 -d $pkgdir/usr/{bin,share/licenses/nvidia-docker,lib/systemd/system}
  install -D -m755 usr/bin/nvidia-docker* "$pkgdir/usr/bin/"
  install -D -m644 usr/lib/systemd/system/nvidia-docker.service "$pkgdir/usr/lib/systemd/system/"
  install -D -m644 usr/share/licenses/nvidia-docker-*/LICENSE "$pkgdir/usr/share/licenses/nvidia-docker/LICENSE"
}

# vim: set ft=sh syn=sh ts=2 sw=2 et:
