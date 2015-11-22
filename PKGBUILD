# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>

pkgname=chef-dk
pkgver=0.10.0
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Development Kit contains everything you need to start using Chef along with the tools essential to managing the code that runs your business."
arch=('x86_64')
url="https://downloads.chef.io/chef-dk/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_${pkgver}-1_amd64.deb")
sha512sums=('b79889c06bf33cca2da57a0c905c85f0f9983afa341b717590f6051d091fbe8d4c891358b9b47227c6024fa7ada59c6a4197e4ad24ec1bcaef11522169dadd2a')


package() {
  cd "$srcdir"
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # cleanup .git folders, any idea why they are in the package?
  find $pkgdir -type d -name ".git" | xargs  rm -rf

  # link executables
  binaries="chef chef-solo chef-apply chef-shell knife shef ohai berks chef-zero fauxhai foodcritic kitchen rubocop strain strainer chef-client"

  mkdir -p $pkgdir/usr/bin

  for binary in $binaries; do
    ln -sf /opt/chefdk/bin/$binary $pkgdir/usr/bin/ || error_exit "Cannot link $binary to /usr/bin"
  done
  chown -Rh 0:0 $pkgdir
  chmod 755 $pkgdir/opt
}
