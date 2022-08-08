# Maintainer: Igor Saric <karabaja4 at gmail.com>
# shellcheck disable=SC2181,SC2148,SC2034,SC2164,SC2154

_gitname=minirc-ng
_version=1.2
pkgname=${_gitname}-git
pkgver=${_version}.f0d0e0a
pkgrel=1
pkgdesc="Minimalistic init script (ng)"
arch=('any')
url="https://github.com/karabaja4/${_gitname}"
license=('GPL2')
depends=('busybox' 'bash' 'jq' 'util-linux')
makedepends=('git')
optdepends=('systemd: udev implementation')
conflicts=('systemd-sysvcompat' 'sysvinit')
backup=('etc/minirc.json' 'etc/minirc.local' 'etc/minirc.local.shutdown')
source=("git+${url}.git")
md5sums=('SKIP')

prepare() {
  cd "${_gitname}"
  sed -i "8s/${_gitname}/${_gitname} ${_version}.$(git rev-parse --short HEAD)/g" "src/rc"
}

pkgver() {
  cd "${_gitname}"
  echo "${_version}.$(git rev-parse --short HEAD)"
}

package() {
  cd "${_gitname}"

  install -Dm755 "src/rc" "${pkgdir}/usr/bin/rc"
  install -Dm755 "src/minirc.local" "${pkgdir}/etc/minirc.local"
  install -Dm755 "src/minirc.local.shutdown" "${pkgdir}/etc/minirc.local.shutdown"
  install -Dm644 "src/minirc.json" "${pkgdir}/etc/minirc.json"
  install -Dm644 "src/inittab" "${pkgdir}/etc/inittab"

  for i in init halt poweroff reboot
  do
      ln -sf "/usr/bin/busybox" "${pkgdir}/usr/bin/${i}"
  done
}
