# Maintainer: Mike Javorski
# Contributor: Sébastien "Seblu" Luttringer

pkgname=docker-bin
pkgver=20.10.8

# must use commit sha as currently not tagged with 20.10+ versions
_packaging_version=1c1cb918d8cf84f321bab7cb9739c221fe4f3ed7

pkgrel=1
pkgdesc='Pack, ship and run any application as a lightweight container, using official binaries'
arch=('x86_64')
url='https://www.docker.com/'
license=('Apache')
provides=('docker' 'docker-ce')
conflicts=('docker' 'docker-ce' 'docker-git')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd' 'libseccomp' 'runc' 'containerd')
optdepends=('btrfs-progs: btrfs backend support'
            'pigz: parallel gzip compressor support')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=(
  "https://download.docker.com/linux/static/stable/x86_64/docker-${pkgver}.tgz"
  "https://download.docker.com/linux/static/stable/x86_64/docker-rootless-extras-${pkgver}.tgz"
  "https://download.docker.com/linux/debian/dists/buster/pool/stable/amd64/docker-ce-cli_${pkgver}~3-0~debian-buster_amd64.deb"
  "https://raw.githubusercontent.com/docker/docker-ce-packaging/${_packaging_version}/systemd/docker.socket"
  "https://raw.githubusercontent.com/docker/docker-ce-packaging/${_packaging_version}/systemd/docker.service"
  "https://raw.githubusercontent.com/moby/moby/v${pkgver}/contrib/syntax/nano/Dockerfile.nanorc"
  "https://raw.githubusercontent.com/moby/moby/v${pkgver}/contrib/udev/80-docker.rules"
  "docker.sysusers"
)
sha256sums=('7ea11ecb100fdc085dbfd9ab1ff380e7f99733c890ed815510a5952e5d6dd7e0'
            '3d6ea2a389f47b173161a6a7e788cee14fee5d0ce7f4d16477f63ed4e5ab04ef'
            'f9c60f454909346e405562b8acc3456bf1e3f7a6f3e3a1d26a4addb159b5b970'
            'caf98bf39fb8621fb955476567a38b8a6b35bab2dccd8a29a16da23d4bb99450'
            'ed2ebb93d4bb3a30b5ad214d2ea5d467e714928d4fbf077e2a77dce758c0fa60'
            '3b1bd816a4a029ac048be7703a72a69ff44c531ead443d573e04f29d812594f1'
            '863aa0504a0ce84641e95ea29fae80c14c5a64c62b336149c3b7c5795b90a157'
            'a7a4b52000ed38ead62665eec9ed2366a4f763d61977ebd5414b041ff1c3d415')

prepare() {
  mkdir cli
  msg2 'Extracting CLI package'
  bsdtar -xf data.tar.xz -C cli/
}

package() {
  cd $srcdir/docker
  # docker-proxy
  install -Dm755 'docker-proxy' "$pkgdir/usr/bin/docker-proxy"
  # docker-init
  install -Dm755 'docker-init' "$pkgdir/usr/bin/docker-init"
  # docker binary
  install -Dm755 'docker' "$pkgdir/usr/bin/docker"
  install -Dm755 'dockerd' "$pkgdir/usr/bin/dockerd"

  cd $srcdir/docker-rootless-extras
  # rootless docker support
  install -Dm755 'dockerd-rootless-setuptool.sh' "$pkgdir/usr/bin/dockerd-rootless-setuptool.sh"
  install -Dm755 'dockerd-rootless.sh' "$pkgdir/usr/bin/dockerd-rootless.sh"
  install -Dm755 'rootlesskit' "$pkgdir/usr/bin/rootlesskit"
  install -Dm755 'rootlesskit-docker-proxy' "$pkgdir/usr/bin/rootlesskit-docker-proxy"

  cd $srcdir/cli/usr/share
  # completions
  install -Dm644 'bash-completion/completions/docker' "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 'zsh/vendor-completions/_docker' "$pkgdir/usr/share/zsh/site-functions/_docker"
  install -Dm644 'fish/vendor_completions.d/docker.fish' "$pkgdir/usr/share/fish/vendor_completions.d/docker.fish"

  # man
  install -dm755 "$pkgdir/usr/share/man"
  cp -r man/man* "$pkgdir/usr/share/man"

  cd $srcdir/
  # systemd
  install -Dm644 "docker.socket" "$pkgdir/usr/lib/systemd/system/docker.socket"
  install -Dm644 "docker.service" "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 "docker.sysusers" "$pkgdir/usr/lib/sysusers.d/docker.conf"

  # udev rules to hide docker's loopback devices from udisks, and thus from user desktops
  install -Dm644 '80-docker.rules' "$pkgdir/usr/lib/udev/rules.d/80-docker.rules"

  # nano syntax
  install -Dm644 'Dockerfile.nanorc' "$pkgdir/usr/share/nano/Dockerfile.nanorc"
}
# vim:set ts=2 sw=2 et:
