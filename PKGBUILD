# Maintainer: Hyacinthe Cartiaux <hyacinthe.cartiaux at free.fr>
# Contributor: Ian Watt <ian at ewatt.ca>
# Contributor: Jonathan Steel <jsteel at archlinux.org>

_pkgname=vagrant
pkgname=vagrant-git
pkgver=2.4.2.dev+000013.26a1ff10.69.g71150ee3d
pkgrel=1
pkgdesc="Build and distribute virtualized development environments"
arch=('x86_64')
url="https://vagrantup.com"
license=('BUSL-1.1')
options=('!emptydirs')
depends=('curl' 'libarchive' 'libssh2' 'libxml2' 'libxslt' 'rsync'
         'ruby' 'xz' 'perl')
makedepends=('git' 'go')
optdepends=('dnsmasq: if using libvirt')
provides=('vagrant')
conflicts=('vagrant-substrate' 'vagrant-substrate-git' 'vagrant')
source=(git+https://github.com/hashicorp/$_pkgname.git
        git+https://github.com/hashicorp/vagrant-installers.git)
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/-/./g;s/^v//'
}

prepare() {
  cd vagrant-installers
  local _gemdir="$(gem env gemdir)"

  # Allow Vagrant to see the system gems as these have been de-vendored from the ruby package
  sed -i "s_embeddedDir, \"gems\")_embeddedDir, \"gems:$_gemdir\")_g" substrate/launcher/main.go
}

build() {
  (
    cd $_pkgname
    gem build $_pkgname.gemspec
  )

  (
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd vagrant-installers/substrate/launcher
    go build -o $_pkgname -ldflags "-compressdwarf=false -linkmode external -extldflags \"${LDFLAGS}\"" .
  )
}

package() {
  cd $_pkgname

  VERSION="$(cat ${srcdir}/${_pkgname}/version.txt)"
  INSTALLERS_DIR="$srcdir"/vagrant-installers/substrate
  EMBEDDED_DIR="$pkgdir"/opt/vagrant/embedded

  install -d "$pkgdir"/usr/{bin,share/bash-completion/completions,share/zsh/site-functions}
  install -Dm644 "$INSTALLERS_DIR"/common/gemrc "$EMBEDDED_DIR"/etc/gemrc

  echo "{ \"vagrant_version\": \"$pkgver\" }" > "$EMBEDDED_DIR"/manifest.json

  gem install "${_pkgname}-${VERSION}.gem" \
    --no-document --no-user-install --install-dir "$EMBEDDED_DIR"/gems

  install -Dm755 "$INSTALLERS_DIR"/launcher/vagrant \
    "$pkgdir"/opt/$_pkgname/bin/$_pkgname

  ln -s /opt/$_pkgname/bin/$_pkgname "$pkgdir"/usr/bin/$_pkgname

  install -Dm644 contrib/bash/completion.sh \
    "$pkgdir"/usr/share/bash-completion/completions/$_pkgname

  install -Dm644 contrib/zsh/_vagrant \
    "$pkgdir"/usr/share/zsh/site-functions/_vagrant

  install -Dm644 contrib/vim/vagrantfile.vim \
    "$pkgdir"/usr/share/vim/vimfiles/ftdetect/vagrantfile.vim

  install -Dm644 LICENSE \
    "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  find "$pkgdir"/opt/vagrant/embedded/gems -name gem_make.out -delete
}
