# Maintainer: neeshy <neeshy@tfwno.gf>
_pkgname=arch-rcscripts
pkgname="$_pkgname-git"
pkgver=latest
pkgrel=1
pkgdesc="Daemon scripts for initscripts-fork"
arch=('any')
url="https://bitbucket.org/TZ86/arch-rcscripts"
license=('GPL2')
depends=('initscripts-fork')
backup=()
source=("git+https://bitbucket.org/TZ86/arch-rcscripts")
sha256sums=('SKIP')

shopt -s nullglob

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_pkgname"
  local _pkg _rc _conf
  for _pkg in */*; do
    pushd "$_pkg"
    for _rc in *.rc; do
      install -Dm755 "$_rc" "$pkgdir/etc/rc.d/${_rc%.rc}"
    done
    for _conf in *.conf; do
      backup+=("etc/conf.d/$_conf")
      install -Dm644 "$_conf" "$pkgdir/etc/conf.d/$_conf"
    done
    popd
  done
}
