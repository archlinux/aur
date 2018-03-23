# Maintainer: Mike Javorski
# Contributor: Sébastien "Seblu" Luttringer

pkgname=docker-stable-bin
pkgver=18.03.0
pkgrel=1
pkgdesc='Pack, ship and run any application as a lightweight container, using official binaries'
arch=('x86_64')
url='https://www.docker.com/'
license=('Apache')
provides=('docker' 'docker-bin' 'docker-ce')
conflicts=('docker' 'docker-bin' 'docker-ce' 'docker-git')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd' 'libseccomp')
makedepends=('make' 'git' 'go')
optdepends=('btrfs-progs: btrfs backend support')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=(
  "https://download.docker.com/linux/static/stable/x86_64/docker-${pkgver}-ce.tgz"
  "https://github.com/docker/docker-ce/archive/v${pkgver}-ce.tar.gz"
  "docker.sysusers"
)
md5sums=('cd317cba1bdc886e3163445f8edc5cca'
         'e02c511acf83e4478dab64937e540a71'
         '9a8b2744db23b14ca3cd350fdf73c179')

build() {
  ### go magics
  export GOPATH="$srcdir"
  export PATH="$GOPATH/bin:$PATH"

  # mock go packages so we can generate the man pages
  mkdir -p src/github.com/docker
  ln -rsfT docker-ce-$pkgver-ce/components/cli src/github.com/docker/cli

  msg2 'Building man pages'
  pushd src/github.com/docker/cli >/dev/null
  make manpages 2>/dev/null
  popd >/dev/null
}

package() {
  cd docker
  # runc
  install -Dm755 'docker-runc' "$pkgdir/usr/bin/docker-runc"
  # docker-containerd
  install -Dm755 'docker-containerd' "$pkgdir/usr/bin/docker-containerd"
  install -Dm755 'docker-containerd-shim' "$pkgdir/usr/bin/docker-containerd-shim"
  install -Dm755 'docker-containerd-ctr' "$pkgdir/usr/bin/docker-containerd-ctr"
  # docker-proxy
  install -Dm755 'docker-proxy' "$pkgdir/usr/bin/docker-proxy"
  # docker-init
  install -Dm755 'docker-init' "$pkgdir/usr/bin/docker-init"
  # docker binary
  install -Dm755 'docker' "$pkgdir/usr/bin/docker"
  install -Dm755 'dockerd' "$pkgdir/usr/bin/dockerd"

  cd $srcdir/docker-ce-$pkgver-ce/components/cli
  # completion
  install -Dm644 'contrib/completion/bash/docker' "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 'contrib/completion/zsh/_docker' "$pkgdir/usr/share/zsh/site-functions/_docker"
  install -Dm644 'contrib/completion/fish/docker.fish' "$pkgdir/usr/share/fish/vendor_completions.d/docker.fish"

  # man
  install -dm755 "$pkgdir/usr/share/man"
  cp -r man/man* "$pkgdir/usr/share/man"

  cd $srcdir/docker-ce-$pkgver-ce/components/packaging
  # systemd
  install -Dm644 'deb/systemd/docker.service' "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 'deb/systemd/docker.socket' "$pkgdir/usr/lib/systemd/system/docker.socket"
  install -Dm644 "$srcdir/docker.sysusers" "$pkgdir/usr/lib/sysusers.d/docker.conf"

  cd $srcdir/docker-ce-$pkgver-ce/components/engine
  install -Dm644 'contrib/udev/80-docker.rules' "$pkgdir/usr/lib/udev/rules.d/80-docker.rules"
  # vim syntax
  install -Dm644 'contrib/syntax/vim/syntax/dockerfile.vim' "$pkgdir/usr/share/vim/vimfiles/syntax/dockerfile.vim"
  install -Dm644 'contrib/syntax/vim/ftdetect/dockerfile.vim' "$pkgdir/usr/share/vim/vimfiles/ftdetect/dockerfile.vim"

  warning "Docker CE 17.12 and later won't recognize containers started with previous Docker versions. If using Live Restore, you must stop all containers before upgrading to Docker CE 17.12. If you don't, any containers started by Docker versions that predate 17.12 won't be recognized by Docker after the upgrade and will keep running, un-managed, on the system."
}

# vim:set ts=2 sw=2 et:
