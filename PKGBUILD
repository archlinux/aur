pkgname='enroot-git'
pkgver=2.2.0
pkgrel=2
pkgdesc='A simple yet powerful tool to turn traditional container/OS images into unprivileged sandboxes.'
url='https://github.com/NVIDIA/enroot'
arch=(x86_64)
license=(Apache)
makedepends=(git gcc make libtool)
depends=(jq parallel squashfs-tools)
optdepends=(fuse-overlayfs-git libnvidia-container-tools pigz pv squashfuse)
conflicts=(enroot)
provides=(enroot)
install='enroot.install'
source=("git+https://github.com/NVIDIA/enroot.git#branch=master")
sha256sums=(SKIP)

pkgver() {
  cd enroot
  # Remove leading "v"; add "r" before commit count; convert dashes to dots.
  git describe --long --tags | sed 's/^v// ; s/\([^-]*-g\)/r\1/ ; s/-/./g'
}

build() {
  cd 'enroot'
  CPPFLAGS="-DALLOW_SPECULATION -DINHERIT_FDS" make -j "$(nproc)" prefix='' exec_prefix=/usr datarootdir=/usr/share
}

package() {
  cd 'enroot'
  DESTDIR="$pkgdir/" make install prefix='' exec_prefix=/usr datarootdir=/usr/share
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  mv "${pkgdir}/usr/share/enroot/bash_completion" "${pkgdir}/usr/share/bash-completion/completions/enroot"
}

backup=(etc/enroot/enroot.conf)
