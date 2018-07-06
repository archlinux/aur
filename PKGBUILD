# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=chef-dk
pkgver=3.1.0
pkgrel=1
pkgdesc="The Chef development kit contains all the tools you need to develop and test your infrastructure, built by the awesome Chef community."
arch=('x86_64')
url="https://downloads.chef.io/chef-dk/"
license=('Apache')
depends=()
conflicts=( chef chef-solo chef-client chef-workstation )
source=("https://packages.chef.io/files/stable/chefdk/${pkgver}/debian/9/chefdk_${pkgver}-1_amd64.deb")
sha512sums=('c46c01a6e4e8010671b554648c0d844310b443e5825f1a0054b1889dc7cc8353293c97a8c7ec8df2ad2d1c303fd139d767ab424692de12c4ac46c33af889aa2d')

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
