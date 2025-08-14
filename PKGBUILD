# Maintainer: Reset1443 <aur@barata.pt>

# shellcheck disable=SC2148 # Ignore lack of shebang
# shellcheck disable=SC2034 # Ignore "unused" PKGBUILD variables
# shellcheck disable=SC2154 # Ignore "unassigned" references to $srcdir and $pkgdir

pkgname=chef-client
pkgver=18.8.9
pkgrel=1
pkgdesc="The Chef Client installation package includes everything you need to start converging your machines."
arch=('x86_64')
url="https://omnitruck.chef.io/stable/chef/metadata?m=x86_64&v=18&p=debian&pv=12"
license=('custom:Chef EULA')
depends=()
conflicts=(chef chef-solo chef-dk cinc)
source=("https://packages.chef.io/files/stable/chef/${pkgver}/debian/11/chef_${pkgver}-${pkgrel}_amd64.deb")
sha256sums=('ec55bb170952cec6bf62f2d89666c3d4e77dadac26692a29455168b192262e4b')

package() {
  depends=('libxcrypt-compat')

  cd "$srcdir" || exit 1
  bsdtar -xf data.tar.xz -C "$pkgdir"

  install -Dm644 "$pkgdir/opt/chef/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/bin"
  binaries="chef-apply chef-shell knife chef-client chef-solo ohai"
  for binary in $binaries; do
    ln -s "/opt/chef/bin/$binary" "$pkgdir/usr/bin/" || error_exit "Cannot link $binary to /usr/bin"
  done

  chown -Rh 0:0 "$pkgdir"
  chmod -R 755 "$pkgdir/opt"
}
