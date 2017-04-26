# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Brett Hoerner <brett@bretthoerner.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Contributor: helios <aur@wiresphere.de>
# Contributor: George Ornbo <gornbo@gmail.com>
# Contributor: Niklas Heer <niklas.heer@me.com>
# Contributor: Steven Nance <steven@devtrw.com>

pkgname=vagrant
pkgver=1.9.4
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
options=('!emptydirs')
depends=('vagrant-substrate' 'libyaml')
makedepends=('openssl-1.0')
source=($pkgname-$pkgver.tar.gz::https://github.com/mitchellh/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('c034e19fb08b725f0a6e0a811f014a69')

build() {
  cd $pkgname-$pkgver

  EMBEDDED_DIR=/opt/vagrant/embedded

  "$EMBEDDED_DIR"/bin/gem build $pkgname.gemspec

  GEM_PATH="$srcdir"/$pkgname-$pkgver/gems-$pkgver-$pkgrel GEM_HOME="$GEM_PATH" \
  GEMRC="$EMBEDDED_DIR"/etc/gemrc \
  CPPFLAGS="-I$EMBEDDED_DIR/include -I${EMBEDDED_DIR}/include/libxml2" \
  CFLAGS="${CPPFLAGS}" \
  LDFLAGS="-L$EMBEDDED_DIR"/lib PATH="$EMBEDDED_DIR/bin:$PATH" \
  SSL_CERT_FILE="$EMBEDDED_DIR"/cacert.pem \
  NOKOGIRI_USE_SYSTEM_LIBRARIES=1 \
    "$EMBEDDED_DIR"/bin/gem install $pkgname-$pkgver.gem --no-ri --no-rdoc
}

package() {
  cd $pkgname-$pkgver

  install -d "$pkgdir"/usr/{bin,share/bash-completion/completions}
  install -d "$pkgdir"/opt/vagrant/embedded

  cp -r gems-$pkgver-$pkgrel "$pkgdir"/opt/vagrant/embedded/gems

  ln -s /opt/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -Dm644 contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$pkgname

  install -Dm644 LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
