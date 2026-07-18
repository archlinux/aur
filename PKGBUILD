# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname=amplelinux
__pkgname=ample
_pkgname=AmpleLinux
_pkgdir=/opt/${pkgname}
pkgver=0.288
#_tag=d6ef2a9ee35b6ae637c274213931f16d983019b4 # git rev-parse "r80"
_tag=80
pkgrel=1
pkgdesc="This is a port of the macOS native Ample project to the Linux platform, based on the AmpleWin Windows Port."
arch=(x86_64)
url=https://github.com/ksherlock/ample
options=(!strip !debug)
license=('GPL-2.0-or-later')
depends=('python>=3' mame pyside6 python-requests)
makedepends=(git)
#source=("git+https://github.com/ksherlock/ample.git?signed#tag=$_tag")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ksherlock/${__pkgname}/archive/refs/tags/r${_tag}.tar.gz")
md5sums=('c03d15eacd9094772d40ffba7ae91485')

build() {
  ln -sf ${__pkgname}-r${_tag} ${__pkgname}
  cd ${__pkgname}/AmpleLinux
  echo "N" | ./build_elf.sh
  cd "${srcdir}/${__pkgname}/AmpleLinux/dist/AmpleLinux"
  sed -i "s_^Exec=.*_Exec=/opt/${pkgname}/AmpleLinux_" AmpleLinux.desktop
  sed -i "s_^Icon=.*_Icon=/opt/${pkgname}/ample.png_" AmpleLinux.desktop
}

package() {
  install -d "$pkgdir/${_pkgdir}"
  cd "${__pkgname}/AmpleLinux/dist"
  cp -r AmpleLinux/* "$pkgdir/${_pkgdir}"

  # install desktop file
  install -Dm644 ${srcdir}/${__pkgname}/AmpleLinux/dist/AmpleLinux/AmpleLinux.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # fix bgfx path
  cd ${pkgdir}/opt/${pkgname}/mame
  mame -cc
  sed -i 's-^bgfx_path.*-bgfx_path                 /usr/lib/mame/bgfx-' mame.ini

  # set permissions on /opt/${_pkgname}/mame/roms
  cd ${pkgdir}/opt/${pkgname}/mame
  chgrp games roms
  chmod g+w roms
  echo "Please make sure to make any user intended to administrate the ROMs for AmpleLinux a member of the 'games' group."
}
