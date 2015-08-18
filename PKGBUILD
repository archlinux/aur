# Maintainer: Maxim Kraev <maxim.kraev@gmail.com>

pkgname=chef-dk
pkgver=0.7.0
pkgrel=1
_ubuntuver=raring
_ubunturel=4
pkgdesc="The Chef Development Kit contains everything you need to start using Chef along with the tools essential to managing the code that runs your business."
arch=('x86_64')
url="https://downloads.chef.io/chef-dk/"
license=('Apache')
depends=()
conflicts=( chef chef-solo )
source=("https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chefdk_0.7.0-1_amd64.deb")
sha512sums=('205bedfc08d47c1e0a98c2e052f17568b4be4c62d8343783959c4bbd61eaad457327da61dda100c78f28175b7744586a37a3f9d7ade559bc086850c3e6d460a6')


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
}
