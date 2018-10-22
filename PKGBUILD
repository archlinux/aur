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
pkgver=2.2.0
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('x86_64')
url="https://vagrantup.com"
license=('MIT')
options=('!emptydirs')
depends=('curl' 'libarchive' 'libssh2' 'libxml2' 'libxslt' 'rsync'
         'ruby' 'xz')
makedepends=('git' 'go-pie')
conflicts=('vagrant-substrate')
replaces=('vagrant-substrate')
source=($pkgname-$pkgver.tar.gz::https://github.com/mitchellh/$pkgname/archive/v$pkgver.tar.gz
        "git+https://github.com/mitchellh/vagrant-installers.git#commit=7b7fb86")
md5sums=('d9a44a486e6de1d4e8cd4cb89ff84657'
         'SKIP')

build() {
  cd $pkgname-$pkgver

  INSTALLERS_DIR="$srcdir"/vagrant-installers/substrate/modules

  gem build $pkgname.gemspec

  cd "$INSTALLERS_DIR"/vagrant_substrate/files/launcher
  go get github.com/mitchellh/osext
  go build -o vagrant
}

package() {
  cd $pkgname-$pkgver

  INSTALLERS_DIR="$srcdir"/vagrant-installers/substrate/modules
  EMBEDDED_DIR="$pkgdir"/opt/vagrant/embedded

  install -d "$pkgdir"/usr/{bin,share/bash-completion/completions}

  install -Dm644 "$INSTALLERS_DIR"/vagrant_substrate/templates/gemrc.erb \
    "$EMBEDDED_DIR"/etc/gemrc

  cp -r "$INSTALLERS_DIR"/rubyencoder/files/rgloader "$EMBEDDED_DIR"

  GEM_PATH="$EMBEDDED_DIR"/gems GEM_HOME="$GEM_PATH" \
  GEMRC="$EMBEDDED_DIR"/etc/gemrc \
    gem install $pkgname-$pkgver.gem --no-ri --no-rdoc

  install -Dm755 "$INSTALLERS_DIR"/vagrant_substrate/files/launcher/vagrant \
    "$pkgdir"/opt/$pkgname/bin/$pkgname

  ln -s /opt/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -Dm644 contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$pkgname

  install -Dm644 LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
