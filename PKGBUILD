# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Ranieri Althoff <ranisalt+aur at gmail.com>

pkgname=hsakmt-roct-git
_pkgname="${pkgname%-git}"
pkgver=latest
pkgrel=1
pkgdesc="Radeon Open Compute Thunk Interface"
arch=('x86_64')
url='https://github.com/RadeonOpenCompute/ROCT-Thunk-Interface'
license=('MIT')
depends=('numactl' 'pciutils')
makedepends=('git' 'cmake')
provides=("$_pkgname")
replaces=('roct-thunk-interface-git')
conflicts=("$_pkgname")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -DCMAKE_INSTALL_PREFIX=/opt/rocm "$pkgname"
  make all build-dev
}

package() {
  make DESTDIR="$pkgdir" install install-dev

  install -Dm644 "$pkgname/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d "$pkgdir/etc/ld.so.conf.d"
  cat << EOF > "$pkgdir/etc/ld.so.conf.d/$_pkgname.conf"
/opt/rocm/lib
EOF
}
