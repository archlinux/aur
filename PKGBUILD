# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=chef-dk
pkgver=2.5.3
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Development Kit contains everything you need to start using Chef along with the tools essential to managing the code that runs your business."
arch=('x86_64')
url="https://downloads.chef.io/chef-dk/"
license=('Apache')
depends=()
conflicts=( chef chef-solo chef-client )
source=("https://packages.chef.io/files/stable/chefdk/${pkgver}/debian/8/chefdk_${pkgver}-1_amd64.deb")
sha512sums=('0ccc599eba251a9f295e570deadc576619c1a1873084b4a0b603eab139402613824cef087b9b8e25f459cf46344cfeaf24b6ed84ba4abd6102cd83f85e749be6')

package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # cleanup .git folders, any idea why they are in the package?
  find $pkgdir -type d -name ".git" | xargs  rm -rf

  # link executables
  binaries="berks chef chef-apply chef-shell chef-solo chef-zero delivery fauxhai foodcritic kitchen knife ohai push-apply pushy-client pushy-service-manager rubocop cookstyle chef-client"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -s /opt/chefdk/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod -R 755 $pkgdir/opt
}
