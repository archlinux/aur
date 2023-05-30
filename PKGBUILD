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
pkgver=2.3.6
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('x86_64')
url="https://vagrantup.com"
license=('MIT')
options=('!emptydirs')
depends=('curl' 'dnsmasq' 'libarchive' 'libssh2' 'libxml2' 'libxslt' 'rsync'
         'ruby' 'xz' 'perl')
makedepends=('git' 'go')
conflicts=('vagrant-substrate')
replaces=('vagrant-substrate')
source=($pkgname-$pkgver.tar.gz::https://github.com/hashicorp/$pkgname/archive/v$pkgver.tar.gz
        "git+https://github.com/hashicorp/vagrant-installers.git#commit=a5f6e03")
sha256sums=('3f9780b32d979e7cf4565a56fa6dc40b3c9b1b73e4cae9931b1d4a706d0d4d9e'
            'SKIP')

prepare() {
  cd vagrant-installers
  local _gemdir="$(gem env gemdir)"

  # Allow Vagrant to see the system gems as these have been de-vendored from the ruby package
  sed -i "s_embeddedDir, \"gems\")_embeddedDir, \"gems:$_gemdir\")_g" substrate/launcher/main.go
}

build() {
  (
    cd $pkgname-$pkgver
    gem build $pkgname.gemspec
  )

  (
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd vagrant-installers/substrate/launcher
    go build -o $pkgname -ldflags "-compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\"" .
  )
}

package() {
  cd $pkgname-$pkgver

  INSTALLERS_DIR="$srcdir"/vagrant-installers/substrate
  EMBEDDED_DIR="$pkgdir"/opt/vagrant/embedded

  install -d "$pkgdir"/usr/{bin,share/bash-completion/completions,share/zsh/site-functions}
  install -Dm644 "$INSTALLERS_DIR"/common/gemrc "$EMBEDDED_DIR"/etc/gemrc

  echo "{ \"vagrant_version\": \"$pkgver\" }" > "$EMBEDDED_DIR"/manifest.json

  gem install $pkgname-$pkgver.gem \
    --no-document --no-user-install --install-dir "$EMBEDDED_DIR"/gems

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
