# Maintainer: Jonathan Steel <jsteel at aur.archlinux.org>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Brett Hoerner <brett@bretthoerner.com>
# Contributor: Jochen Schalanda <jochen+aur@schalanda.name>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
# Contributor: helios <aur@wiresphere.de>
# Contributor: George Ornbo <gornbo@gmail.com>
# Contributor: Niklas Heer <niklas.heer@me.com>
# Contributor: Steven Nance <steven@devtrw.com>

pkgname=vagrant
pkgver=1.6.3
pkgrel=2
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="http://vagrantup.com"
license=('MIT')
options=('!emptydirs')
depends=('ruby' 'curl' 'lzo2' 'libidn' 'rtmpdump')
makedepends=('git')
source=(http://github.com/mitchellh/$pkgname/archive/v$pkgver.tar.gz
        nfs.patch
        http://pkgbuild.com/~jsteel/aur/$pkgname/substrate_archlinux_$CARCH.zip)
md5sums=('55a91a9d9cba7b8b9d126c75b114e510' 'a670dd93057fbd782176e0275b034bee')
[[ $CARCH == i686 ]] && md5sums[3]='c04042b24de56d18a041bc005e5ecaa4'
[[ $CARCH == x86_64 ]] && md5sums[3]='53d8a137e0b50fee8509a7d1c15fd33b'

prepare() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -Np0 -i "$srcdir"/nfs.patch
}

build() {
  cd "$srcdir"/$pkgname-$pkgver

  EMBEDDED_DIR="$srcdir"/substrate/embedded

  echo -n $pkgver > "$srcdir"/substrate/${pkgname}_version

  "$EMBEDDED_DIR"/bin/gem build $pkgname.gemspec

  GEM_PATH="$EMBEDDED_DIR"/gems GEM_HOME="$GEM_PATH" \
  GEMRC="$EMBEDDED_DIR"/etc/gemrc CPPFLAGS="-I$EMBEDDED_DIR"/include \
  LDFLAGS="-L$EMBEDDED_DIR"/lib PATH="$EMBEDDED_DIR/bin:$PATH" \
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
