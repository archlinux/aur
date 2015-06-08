# Maintainer: Jonathan Steel <jsteel at archlinux.org>

_pkgname=vagrant
pkgname=vagrant-git
pkgver=1.7.0.5.g2385305
_pkgver=1.7.0
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
conflicts=('vagrant')
options=('!emptydirs')
makedepends=('git')
depends=('ruby' 'curl' 'lzo' 'libidn' 'rtmpdump')
source=(git://github.com/mitchellh/$_pkgname.git
        git://github.com/mitchellh/$_pkgname-installers.git
        http://pkgbuild.com/~jsteel/arch/$_pkgname/substrate_archlinux_$CARCH.zip)
md5sums=('SKIP' 'SKIP')
[[ $CARCH == i686 ]] && md5sums+=('c04042b24de56d18a041bc005e5ecaa4')
[[ $CARCH == x86_64 ]] && md5sums+=('53d8a137e0b50fee8509a7d1c15fd33b')

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

  ln -s /opt/$_pkgname/embedded/gems/gems/$_pkgname-$_pkgver/contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$_pkgname

  install -Dm644 "$srcdir"/$_pkgname/LICENSE \
    "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
