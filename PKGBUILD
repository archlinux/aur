# $Id: bfc54885f6617a81b35939f12f0a9f02199bb6d8 $
# Maintainer: Ido Rosen <ido@kernel.org>
# Co-maintainer: Chris Fordham <chris [at] fordham-nagy [dot] [id] [dot] [au]> aka flaccid
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Marcel Wysocki <maci@satgnu.net>
# Contributor: Daniel YC Lin <dlin.tw@gmail>
# Contributor: Joerg <joerg@higgsboson.tk>
# Contributor: Vincent Aranega <vincent.aranega@gmail.com>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

# Important upstream docs:
# https://github.com/docker/docker/blob/master/project/PACKAGERS.md

pkgname=docker-git
_pkgname=docker
pkgver=1.14.0.dev.30820.40dbbd3f9b
pkgrel=1
epoch=1
pkgdesc='Pack, ship and run any application as a lightweight container.'
arch=('i686' 'x86_64')
url="https://github.com/docker/docker"
license=('Apache License Version 2.0')
depends=('runc-git' 'containerd-git' 'bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd')
makedepends=('git' 'go' 'btrfs-progs' 'go-md2man')
provides=('docker')
conflicts=('docker')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=("git+https://github.com/docker/docker.git"
        'docker.install'
        )
md5sums=('SKIP'
         '1a8e60447794b3c4f87a2272cc9f144f'
        )
install='docker.install'
# magic harcoded path
#_magic=src/github.com/dotcloud

pkgver() {
  cd "${srcdir}/docker"
  _dockerver="$(cat VERSION)"
  printf "%s.%s.%s" "${_dockerver//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  #mkdir -p "$_magic"
  #ln -sfn "../../../docker" "$_magic/docker"
  #cd "$_magic/docker"
  cd docker
}

build() {
  #cd "$_magic/docker"
  #export GOPATH="$srcdir:$srcdir/$_magic/docker/vendor"
  cd docker
  export AUTO_GOPATH=1
  ./hack/make.sh dynbinary
  for i in man/*.md; do
    go-md2man -in "$i" -out "${i%.md}"
  done
}

#check() {
  #cd "$_magic/docker"
  # Will be added upstream soon
  #./hack/make.sh dyntest
#}

package() {
  #cd "$_magic/docker"
  cd docker
  _dockerver="$(cat VERSION)"
  install -Dm755 "bundles/$_dockerver/dynbinary-client/docker-$_dockerver" "$pkgdir/usr/bin/docker"
  install -Dm755 "bundles/$_dockerver/dynbinary-daemon/dockerd-$_dockerver" "$pkgdir/usr/bin/dockerd"

  # symlink containerd/run (nice integration...)
  ln -s containerd "$pkgdir/usr/bin/docker-containerd"
  ln -s containerd-shim "$pkgdir/usr/bin/docker-containerd-shim"
  ln -s ctr "$pkgdir/usr/bin/docker-containerd-ctr"
  ln -s runc "$pkgdir/usr/bin/docker-runc"

  # completion
  install -Dm644 "contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 "contrib/completion/zsh/_docker" "$pkgdir/usr/share/zsh/site-functions/_docker"

  # systemd
  install -Dm644 'contrib/init/systemd/docker.service' "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 'contrib/init/systemd/docker.socket' "$pkgdir/usr/lib/systemd/system/docker.socket"
  install -Dm644 "$startdir/docker.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd man
  for section in 1 5; do
    for i in *.$section; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man$section/$i"
    done
  done
}

# vim:set ts=2 sw=2 et:
