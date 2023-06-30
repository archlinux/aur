# Maintainer: Paweł Otlewski <pawel@idkcloud.com>

# shellcheck disable=SC2148 # Ignore lack of shebang
# shellcheck disable=SC2034 # Ignore "unused" PKGBUILD variables
# shellcheck disable=SC2154 # Ignore "unassigned" references to $srcdir and $pkgdir

pkgname=chef-workstation
pkgver=23.5.1040
pkgrel=1
pkgdesc="Chef's developer toolkit that includes Infra, InSpec, Habitat, and tools like knife."
arch=('x86_64')
url="https://www.chef.io/downloads/tools/workstation"
license=('custom:Chef EULA')
depends=()
conflicts=(chef-dk chef chef-solo cinc)
replaces=('chef-dk')
source=('https://packages.chef.io/files/stable/chef-workstation/23.5.1040/debian/11/chef-workstation_23.5.1040-1_amd64.deb')
sha256sums=('fbace5a45c3bf857b72791a893b9dd3ddd80507165aeb80219329e6523e74305')

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
