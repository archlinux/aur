# Maintainer: Jonathan Steel <jsteel at archlinux.org>

_pkgname=vagrant
pkgname=vagrant-git
pkgver=1.7.3.37.gbac5d03
pkgrel=1
_subver=2
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
conflicts=('vagrant')
options=('!emptydirs')
makedepends=('git')
depends=('lzo' 'libidn' 'rtmpdump')
source=(git://github.com/mitchellh/$_pkgname.git
        git://github.com/mitchellh/$_pkgname-installers.git)
source_i686+=(http://pkgbuild.com/~jsteel/$_pkgname/substrate_archlinux_i686-$_subver.zip)
source_x86_64+=(http://pkgbuild.com/~jsteel/$_pkgname/substrate_archlinux_x86_64-$_subver.zip)
md5sums=('SKIP' 'SKIP')
md5sums_i686=('a72932fa4f1a936d633a8efcde8981c1')
md5sums_x86_64=('98d92dedfb660045ba779c4761deac58')


pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/-/./g;s/^v//'
}

build() {
  cd $_pkgname

  REV=$( git log -n 1 --pretty=format:"%H" )

  "$srcdir"/$_pkgname-installers/package/support/install_$_pkgname.sh \
    "$srcdir"/substrate/ $REV "$srcdir"/substrate/${_pkgname}_version
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/bash-completion/completions/}

  cp -r "$srcdir"/substrate/ "$pkgdir"/opt/$_pkgname/

  ln -s /opt/$_pkgname/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname

  install -Dm644 "$srcdir"/$_pkgname/contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$_pkgname

  install -Dm644 "$srcdir"/$_pkgname/LICENSE \
    "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
