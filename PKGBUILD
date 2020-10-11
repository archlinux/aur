# Maintainer: Mario Oenning <mo-son at mailbox dot org>
# Author: Leonardo Gates

_pkgbase=ryzen_smu
pkgname=ryzen_smu-dkms-git
pkgver=70.44a0f68
pkgrel=1
pkgdesc="A Linux kernel driver that exposes access to the SMU (System Management Unit) for certain AMD Ryzen Processors"
arch=('x86_64')
url="https://gitlab.com/leogx9r/ryzen_smu"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'linux-headers')
provides=('ryzen_smu')

source=("$_pkgbase::git+$url.git"
        "dkms.conf"
        "$_pkgbase.conf")

sha256sums=('SKIP'
            '0ced27963dac8e270221574d0c2b686bbbb012e3af8741188800f9cb6b7d8e63'
            'a48f5c846ca5fd8f185f1317c8001c97f59ac432392d53b581802c7761b9360f')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgbase"

  install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
  cp -r ${srcdir}/${_pkgbase}/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

  install -Dm644 ${srcdir}/${_pkgbase}.conf "${pkgdir}"/usr/lib/depmod.d/${_pkgbase}.conf
}
