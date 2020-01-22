# Maintainer: Ian Watt <ian at ewatt.ca>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

_pkgname=vagrant
pkgname=vagrant-git
pkgver=2.2.6.203.ga1abc177b
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('i686' 'x86_64')
url="https://vagrantup.com"
license=('MIT')
options=('!emptydirs')
depends=('curl' 'libarchive' 'libssh2' 'libxml2' 'libxslt' 'rsync'
         'ruby' 'xz')
makedepends=('git' 'go')
provides=('vagrant')
conflicts=('vagrant' 'vagrant-substrate' 'vagrant-substrate-git')
replaces=('vagrant-substrate' 'vagrant-substrate-git')
source=(git://github.com/hashicorp/$_pkgname.git
        git://github.com/hashicorp/vagrant-installers.git)
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/-/./g;s/^v//'
}

build() {
  cd $_pkgname

  INSTALLERS_DIR="$srcdir"/vagrant-installers/substrate

  gem build $_pkgname.gemspec

  cp vagrant-*.gem vagrant.gem

  cd "$INSTALLERS_DIR"/launcher
  go get github.com/mitchellh/osext
  go build -o vagrant
}

package() {
  cd $_pkgname

  INSTALLERS_DIR="$srcdir"/vagrant-installers/substrate
  EMBEDDED_DIR="$pkgdir"/opt/vagrant/embedded

  install -d "$pkgdir"/usr/{bin,share/bash-completion/completions}

  install -Dm644 "$INSTALLERS_DIR"/common/gemrc \
    "$EMBEDDED_DIR"/etc/gemrc

  cp -r "$INSTALLERS_DIR"/common/rgloader "$EMBEDDED_DIR"

  GEM_PATH="$EMBEDDED_DIR"/gems GEM_HOME="$GEM_PATH" \
  GEMRC="$EMBEDDED_DIR"/etc/gemrc \
    gem install $_pkgname.gem --no-document

  install -Dm755 "$INSTALLERS_DIR"/launcher/vagrant \
    "$pkgdir"/opt/$_pkgname/bin/$_pkgname

  ln -s /opt/$_pkgname/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname

  install -Dm644 contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$_pkgname

  install -Dm644 LICENSE \
    "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE
}
