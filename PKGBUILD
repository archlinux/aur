# Maintainer: Tony Fettes <feihaoxiang2014@gmail.com>
# Contributor: Elrondo46 (https://github.com/Elrondo46)
# Contributor: kounch (https://github.com/kounch)

pkgname=argonone-git
_gitname=argonone
pkgver=r30.c878d73
pkgrel=1
pkgdesc="Argon One Service and Control Scripts por Raspberry Pi"
arch=('any')
url='https://download.argon40.com/argon1.sh'
license=('GPL3')
makedepends=('git')
depends=('i2c-tools' 'lm_sensors' 'python>=3.3' 'raspberrypi-userland-aarch64-git' 'python-raspberry-gpio')
provides=('argonone')
backup=('etc/argononed.conf' 'etc/modules-load.d/argonone-i2c.conf')
install=argonone.install
source=(
  "git+https://github.com/kounch/argonone.git#branch=feature/RaspberryPi4"
  "remove_virtual_env.patch"
  "argonone-i2c.conf"
)
sha256sums=(
  'SKIP'
  '387244f164aefd796da544aa13809544ac0b0b35e44ddaf5aa1155f915aefcf4'
  '8bf7f83cd0d8bdd6f212177a7555b3bea7f60b0a34e662f56b0ad4954bb7daae'
)

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}"/"${_gitname}"
  git apply "${srcdir}"/remove_virtual_env.patch
}

package() {
  install -Dm755 "${srcdir}"/"${_gitname}"/argonone-config "${pkgdir}"/usr/bin/argonone-config
  install -Dm755 "${srcdir}"/"${_gitname}"/argononed-poweroff.py "${pkgdir}"/usr/lib/systemd/system-shutdown/argononed-poweroff.py
  install -Dm644 "${srcdir}"/"${_gitname}"/argononed.conf "${pkgdir}"/etc/argononed.conf
  install -Dm755 "${srcdir}"/"${_gitname}"/argononed.py "${pkgdir}"/usr/bin/argononed
  install -Dm644 "${srcdir}"/"${_gitname}"/argononed.service "${pkgdir}"/usr/lib/systemd/system/argononed.service
  install -Dm644 "${srcdir}"/argonone-i2c.conf "${pkgdir}"/etc/modules-load.d/argonone-i2c.conf
}
