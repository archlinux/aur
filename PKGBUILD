# Maintainer: sfs <sfslinux@gmail.com>
pkgname=aufs-ng-dkms-git
_pkgname=aufs-ng
pkgver=r75.8633115
pkgrel=1
pkgdesc="aufs-ng union filesystem kernel module (DKMS) - standalone drop-in aufs replacement"
arch=(x86_64)
url="https://github.com/fulalas/aufs-ng"
license=(GPL-2.0-or-later)
depends=(dkms)
makedepends=(git)
provides=(aufs-ng-dkms aufs)
conflicts=(aufs-ng-dkms aufs-dkms)
source=("git+${url}.git" dkms.conf)
sha256sums=('SKIP'
            'd221f26b89a72cef50d80c603ccc2b658f7f94d8ff2d2bc653f814eef1afd6d7')

pkgver() {
  cd "${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  local dest="${pkgdir}/usr/src/${_pkgname}-${pkgver}"
  install -dm755 "${dest}"
  # git archive, not cp: the checkout's .git must not land in /usr/src; tests/ is not needed to build
  git -C "${srcdir}/${_pkgname}" archive HEAD . ':!tests' | tar -xf - -C "${dest}"
  sed "s/#MODULE_VERSION#/${pkgver}/" "${srcdir}/dkms.conf" > "${dest}/dkms.conf"
}
