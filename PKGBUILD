# Maintainer: Jonathan Steel <jsteel at archlinux.org>

_pkgname=vagrant
pkgname=vagrant-git
pkgver=1.7.4.43.gb721eb6
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
conflicts=('vagrant')
options=('!emptydirs')
makedepends=('git')
depends=('vagrant-substrate')
source=(git://github.com/mitchellh/$_pkgname.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/-/./g;s/^v//'
}

build() {
  cd $_pkgname

  EMBEDDED_DIR=/opt/vagrant/embedded

  "$EMBEDDED_DIR"/bin/gem build $_pkgname.gemspec
  cp vagrant-*.gem vagrant.gem

  GEM_PATH="$srcdir"/$_pkgname/gems-$pkgver-$pkgrel GEM_HOME="$GEM_PATH" \
  GEMRC="$EMBEDDED_DIR"/etc/gemrc CPPFLAGS="-I$EMBEDDED_DIR"/include \
  LDFLAGS="-L$EMBEDDED_DIR"/lib PATH="$EMBEDDED_DIR/bin:$PATH" \
  SSL_CERT_FILE="$EMBEDDED_DIR"/cacert.pem \
    "$EMBEDDED_DIR"/bin/gem install $_pkgname.gem --no-ri --no-rdoc
}

package() {
  cd $_pkgname

  install -d "$pkgdir"/usr/{bin,share/bash-completion/completions}
  install -d "$pkgdir"/opt/vagrant/embedded

  cp -r gems-$pkgver-$pkgrel "$pkgdir"/opt/vagrant/embedded/gems

  ln -s /opt/$_pkgname/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname

  install -Dm644 contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$_pkgname

  install -Dm644 LICENSE \
    "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
