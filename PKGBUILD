# Maintainer: Marc Paradise <marc.paradise+aur@gmail.com>

pkgname=chef-dk
pkgver=4.13.3
pkgrel=1
pkgdesc="The Chef development kit contains all the tools you need to develop and test your infrastructure, built by the awesome Chef community."
arch=('x86_64')
url="https://downloads.chef.io/chef-dk/"
license=('Apache')
depends=()
conflicts=(chef chef-solo chef-client chef-workstation)
source=('https://packages.chef.io/files/stable/chefdk/4.13.3/debian/9/chefdk_4.13.3-1_amd64.deb')
sha256sums=('2012be8b6a82a6e6d760a7f1d92a93e32575adf044bc7410927066bdfe490732')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.xz -C "$pkgdir"

  # cleanup .git folders, any idea why they are in the package?
  find $pkgdir -type d -name ".git" | xargs  rm -rf

  # link executables
  binaries="berks chef chef-apply chef-shell chef-solo chef-vault cookstyle dco delivery foodcritic inspec kitchen knife ohai push-apply pushy-client pushy-service-manager chef-client"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/chefdk/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod -R 755 $pkgdir/opt
}
