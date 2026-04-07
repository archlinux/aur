# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname=amplelinux-git
___pkgname=amplelinux
__pkgname=ample
_pkgname=AmpleLinux
_pkgdir=/opt/${___pkgname}
pkgver=r530.d6ef2a9
pkgrel=1
pkgdesc="This is a port of the macOS native Ample project to the Linux platform, based on the AmpleWin Windows Port."
arch=(x86_64)
url=https://github.com/ksherlock/ample
options=(!strip !debug)
license=('GPL-2.0-or-later')
depends=('python>=3' mame pyside6 python-requests)
makedepends=(git)
provides=(amplelinux)
conflicts=(amplelinux)
source=('git+https://github.com/ksherlock/ample.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${__pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
#  ln -sf ${__pkgname}-r${_tag} ${__pkgname}
  cd ${__pkgname}/AmpleLinux
  echo "N" | ./build_elf.sh
  cd "${srcdir}/${__pkgname}/AmpleLinux/dist/AmpleLinux"
  sed -i "s_^Exec=.*_Exec=/opt/${___pkgname}/AmpleLinux_" AmpleLinux.desktop
  sed -i "s_^Icon=.*_Icon=/opt/${___pkgname}/ample.png_" AmpleLinux.desktop
}

package() {
  install -d "$pkgdir/${_pkgdir}"
  cd "${__pkgname}/AmpleLinux/dist"
  cp -r AmpleLinux/* "$pkgdir/${_pkgdir}"

  # install desktop file
  install -Dm644 ${srcdir}/${__pkgname}/AmpleLinux/dist/AmpleLinux/AmpleLinux.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # fix bgfx path
  cd ${pkgdir}/opt/${___pkgname}/mame
  mame -cc
  sed -i 's-^bgfx_path.*-bgfx_path                 /usr/lib/mame/bgfx-' mame.ini

  # set permissions on /opt/${_pkgname}/mame/roms
  cd ${pkgdir}/opt/${___pkgname}/mame
  chgrp games roms
  chmod g+w roms
  echo "Please make sure to make any user intended to administrate the ROMs for AmpleLinux a member of the 'games' group."
}
