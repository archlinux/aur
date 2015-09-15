# Maintainer: Jonathan Steel <jsteel at archlinux.org>

_pkgname=vagrant
pkgname=vagrant-git
pkgver=1.7.4.40.gb79f0bb
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
conflicts=('vagrant')
options=('!emptydirs')
makedepends=('git' 'puppet' 'chrpath' 'wget')
depends=('lzo' 'libidn' 'rtmpdump')
source=(git://github.com/mitchellh/$_pkgname.git
        git://github.com/mitchellh/$_pkgname-installers.git
        puppet_module_libiconv.patch
        libiconv.patch
        readline.patch)
md5sums=('SKIP'
         'SKIP'
         '293e1a9bbb8c510f1bc79d9a0bd477ed'
         'c1bd61a5617b64654c33a2afc506e499'
         'a4f87b2483c7bd724bb94a69aa5cf733')

pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/-/./g;s/^v//'
}

prepare() {
  cd $_pkgname-installers/substrate

  # Use $srcdir for the working directory
  sed -i "s:/vagrant-substrate:$srcdir/vagrant-substrate:" hiera/common.yaml

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
  cd $_pkgname-installers/substrate

  # Create the substrate
  FACTER_param_output_dir="$srcdir" puppet apply --hiera_config=config/hiera.yaml \
    --confdir=config --modulepath=modules manifests/init.pp

  cd "$srcdir"/$_pkgname

  REV=$( git log -n 1 --pretty=format:"%H" )

  "$srcdir"/$_pkgname-installers/package/support/install_$_pkgname.sh \
    "$srcdir"/vagrant-substrate/staging/ $REV "$srcdir"/vagrant-substrate/staging/${_pkgname}_version
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/bash-completion/completions/}

  cp -r "$srcdir"/vagrant-substrate/staging/ "$pkgdir"/opt/$_pkgname/

  ln -s /opt/$_pkgname/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname

  install -Dm644 "$srcdir"/$_pkgname/contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$_pkgname

  install -Dm644 "$srcdir"/$_pkgname/LICENSE \
    "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
