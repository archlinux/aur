# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=vagrant-substrate-git
_pkgname=vagrant-installers
pkgver=484.9e058bc
pkgrel=1
pkgdesc="Substrate layer for Vagrant"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
provides=('vagrant-substrate')
conflicts=('vagrant-substrate')
options=('!emptydirs')
makedepends=('git' 'puppet' 'chrpath' 'wget')
depends=('lzo')
source=(git://github.com/mitchellh/$_pkgname.git
        puppet_module_libiconv.patch
        libiconv.patch
        readline.patch)
md5sums=('SKIP'
         'f6ac254962cf77cc4fba443c2d89644e'
         'c1bd61a5617b64654c33a2afc506e499'
         'a4f87b2483c7bd724bb94a69aa5cf733')

pkgver() {
  cd $_pkgname

  echo $(git rev-list --count HEAD).$(git describe --always)
}

prepare() {
  cd $_pkgname/substrate

  # Use $srcdir for the working directory
  sed -i "s:/vagrant-substrate:$srcdir/$_pkgname/vagrant-substrate:" \
    hiera/common.yaml

  # Don't create a zip of the substrate
  sed -i '48,50d' modules/vagrant_substrate/manifests/init.pp

  # Do not set file ownership
  find . -name *.pp -exec sed -i "/owner.*.=.*.root/d" {} +
  find . -name *.pp -exec sed -i "/group.*.=.*.root/d" {} +

  # Fix compile issues
  patch -Np0 -i "$srcdir"/puppet_module_libiconv.patch
  patch -Np0 -i "$srcdir"/readline.patch

  # https://github.com/mitchellh/vagrant-installers/issues/60
  sed -i '61 s/^/#/' modules/ruby/manifests/source.pp
}

build() {
  cd $_pkgname/substrate

  FACTER_param_output_dir="$srcdir" puppet apply \
    --hiera_config=config/hiera.yaml --confdir=config \
    --modulepath=modules manifests/init.pp
}

package() {
  cd $_pkgname

  install -d "$pkgdir"/opt

  cp -r vagrant-substrate/staging "$pkgdir"/opt/vagrant

  install -Dm644 LICENSE.md \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
