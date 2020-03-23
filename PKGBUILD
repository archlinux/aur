# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Daniel Seymour <dannyseeless@gmail.com>

pkgname=qnap-qdk-git
pkgver=2.3.10.r92.4903650
pkgrel=1
pkgdesc='QNAP Development Kit '
arch=(x86_64)
url=https://github.com/qnap-dev/QDK
license=(GPL)
depends=(rsync)
makedepends=(git)
optdepends=(
  'gpg: Support for GPG signing'
  'p7zip: Support for 7z compression'
)
provides=(qnap-qdk)
conflicts=(qnap-qdk)
source=(git+https://github.com/qnap-dev/QDK.git)
sha256sums=(SKIP)

pkgver() {
  cd QDK

  source shared/qdk.conf
  echo "${QDK_VERSION}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
 sed -i 's/\/etc\/config/\/etc/g; s/\/usr\/local/\/usr/g' QDK/shared/bin/qbuild
 sed -i 's/^QDK_PATH_P=.*/QDK_PATH_P=\/opt/' QDK/shared/qdk.conf
}

build(){
  make -C QDK/src
}

package() {
  install -dm 755 "${pkgdir}"/{usr/bin,opt/QDK}
  cp -dr --no-preserve='ownership' QDK/shared/{bin,doc,scripts,template} "${pkgdir}"/opt/QDK/
  install -Dm 644 QDK/shared/qdk.conf -t "${pkgdir}"/etc/
  ln -s /opt/QDK/bin/qbuild "${pkgdir}"/usr/bin/
  ln -s /opt/QDK/bin/qpkg_encrypt "${pkgdir}"/usr/bin/
}

# vim: ts=2 sw=2 et:
