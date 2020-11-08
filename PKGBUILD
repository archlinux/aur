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
pkgver=r39078.b5ea9abf25
pkgrel=1
epoch=1
pkgdesc='Pack, ship and run any application as a lightweight container.'
arch=('i686' 'x86_64')
url="https://github.com/docker/docker"
license=('Apache License Version 2.0')
depends=('bridge-utils' 'iproute2' 'sqlite' 'systemd')
optdepends=('vndr' 'device-mapper')
makedepends=('glibc' 'git' 'go' 'btrfs-progs' 'go-md2man' 'cmake' 'device-mapper')
provides=('docker')
conflicts=('docker' 'containerd' 'containerd-git' 'runc' 'runc-git')
replaces=('docker' 'containerd' 'containerd-git' 'runc' 'runc-git')
install='docker.install'
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=('moby::git+https://github.com/moby/moby.git'
        'docker-ce::git+https://github.com/docker/docker-ce'
        'containerd::git+https://github.com/containerd/containerd.git'
        'runc::git+https://github.com/opencontainers/runc.git'
        'libnetwork::git+https://github.com/docker/libnetwork.git'
        'tini::git+https://github.com/krallin/tini.git'
        'docker.install')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '1a8e60447794b3c4f87a2272cc9f144f')

pkgver() {
  pushd "$srcdir/moby" > /dev/null
    ( set -o pipefail;
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  popd > /dev/null
}

prepare() {
  export GOPATH="$srcdir/go"

  # prepare go src directories
  mkdir -p "$srcdir/go/src/github.com/docker"
  mkdir -p "$srcdir/go/src/github.com/moby"
  mkdir -p "$srcdir/go/src/github.com/containerd"
  mkdir -p "$srcdir/go/src/github.com/opencontainers"

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
  export GOPATH="$srcdir/go"

  # runc
  msg2 'building runc'
  ln -sf "$srcdir/runc" "$GOPATH/src/github.com/opencontainers/"
  pushd "$GOPATH/src/github.com/opencontainers/runc" >/dev/null
    : "${RUNC_BUILDTAGS:=seccomp apparmor selinux}"
    make BUILDTAGS="$RUNC_BUILDTAGS"
    msg2 'generating runc manpages'
    man/md2man-all.sh 2>/dev/null
  popd >/dev/null

  # containerd
  msg2 'building containerd'
  ln -sf "$srcdir/containerd" "$GOPATH/src/github.com/containerd/"
  pushd "$GOPATH/src/github.com/containerd/containerd" >/dev/null
    LDFLAGS= make
  popd >/dev/null

  # docker-proxy (from libnetwork)
  msg2 'building docker-proxy'
  ln -sf "$srcdir/libnetwork" "$GOPATH/src/github.com/docker/"
  pushd "$GOPATH/src/github.com/docker/libnetwork" >/dev/null
    : "${PROXY_LDFLAGS:=-linkmode=external}"
    go build -ldflags="$PROXY_LDFLAGS" -o ./bin/docker-proxy 'github.com/docker/libnetwork/cmd/proxy'
  popd >/dev/null

  # docker cli
  : "${DOCKERCLI_VERSION:=17.06.0-ce}"
  msg2 "building docker cli ($DOCKERCLI_VERSION)"
  ln -sf "$srcdir/docker-ce" "$GOPATH/src/github.com/docker/"
  pushd docker-ce >/dev/null
    git checkout -q "v$DOCKERCLI_VERSION"
    ln -sf "$srcdir/docker-ce/components/cli" "$GOPATH/src/github.com/docker/"
  popd >/dev/null
  pushd "$GOPATH/src/github.com/docker/cli" >/dev/null
    go build -o ./build/docker github.com/docker/cli/cmd/docker
    msg2 'generating cli manpages'
    man/md2man-all.sh 2>/dev/null
  popd >/dev/null

  # docker
  msg2 'building dockerd'
  pushd moby >/dev/null
    export AUTO_GOPATH=1
    ./hack/make.sh dynbinary
  popd >/dev/null

  # tini (docker-init)
  msg2 'building docker-init'
  pushd tini >/dev/null
    cmake .
    make tini-static
  popd >/dev/null
}

# TODO: complete tests for all
# check() {
#   cd runc
#   make test
# }

package() {
  export GOPATH="$srcdir/go"

  msg2 'runc binary'
  install -Dm755 "$GOPATH/src/github.com/opencontainers/runc/runc" "$pkgdir/usr/bin/runc"

  msg2 'containerd binaries'
  pushd "$GOPATH/src/github.com/containerd/containerd/bin" >/dev/null
    for file in $(find . -type f -print); do
      install -Dm755 "$file" "$pkgdir/usr/bin/$file"
    done
  popd >/dev/null

  msg2 'docker-proxy binary'
  install -Dm755 "$GOPATH/src/github.com/docker/libnetwork/bin/docker-proxy" "$pkgdir/usr/bin/docker-proxy"

  msg2 'dockerd binary'
  pushd "$srcdir/moby/bundles/dynbinary-daemon" >/dev/null
    install -Dm755 "dockerd-dev" "$pkgdir/usr/bin/dockerd"
  popd >/dev/null

  msg2 'docker cli binary'
  install -Dm755 "$GOPATH/src/github.com/docker/cli/build/docker" "$pkgdir/usr/bin/docker"

  msg2 'docker-init binary'
  install -Dm755 "$srcdir/tini/tini-static" "$pkgdir/usr/bin/docker-init"

  msg2 'additional softlinks'
  # symlink containerd/run (nice integration...)
  ln -s containerd "$pkgdir/usr/bin/docker-containerd"
  ln -s containerd-shim "$pkgdir/usr/bin/docker-containerd-shim"
  ln -s ctr "$pkgdir/usr/bin/docker-containerd-ctr"
  ln -s runc "$pkgdir/usr/bin/docker-runc"

  msg2 'completion files'
  pushd "$srcdir/docker-ce" >/dev/null
    install -Dm644 "components/cli/contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker"
    install -Dm644 "components/cli/contrib/completion/zsh/_docker" "$pkgdir/usr/share/zsh/site-functions/_docker"
    install -Dm644 "components/cli/contrib/completion/fish/docker.fish" "$pkgdir/usr/share/fish/completions/docker.fish"
  popd >/dev/null

  # systemd
  msg2 'systemd files'
  pushd "$srcdir/moby" >/dev/null
    install -Dm644 'contrib/init/systemd/docker.service' "$pkgdir/usr/lib/systemd/system/docker.service"
    install -Dm644 'contrib/init/systemd/docker.socket' "$pkgdir/usr/lib/systemd/system/docker.socket"
  popd >/dev/null
  install -Dm644 "$startdir/docker.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  msg2 'manpages'
  pushd "$srcdir/runc/man/man8" >/dev/null
    for i in *; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man8/$i"
    done
  popd >/dev/null
  pushd "$srcdir/docker-ce/components/cli/man/man1" >/dev/null
    for i in *; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man1/$i"
    done
  popd >/dev/null
  pushd "$srcdir/docker-ce/components/cli/man/man5" >/dev/null
    for i in *; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man5/$i"
    done
  popd >/dev/null
  pushd "$srcdir/docker-ce/components/cli/man/man8" >/dev/null
    for i in *; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man8/$i"
    done
  popd >/dev/null
}

# vim:set ts=2 sw=2 et:
