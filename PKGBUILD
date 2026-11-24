# Maintainer: MaximMaximS <sklenicka dot maxim at gmail dot com>
# Contributor: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Porous3247

pkgname=ddcci-driver-linux-dkms-git
_pkgname=${pkgname%-git}
_reponame=${_pkgname%-dkms}
pkgver=0.4.5.r8.gbbb7553
pkgrel=2
epoch=1
pkgdesc="A pair of Linux kernel drivers for DDC/CI monitors (DKMS) - git version"
arch=('i686' 'x86_64' 'aarch64')
url="https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux/"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("ddcci-driver-linux" "ddcci-driver-linux-dkms")
provides=("ddcci-driver-linux=${pkgver}" "ddcci-driver-linux-dkms=${pkgver}")
source=("git+https://gitlab.com/ddcci-driver-linux/ddcci-driver-linux.git"
        "ddcci-kernel-compat.patch")
b2sums=('SKIP'
        'a51f89ace2cf242ce32606f09abd76414990d28b46507ed78c4fc5cbda5b5056f7069d7f99a2d634f1b9700728b3e36c0977aec56a365e2c05af132757647c2e')

pkgver() {
  cd "$_reponame"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//'
}

prepare() {
  cd "$_reponame"
  patch -Np1 -i ../ddcci-kernel-compat.patch
}

package() {
  cd "$_reponame"
  local lastver=$(git describe --tags --abbrev=0)
  local vernum=${lastver#v}
  local destdir="${pkgdir}/usr/src/ddcci-${vernum}"
  cd ..

  install -d "${destdir}"
  cp -rT "$_reponame" "${destdir}"
}
