# $Id$

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
pkgver=17.04.0.dev.31005.cf449cf69c
pkgrel=1
epoch=1
pkgdesc='Pack, ship and run any application as a lightweight container.'
arch=('i686' 'x86_64')
url="https://github.com/docker/docker"
license=('Apache License Version 2.0')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd')
makedepends=('glibc' 'git' 'go' 'btrfs-progs' 'go-md2man')
provides=('docker')
conflicts=('docker' 'containerd' 'containerd-git' 'runc' 'runc-git')
replaces=('docker' 'containerd' 'containerd-git' 'runc' 'runc-git')
install='docker.install'
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=('docker::git+https://github.com/docker/docker.git'
        'containerd::git+https://github.com/docker/containerd.git#commit=78fb8f45890a601e0fd9051cf9f9f74923e950fd'
        'runc::git+https://github.com/docker/runc.git#commit=51371867a01c467f08af739783b8beafc154c4d7'
        'docker.install')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '1a8e60447794b3c4f87a2272cc9f144f')

pkgver() {
  cd "${srcdir}/docker"
  _dockerver="$(cat VERSION)"
  printf "%s.%s.%s" "${_dockerver//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "$srcdir/go/src/github.com/docker"
  export GOPATH="$srcdir/go"

  # update specific commits used
  # https://github.com/docker/docker/blob/master/hack/dockerfile/binaries-commits
  . "$srcdir/docker/hack/dockerfile/binaries-commits"
  pushd "$srcdir/runc"
    git checkout -q "$RUNC_COMMIT"
  popd
  pushd "$srcdir/containerd"
    git checkout -q "$CONTAINERD_COMMIT"
  popd

  # apply any patches for runc
  pushd "$srcdir/runc"
    # apply patch from the source array (should be a pacman feature)
    local filename
    for filename in "${source[@]}"; do
      if [[ "$filename" =~ \.patch$ ]]; then
        msg2 "Applying patch ${filename##*/}"
        patch -p1 -N -i "$srcdir/${filename##*/}"
      fi
    done
    :
  popd
}

build() {
  # runc
  ln -svf "$srcdir/runc" "$GOPATH/src/github.com/docker/"
  pushd "$GOPATH/src/github.com/docker/runc"
    make BUILDTAGS=""
    man/md2man-all.sh 2>/dev/null
  popd

  # containerd
  ln -svf "$srcdir/containerd" "$GOPATH/src/github.com/docker/"
  pushd "$GOPATH/src/github.com/docker/containerd"
    LDFLAGS= make
  popd

  # docker
  pushd docker
    export AUTO_GOPATH=1
    ./hack/make.sh dynbinary
    for i in man/*.md; do
      go-md2man -in "$i" -out "${i%.md}"
    done
  popd
}

# TODO: complete tests for all
# check() {
#   cd runc
#   make test
# }

package() {
  # runc binary and man pages
  pushd "$GOPATH/src/github.com/docker/runc"
    install -Dm755 runc "$pkgdir/usr/bin/runc"
    install -dm755 "$pkgdir/usr/share/man"
    mv man/man*/ "$pkgdir/usr/share/man"
  popd

  # containerd binaries
  pushd "$GOPATH/src/github.com/docker/containerd/bin"
    for file in $(find . -type f -print); do
      install -Dm755 "$file" "$pkgdir/usr/bin/$file"
    done
  popd

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
