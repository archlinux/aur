# Maintainer: Trevor Bramble <inbox@trevorbramble.com>

pkgname=chef-dk
pkgver=3.0.36
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
sha512sums=('6aa91ceafebafab48b2e33bc0957047d18c4bcc61f90fd7cd08e55fccb2d09544e699bcda2f59a57190f60a790d30bd7ccf06f28ac7f37ecbfac2137f5e63f7b')

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
