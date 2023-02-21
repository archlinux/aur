pkgname='enroot'
pkgver='3.4.1'
pkgrel='1'
pkgdesc='A simple yet powerful tool to turn traditional container/OS images into unprivileged sandboxes.'
url='https://github.com/NVIDIA/enroot'
arch=(x86_64)
license=(Apache)
makedepends=(git gcc make libtool)
depends=(jq parallel squashfs-tools)
optdepends=(fuse-overlayfs-git libnvidia-container-tools pigz squashfuse)
install='enroot.install'
source=("git+https://github.com/NVIDIA/enroot.git#tag=v${pkgver}")
sha256sums=(SKIP)

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
