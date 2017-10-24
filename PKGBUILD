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
pkgver=2.0.0
pkgrel=2
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="https://vagrantup.com"
license=('MIT')
options=('!emptydirs')
depends=('vagrant-substrate' 'libyaml')
makedepends=('openssl-1.0')
source=($pkgname-$pkgver.tar.gz::https://github.com/mitchellh/$pkgname/archive/v$pkgver.tar.gz
        vagrant-virtualbox-5.2.patch::https://github.com/hashicorp/vagrant/commit/7d73af5637de41f1e53b8f1ef2ea9baf76842dfb.patch)
sha256sums=('c25d3a5f18abdf349047f4d80bb74e6cb526959536e4bef5aa771de9d39cb260'
            '44c13bd3e222e618e94ba66ebaf94a5c630bf94c55ebcfb19ba266e8549fb70b')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../vagrant-virtualbox-5.2.patch
}

build() {
  cd $pkgname-$pkgver

  EMBEDDED_DIR=/opt/vagrant/embedded

  "$EMBEDDED_DIR"/bin/gem build $pkgname.gemspec

  GEM_PATH="$srcdir"/$pkgname-$pkgver/gems-$pkgver-$pkgrel GEM_HOME="$GEM_PATH" \
  GEMRC="$EMBEDDED_DIR"/etc/gemrc \
  CPPFLAGS="-I$EMBEDDED_DIR/include -I${EMBEDDED_DIR}/include/libxml2" \
  CFLAGS="${CFLAGS} ${CPPFLAGS}" \
  LDFLAGS="${LDFLAGS} -L$EMBEDDED_DIR/lib" PATH="$EMBEDDED_DIR/bin:$PATH" \
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
