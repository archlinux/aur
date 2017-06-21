# Maintainer: Greg Fitzgerald <gregf@hugops.pw>

pkgname=chef-dk
pkgver=1.5.0
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Development Kit contains everything you need to start using Chef along with the tools essential to managing the code that runs your business."
arch=('x86_64')
url="https://downloads.chef.io/chef-dk/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://packages.chef.io/files/stable/chefdk/${pkgver}/ubuntu/12.04/chefdk_${pkgver}-1_amd64.deb")
sha512sums=('eac0c5b47687ddd5032377a0d243d98d1fc1ae05b092391650f40a596f8f85ce21a821644421d5caa47fe5363184d911cd3d72be5282ae326dfbdcb9c49049f2')

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
  chmod 755 $pkgdir/opt
}
