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
pkgver=1.7.3
pkgrel=2
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
options=('!emptydirs')
depends=('lzo' 'libidn' 'rtmpdump')
source=($pkgname-$pkgver.tar.gz::http://github.com/mitchellh/$pkgname/archive/v$pkgver.tar.gz)
source_i686+=(http://pkgbuild.com/~jsteel/arch/$pkgname/substrate_archlinux_i686-2.zip)
source_x86_64+=(http://pkgbuild.com/~jsteel/arch/$pkgname/substrate_archlinux_x86_64-2.zip)
md5sums=('f69210d71278884d1ab918e251fc7371')
md5sums_i686=('a72932fa4f1a936d633a8efcde8981c1')
md5sums_x86_64=('98d92dedfb660045ba779c4761deac58')

build() {
  cd $pkgname-$pkgver

  EMBEDDED_DIR="$srcdir"/substrate/embedded

  echo -n $pkgver > "$srcdir"/substrate/${pkgname}_version

  "$EMBEDDED_DIR"/bin/gem build $pkgname.gemspec

  GEM_PATH="$EMBEDDED_DIR"/gems GEM_HOME="$GEM_PATH" \
  GEMRC="$EMBEDDED_DIR"/etc/gemrc CPPFLAGS="-I$EMBEDDED_DIR"/include \
  LDFLAGS="-L$EMBEDDED_DIR"/lib PATH="$EMBEDDED_DIR/bin:$PATH" \
  SSL_CERT_FILE="$EMBEDDED_DIR"/cacert.pem \
    "$EMBEDDED_DIR"/bin/gem install $pkgname-$pkgver.gem --no-ri --no-rdoc
}

package() {
  install -d "$pkgdir"/{opt/,usr/bin/,usr/share/bash-completion/completions/}

  cp -r "$srcdir"/substrate/ "$pkgdir"/opt/$pkgname/

  ln -s /opt/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  ln -s /opt/$pkgname/embedded/gems/gems/$pkgname-$pkgver/contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$pkgname

  install -Dm644 "$srcdir"/$pkgname-$pkgver/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
