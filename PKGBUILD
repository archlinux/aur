# Maintainer: Chia-I Wu <olvaffe@gmail.com>

_gitname='vboot_reference'
pkgname='vboot-minimal-git'
pkgver=142
pkgrel=1
pkgdesc='Minimal ChromeOS verified boot utilities, without flashrom support'
arch=('aarch64' 'x86_64')
url="https://chromium.googlesource.com/chromiumos/platform/${_gitname}"
license=('BSD-3-Clause')
depends=('util-linux-libs' 'openssl')
makedepends=('git')
conflicts=('cgpt-bin' 'chromeos-vboot-reference-git' 'vboot-utils')

prepare() {
  if [ -d "${_gitname}" ]; then
    git -C "${_gitname}" pull
  else
    git clone "${url}" "${_gitname}"
  fi
}

pkgver() {
  git -C "${_gitname}" describe --all --match 'origin/release-R*.B' |
    sed -e 's,^remotes/origin/release-R\([0-9]*\)-[0-9]*\.B,\1,' \
        -e 's,-\([0-9]*\)-g,.r\1.,'
}

build() {
  make -C "${_gitname}" -j$(nproc) \
    cgpt_install futil_install devkeys_install \
    DESTDIR="${srcdir}/install" BUILD="${srcdir}/build" \
    WERROR= USE_FLASHROM=0
}

package() {
  install -m755 -Dt "${pkgdir}/usr/bin" \
    install/usr/bin/cgpt \
    install/usr/bin/futility

  install -m644 -Dt "${pkgdir}/usr/share/vboot/devkeys" \
    install/usr/share/vboot/devkeys/*
}
