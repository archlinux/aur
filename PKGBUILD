# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=chef-dk
pkgver=3.2.30
pkgrel=1
pkgdesc="The Chef development kit contains all the tools you need to develop and test your infrastructure, built by the awesome Chef community."
arch=('x86_64')
url="https://downloads.chef.io/chef-dk/"
license=('Apache')
depends=()
conflicts=( chef chef-solo chef-client chef-workstation )
source=("https://packages.chef.io/files/stable/chefdk/${pkgver}/debian/9/chefdk_${pkgver}-1_amd64.deb")
sha512sums=('705cd412420ae94434143e1defa0a256facd25317b028bb1d28750614588e86e390475e33476181aeecb8ec13b386a1eb7cafc2737691b7b5223959933070706')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

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
