# Maintainer: Tilla <carlosfritz@posteo.net>

pkgname=(libretro-scummvm-git libretro-scummvm-datafiles-git libretro-scummvm-coreinfo-git)
pkgver=140529.0c4e573ce53
pkgrel=1
pkgdesc="ScummVM core"
arch=(x86_64 aarch64)
#url=https://github.com/scummvm/scummvm
url=https://github.com/libretro/scummvm
license=(GPL)
groups=(libretro)
#depends=(libretro-core-info)
makedepends=(git wget unzip)
conflicts=(libretro-scummvm)
#source=(git+https://github.com/scummvm/scummvm.git)
source=(git+https://github.com/libretro/scummvm.git)
sha256sums=(SKIP)

# Where the datafiles will be installed
_sysdir=/home/player/.config/retroarch/system

# Who will own them (user:group)
_sysown=player:player

pkgver() {
  cd scummvm
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
  #git rev-list --count HEAD
}

build() {
  cd scummvm/backends/platform/libretro
  make all
}

package_libretro-scummvm-git() {
  install -Dm 644 scummvm/backends/platform/libretro/scummvm_libretro.so -t "${pkgdir}/usr/lib/libretro/"
}

package_libretro-scummvm-datafiles-git() {
  mkdir -p "${pkgdir}${_sysdir}"
  unzip -q scummvm/backends/platform/libretro/scummvm.zip -d "${pkgdir}${_sysdir}"
  find "${pkgdir}${_sysdir}/scummvm" -type d -exec chmod 755 {} \;
  find "${pkgdir}${_sysdir}/scummvm" -type f -exec chmod 644 {} \;
  chown -R ${_sysown} "${pkgdir}${_sysdir}/scummvm"
}

package_libretro-scummvm-coreinfo-git() {
  install -Dm 644 scummvm/backends/platform/libretro/scummvm_libretro.info -t "${pkgdir}/usr/share/libretro/info/"
}
