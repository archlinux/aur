# Maintainer: Mike Javorski
# Contributor: Sébastien "Seblu" Luttringer

pkgname=docker-bin
pkgver=1.13.1
pkgrel=1
pkgdesc='Pack, ship and run any application as a lightweight container, using official binaries'
arch=('x86_64')
url='https://www.docker.com/'
license=('Apache')
provides=('docker')
conflicts=('docker-git')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd' 'libseccomp')
makedepends=('go-md2man')
optdepends=('btrfs-progs: btrfs backend support'
            'lxc: lxc backend support')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
install=$pkgname.install
source=(
  "https://get.docker.com/builds/Linux/x86_64/docker-${pkgver}.tgz"
  "https://github.com/docker/docker/archive/v${pkgver}.tar.gz"
  "docker.sysusers")
md5sums=('4ab003318dfa837b01c8332dad3dfa9d'
         '032c39b2390a0f387cdb49bab8c4c712'
         '8cf9900ebada61f352a03465a088da34')

build() {
  cd docker-$pkgver
  # man pages
  man/md2man-all.sh 2>/dev/null
}

package() {
  cd docker
  install -Dm755 'docker' "$pkgdir/usr/bin/docker"
  install -Dm755 'dockerd' "$pkgdir/usr/bin/dockerd"
  install -Dm755 'docker-proxy' "$pkgdir/usr/bin/docker-proxy"
  install -Dm755 'docker-containerd' "$pkgdir/usr/bin/docker-containerd"
  install -Dm755 'docker-containerd-shim' "$pkgdir/usr/bin/docker-containerd-shim"
  install -Dm755 'docker-containerd-ctr' "$pkgdir/usr/bin/docker-containerd-ctr"
  install -Dm755 'docker-runc' "$pkgdir/usr/bin/docker-runc"
  install -Dm755 'docker-init' "$pkgdir/usr/bin/docker-init"
  # completion
  install -Dm644 'completion/bash/docker' "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 'completion/zsh/_docker' "$pkgdir/usr/share/zsh/site-functions/_docker"
  install -Dm644 'completion/fish/docker.fish' "$pkgdir/usr/share/fish/vendor_completions.d/docker.fish"

  cd ../docker-$pkgver
  # systemd
  install -Dm644 'contrib/init/systemd/docker.service' "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 'contrib/init/systemd/docker.socket' "$pkgdir/usr/lib/systemd/system/docker.socket"
  install -Dm644 "$srcdir/docker.sysusers" "$pkgdir/usr/lib/sysusers.d/docker.conf"
  install -Dm644 'contrib/udev/80-docker.rules' "$pkgdir/usr/lib/udev/rules.d/80-docker.rules"
  # vim syntax
  install -Dm644 'contrib/syntax/vim/syntax/dockerfile.vim' "$pkgdir/usr/share/vim/vimfiles/syntax/dockerfile.vim"
  install -Dm644 'contrib/syntax/vim/ftdetect/dockerfile.vim' "$pkgdir/usr/share/vim/vimfiles/ftdetect/dockerfile.vim"
  # man
  install -dm755 "$pkgdir/usr/share/man"
  mv man/man* "$pkgdir/usr/share/man"
}

# vim:set ts=2 sw=2 et:
