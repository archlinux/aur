# Maintainer: Томас <70m4c@70m4c.su>

# shellcheck disable=SC2148 # Ignore lack of shebang
# shellcheck disable=SC2034 # Ignore "unused" PKGBUILD variables
# shellcheck disable=SC2154 # Ignore "unassigned" references to $srcdir and $pkgdir

pkgname=chef-server
pkgver=14.14.1
pkgrel=1
pkgdesc="The Chef server works with the Chef client as a central artifact store and distribution mechanism that manages scale, complexity, and safeguarding your systems. "
arch=('x86_64')
url="https://downloads.chef.io/chef-server/"
license=('custom:Chef EULA')
depends=()
conflicts=( chef chef-solo chef-client chef-dk )
source=('https://packages.chef.io/files/stable/chef-server/14.14.1/ubuntu/18.04/chef-server-core_14.14.1-1_amd64.deb')
sha256sums=('e04002324894491a6fbb33d15e0b30704a56ea90b44d7320ca113a21217bb14f')

package() {
  depends=('libxcrypt-compat')

  cd "$srcdir" || exit 1
  bsdtar -xf data.tar.xz -C "$pkgdir"

  install -Dm644 "$pkgdir/opt/opscode/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/bin"
  binaries="chef-apply chef-client chef-server-ctl chef-shell chef-solo gather-logs knife ohai"
  for binary in $binaries; do
    ln -s "/opt/opscode/bin/$binary" "$pkgdir/usr/bin/" || error_exit "Cannot link $binary to /usr/bin"
  done

  chown -Rh 0:0 "$pkgdir"
  chmod -R 755 "$pkgdir/opt"
}
