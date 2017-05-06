# Maintainer: Mike Javorski
# Contributor: Sébastien "Seblu" Luttringer

pkgname=docker-bin
pkgver=17.05.0
pkgrel=1
pkgdesc='Pack, ship and run any application as a lightweight container, using official binaries'
arch=('x86_64')
url='https://www.docker.com/'
license=('Apache')
provides=('docker' 'docker-ce')
conflicts=('docker' 'docker-ce' 'docker-git')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd' 'libseccomp')
makedepends=('git' 'go' 'go-md2man')
optdepends=('btrfs-progs: btrfs backend support'
            'lxc: lxc backend support')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=(
  "https://get.docker.com/builds/Linux/x86_64/docker-${pkgver}-ce.tgz"
  "https://github.com/moby/moby/archive/v${pkgver}-ce.tar.gz"
  "git+https://github.com/spf13/cobra.git"
  "git+https://github.com/cpuguy83/go-md2man.git"
  "docker.sysusers"
)
md5sums=('1058a7eb3f05833475fcc29fc4b11011'
         '98db409f71d8b1531f94a1cf95f676e0'
         'SKIP'
         'SKIP'
         '9a8b2744db23b14ca3cd350fdf73c179')

build() {
  ### go magics
  export GOPATH="$srcdir"
  export PATH="$GOPATH/bin:$PATH"

  # mock go packages so we can generate the man pages
  mkdir -p src/github.com/docker
  ln -rsfT moby-$pkgver-ce src/github.com/docker/docker
  mkdir -p src/github.com/cpuguy83
  ln -rsf go-md2man src/github.com/cpuguy83
  mkdir -p src/github.com/spf13
  ln -rsf cobra src/github.com/spf13

  msg2 'Building man pages'
  pushd src/github.com/docker/docker >/dev/null
  man/generate.sh 2>/dev/null
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
  # completion
  install -Dm644 'completion/bash/docker' "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 'completion/zsh/_docker' "$pkgdir/usr/share/zsh/site-functions/_docker"
  install -Dm644 'completion/fish/docker.fish' "$pkgdir/usr/share/fish/vendor_completions.d/docker.fish"

  cd ../moby-$pkgver-ce
  # systemd
  install -Dm644 'contrib/init/systemd/docker.service' "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 'contrib/init/systemd/docker.socket' "$pkgdir/usr/lib/systemd/system/docker.socket"
  install -Dm644 'contrib/udev/80-docker.rules' "$pkgdir/usr/lib/udev/rules.d/80-docker.rules"
  install -Dm644 "$srcdir/docker.sysusers" "$pkgdir/usr/lib/sysusers.d/docker.conf"
  # vim syntax
  install -Dm644 'contrib/syntax/vim/syntax/dockerfile.vim' "$pkgdir/usr/share/vim/vimfiles/syntax/dockerfile.vim"
  install -Dm644 'contrib/syntax/vim/ftdetect/dockerfile.vim' "$pkgdir/usr/share/vim/vimfiles/ftdetect/dockerfile.vim"
  # man
  install -dm755 "$pkgdir/usr/share/man"
  cp -r man/man* "$pkgdir/usr/share/man"
}

# vim:set ts=2 sw=2 et:
