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
pkgver=2.3.2
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('x86_64')
url="https://vagrantup.com"
license=('MIT')
options=('!emptydirs')
depends=('curl' 'libarchive' 'libssh2' 'libxml2' 'libxslt' 'rsync'
         'ruby' 'xz' 'perl')
makedepends=('git' 'go')
conflicts=('vagrant-substrate')
replaces=('vagrant-substrate')
source=($pkgname-$pkgver.tar.gz::https://github.com/mitchellh/$pkgname/archive/v$pkgver.tar.gz
        "git+https://github.com/mitchellh/vagrant-installers.git#commit=9ef6148")
md5sums=('dbc1b9385657d37028be2ffbbb298793'
         'SKIP')

prepare() {
  cd vagrant-installers
  local _gemdir="$(gem env gemdir)"

  # Allow Vagrant to see the system gems as these have been de-vendored from the ruby package
  sed -i "s_\"gems\", vagrantVersion)_\"gems\", vagrantVersion, \":$_gemdir\")_g" substrate/launcher/main.go
}

build() {
  cd $pkgname-$pkgver
  gem build $pkgname.gemspec

  export GO111MODULE=off # golang 1.16 uses modules by default and packages below fail to compile
  cd "$srcdir"/vagrant-installers/substrate/launcher
  go get github.com/mitchellh/osext

  go build \
    -trimpath \
    -buildmode=pie \
    -ldflags "-extldflags \"${LDFLAGS}\"" \
    -o vagrant
}

package() {
  cd $pkgname-$pkgver

  INSTALLERS_DIR="$srcdir"/vagrant-installers/substrate
  EMBEDDED_DIR="$pkgdir"/opt/vagrant/embedded

  install -d "$pkgdir"/usr/{bin,share/bash-completion/completions,share/zsh/site-functions}
  install -Dm644 "$INSTALLERS_DIR"/common/gemrc "$EMBEDDED_DIR"/etc/gemrc

  echo "{ \"vagrant_version\": \"$pkgver\" }" > "$EMBEDDED_DIR"/manifest.json

  gem install $pkgname-$pkgver.gem \
    --no-document --no-user-install --install-dir "$EMBEDDED_DIR"/gems/$pkgver

  install -Dm755 "$INSTALLERS_DIR"/launcher/vagrant \
    "$pkgdir"/opt/$pkgname/bin/$pkgname

  ln -s /opt/$pkgname/bin/$pkgname "$pkgdir"/usr/bin/$pkgname

  install -Dm644 contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$pkgname

  install -Dm644 contrib/zsh/_vagrant \
    "$pkgdir"/usr/share/zsh/site-functions/_vagrant

  install -Dm644 contrib/vim/vagrantfile.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/vagrantfile.vim

  install -Dm644 LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  find "$pkgdir"/opt/vagrant/embedded/gems -name gem_make.out -delete
}
