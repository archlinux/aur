# $Id$

# Maintainer: Chris Fordham <chris [at] fordham-nagy [dot] [id] [dot] [au]> aka flaccid
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Marcel Wysocki <maci@satgnu.net>
# Contributor: Daniel YC Lin <dlin.tw@gmail>
# Contributor: Joerg <joerg@higgsboson.tk>
# Contributor: Vincent Aranega <vincent.aranega@gmail.com>

# Important upstream docs:
# https://github.com/docker/docker/blob/master/project/PACKAGERS.md

pkgname=docker-git
_pkgname=docker
pkgver=17.06.0.dev.32959.7117d5ef25
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
source=('moby::git+https://github.com/moby/moby.git'
        'cli::git+https://github.com/docker/cli.git'
        'containerd::git+https://github.com/containerd/containerd.git'
        'runc::git+https://github.com/docker/runc.git'
        'libnetwork::git+https://github.com/docker/libnetwork.git'
        'docker.install')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '1a8e60447794b3c4f87a2272cc9f144f')

pkgver() {
  pushd "$srcdir/moby" > /dev/null
    _dockerver="$(cat VERSION)"
    printf "%s.%s.%s" "${_dockerver//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  popd > /dev/null
}

prepare() {
  mkdir -p "$srcdir/go/src/github.com/docker"
  mkdir -p "$srcdir/go/src/github.com/moby"
  mkdir -p "$srcdir/go/src/github.com/containerd"
  mkdir -p "$srcdir/go/src/github.com/opencontainers"
  export GOPATH="$srcdir/go"

  # update specific commits used
  # https://github.com/docker/docker/blob/master/hack/dockerfile/binaries-commits
  . "$srcdir/moby/hack/dockerfile/binaries-commits"
  pushd "$srcdir/runc" >/dev/null
    git checkout -q "$RUNC_COMMIT"
  popd
  pushd "$srcdir/containerd" >/dev/null
    git checkout -q "$CONTAINERD_COMMIT"
  popd
  pushd "$srcdir/libnetwork" >/dev/null
    git checkout -q "$LIBNETWORK_COMMIT"
  popd
  pushd "$srcdir/cli" >/dev/null
    git checkout -q "$DOCKERCLI_COMMIT"
  popd

  # apply any patches for runc
  pushd "$srcdir/runc" >/dev/null
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
  msg 'building runc'
  ln -sf "$srcdir/runc" "$GOPATH/src/github.com/opencontainers/"
  pushd "$GOPATH/src/github.com/opencontainers/runc" >/dev/null
    make BUILDTAGS=""
    man/md2man-all.sh 2>/dev/null
  popd

  # containerd
  msg 'building containerd'
  ln -sf "$srcdir/containerd" "$GOPATH/src/github.com/containerd/"
  pushd "$GOPATH/src/github.com/containerd/containerd" >/dev/null
    LDFLAGS= make
  popd

  # docker-proxy (from libnetwork)
  msg 'building docker-proxy'
  ln -sf "$srcdir/libnetwork" "$GOPATH/src/github.com/docker/"
  pushd "$GOPATH/src/github.com/docker/libnetwork" >/dev/null
    go build -ldflags="$PROXY_LDFLAGS" -o ./bin/docker-proxy 'github.com/docker/libnetwork/cmd/proxy'
  popd

  # docker cli
  msg 'building docker cli'
  ln -sf "$srcdir/cli" "$GOPATH/src/github.com/docker/"
  pushd cli >/dev/null
    LDFLAGS= make dynbinary
    # cherry-picked commit does not yet have manpages!
    git checkout master
    man/md2man-all.sh 2>/dev/null
  popd

  # docker
  msg 'building dockerd'
  pushd moby >/dev/null
    export AUTO_GOPATH=1
    ./hack/make.sh dynbinary
  popd
}

# TODO: complete tests for all
# check() {
#   cd runc
#   make test
# }

package() {
  msg 'runc binary'
  install -Dm755 "$GOPATH/src/github.com/opencontainers/runc/runc" "$pkgdir/usr/bin/runc"
  msg 'runc manpages'
  pushd "$srcdir/runc/man/man8" >/dev/null
    for i in *; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man8/$i"
    done
  popd

  msg 'containerd binaries'
  pushd "$GOPATH/src/github.com/containerd/containerd/bin" >/dev/null
    for file in $(find . -type f -print); do
      install -Dm755 "$file" "$pkgdir/usr/bin/$file"
    done
  popd

  msg 'docker-proxy binary'
  # (from libnetwork)
  install -Dm755 "$GOPATH/src/github.com/docker/libnetwork/bin/docker-proxy" "$pkgdir/usr/bin/docker-proxy"

  # dockerd
  pushd 'moby' >/dev/null
    _dockerver="$(cat VERSION)"
    install -Dm755 "bundles/$_dockerver/dynbinary-daemon/dockerd-$_dockerver" "$pkgdir/usr/bin/dockerd"
  popd

  msg 'docker cli binary'
  install -Dm755 "$GOPATH/src/github.com/docker/cli/build/docker" "$pkgdir/usr/bin/docker"
  msg 'docker cli manpages'
  pushd "$srcdir/cli/man/man1" >/dev/null
    for i in *; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man8/$i"
    done
  popd
  pushd "$srcdir/cli/man/man5" >/dev/null
    for i in *; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man8/$i"
    done
  popd
  pushd "$srcdir/cli/man/man8" >/dev/null
    for i in *; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man8/$i"
    done
  popd

  msg 'additional softlinks'
  # symlink containerd/run (nice integration...)
  ln -s containerd "$pkgdir/usr/bin/docker-containerd"
  ln -s containerd-shim "$pkgdir/usr/bin/docker-containerd-shim"
  ln -s ctr "$pkgdir/usr/bin/docker-containerd-ctr"
  ln -s runc "$pkgdir/usr/bin/docker-runc"

  msg 'completion files'
  # (from docker/cli master as the pinned commit does not yet have them)
  pushd "$srcdir/cli" >/dev/null
    git checkout master
    install -Dm644 "contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker"
    install -Dm644 "contrib/completion/zsh/_docker" "$pkgdir/usr/share/zsh/site-functions/_docker"
  popd

  # systemd
  msg 'systemd files'
  pushd "$srcdir/moby" >/dev/null
    install -Dm644 'contrib/init/systemd/docker.service' "$pkgdir/usr/lib/systemd/system/docker.service"
    install -Dm644 'contrib/init/systemd/docker.socket' "$pkgdir/usr/lib/systemd/system/docker.socket"
  popd
  install -Dm644 "$startdir/docker.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
}

# vim:set ts=2 sw=2 et:
