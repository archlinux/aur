# Maintainer: Mike Javorski
# Contributor: Sébastien "Seblu" Luttringer

pkgname=docker-bin
pkgver=19.03.12
pkgrel=1
pkgdesc='Pack, ship and run any application as a lightweight container, using official binaries'
arch=('x86_64')
url='https://www.docker.com/'
license=('Apache')
provides=('docker' 'docker-ce')
conflicts=('docker' 'docker-ce' 'docker-git')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd' 'libseccomp' 'runc' 'containerd')
makedepends=('make' 'git' 'go' 'go-md2man')
optdepends=('btrfs-progs: btrfs backend support'
            'pigz: parallel gzip compressor support')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=(
  "https://download.docker.com/linux/static/edge/x86_64/docker-${pkgver}.tgz"
  "https://github.com/docker/docker-ce/archive/v${pkgver}.tar.gz"
  "docker.sysusers"
)
md5sums=('c9ca48d9857c7170591e476a6c829007'
         'bcdaf190eaa49dd8a7d8cbdf9b2f1e4f'
         '9a8b2744db23b14ca3cd350fdf73c179')

build() {
  ### go magics
  export GOPATH="$srcdir"
  export PATH="$GOPATH/bin:$PATH"

  # mock go packages so we can generate the man pages
  mkdir -p src/github.com/docker
  ln -rsfT docker-ce-$pkgver/components/cli src/github.com/docker/cli

  msg2 'Building man pages'
  pushd src/github.com/docker/cli >/dev/null
  # disable go-md2man compilation/install as we will use the packaged version
  sed -i -e '/go install.*go-md2man/d' scripts/docs/generate-man.sh
  make manpages 2>/dev/null
  popd >/dev/null
}

package() {
  cd docker
  # docker-proxy
  install -Dm755 'docker-proxy' "$pkgdir/usr/bin/docker-proxy"
  # docker-init
  install -Dm755 'docker-init' "$pkgdir/usr/bin/docker-init"
  # docker binary
  install -Dm755 'docker' "$pkgdir/usr/bin/docker"
  install -Dm755 'dockerd' "$pkgdir/usr/bin/dockerd"

  cd $srcdir/docker-ce-$pkgver/components/cli
  # completion
  install -Dm644 'contrib/completion/bash/docker' "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 'contrib/completion/zsh/_docker' "$pkgdir/usr/share/zsh/site-functions/_docker"
  install -Dm644 'contrib/completion/fish/docker.fish' "$pkgdir/usr/share/fish/vendor_completions.d/docker.fish"

  # man
  install -dm755 "$pkgdir/usr/share/man"
  cp -r man/man* "$pkgdir/usr/share/man"

  cd $srcdir/docker-ce-$pkgver/components/packaging
  # systemd
  install -Dm644 'systemd/docker.socket' "$pkgdir/usr/lib/systemd/system/docker.socket"
  install -Dm644 'systemd/docker.service' "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 "$srcdir/docker.sysusers" "$pkgdir/usr/lib/sysusers.d/docker.conf"

  cd $srcdir/docker-ce-$pkgver/components/engine
  install -Dm644 'contrib/udev/80-docker.rules' "$pkgdir/usr/lib/udev/rules.d/80-docker.rules"

  # vim syntax
  install -Dm644 'contrib/syntax/vim/syntax/dockerfile.vim' "$pkgdir/usr/share/vim/vimfiles/syntax/dockerfile.vim"
  install -Dm644 'contrib/syntax/vim/ftdetect/dockerfile.vim' "$pkgdir/usr/share/vim/vimfiles/ftdetect/dockerfile.vim"

  # nano syntax
  install -Dm644 'contrib/syntax/nano/Dockerfile.nanorc' "$pkgdir/usr/share/nano/Dockerfile.nanorc"
}

# vim:set ts=2 sw=2 et:
