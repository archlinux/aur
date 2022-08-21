# Maintainer: Haruue Icymoon <i@haruue.moe>

_pkgbase=iptables-mod-randmap
pkgbase=${_pkgbase}-git
pkgname=("${pkgbase}-dkms" "${pkgbase}-usrmod")
pkgver=r5.b186e7c
pkgrel=1
pkgdesc='An iptables extensions for stateless address / port randomization'
url='https://github.com/haruue-net/iptables-mod-randmap'
license=('GPL2')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
depends=('dkms' 'iptables')
makedepends=('git')
source=("$_pkgbase"::"git+$url.git")
sha1sums=('SKIP')

pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgbase"/usrmod
  make
}

package_iptables-mod-randmap-git-dkms() {
  cd "$_pkgbase"

  pkgdesc="$pkgdesc (dkms)"
  depends=('dkms')
  local _targetdir="$pkgdir/usr/src/$pkgbase-$pkgver"

  install -Dm644 dkms.conf "$_targetdir/dkms.conf"
  sed -i 's/PACKAGE_VERSION=.*/PACKAGE_VERSION="'"$pkgver"'"/' "$_targetdir/dkms.conf"

  install -Dm644 Makefile "$_targetdir/Makefile"
  install -Dm644 *.c *.inc "$_targetdir/"
  install -dm755 "$_targetdir/include"
  cp -r include/. "$_targetdir/include/"
}

package_iptables-mod-randmap-git-usrmod() {
  cd "$_pkgbase"/usrmod

  pkgdesc="$pkgdesc (usrmod)"
  depends=('iptables')

  install -Dm644 libxt_RANDMAP.so "$pkgdir/usr/lib/xtables/libxt_RANDMAP.so"
}
