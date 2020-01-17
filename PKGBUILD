# Maintainer: Joris Baum <joris.baum@cloudandheat.com>
# Contributor: Marc Paradise <marc.paradise+aur@gmail.com>

pkgname=chef-dk-free
pkgver=3.13.1
pkgrel=1
pkgdesc="The Chef development kit contains all the tools you need to develop and test your infrastructure, built by the awesome Chef community. Non-commercial, free distribution."
arch=('x86_64')
url="https://downloads.chef.io/chefdk/"
license=('Apache')
depends=()
conflicts=(chef chef-client chef-dk chef-solo chef-workstation)
source=("https://packages.chef.io/files/stable/chefdk/${pkgver}/debian/9/chefdk_${pkgver}-1_amd64.deb")
sha256sums=('455bdb8828a1f9f50eb12dba49343cf77a165381eba3f4bed6a10a11c87d03c3')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # cleanup .git folders, any idea why they are in the package?
  find "$pkgdir" -type d -name ".git" | xargs  rm -rf

  # link executables
  binaries="berks chef chef-apply chef-shell chef-solo chef-vault cookstyle dco delivery foodcritic inspec kitchen knife ohai push-apply pushy-client pushy-service-manager chef-client"

  mkdir -p "$pkgdir/usr/bin"

  for binary in $binaries; do
    ln -s "/opt/chefdk/bin/$binary" "$pkgdir/usr/bin/" || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 "$pkgdir"
  chmod -R 755 "$pkgdir/opt"
}
