# Maintainer: Tom Moore <middleagedman@users.noreply.github.com>
# Contributor: Paweł Otlewski <pawel@idkcloud.com>

# shellcheck disable=SC2148 # Ignore lack of shebang
# shellcheck disable=SC2034 # Ignore "unused" PKGBUILD variables
# shellcheck disable=SC2154 # Ignore "unassigned" references to $srcdir and $pkgdir

pkgname=chef-workstation
pkgver=23.12.1055
pkgrel=1
pkgdesc="Chef's developer toolkit that includes Infra, InSpec, Habitat, and tools like knife."
arch=('x86_64')
url="https://www.chef.io/downloads/tools/workstation"
license=('custom:Chef EULA')
depends=()
conflicts=(chef-dk chef chef-solo cinc)
replaces=('chef-dk')
source=("https://packages.chef.io/repos/apt/stable/ubuntu/20.04/chef-workstation_$pkgver-1_amd64.deb")
sha256sums=('383b269ef486018b9d36849ba6267054085c296a097adf1bd00bd7446dee7452')

package() {
  depends=('libxcrypt-compat')

  cd "$srcdir" || exit 1
  bsdtar -xf data.tar.xz -C "$pkgdir"

  install -Dm644 "$pkgdir/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mkdir -p "$pkgdir/usr/bin"
  binaries="berks chef chef-analyze chef-apply chef-cli chef-client chef-resource-inspector chef-run chef-service-manager chef-shell chef-solo chef-vault chef-windows-service chef-zero cookstyle delivery fauxhai foodcritic hab inspec kitchen knife mixlib-install ohai stove"
  for binary in $binaries; do
    ln -s "/opt/$pkgname/bin/$binary" "$pkgdir/usr/bin/" || error_exit "Cannot link $binary to /usr/bin"
  done

  chown -Rh 0:0 "$pkgdir"
  chmod -R 755 "$pkgdir/opt"
}
