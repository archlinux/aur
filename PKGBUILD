# Maintainer: envolution
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Chris Fordham <chris [at] fordham-nagy [dot] [id] [dot] [au]> aka flaccid
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Marcel Wysocki <maci@satgnu.net>
# Contributor: Daniel YC Lin <dlin.tw@gmail>
# Contributor: Joerg <joerg@higgsboson.tk>
# Contributor: Vincent Aranega <vincent.aranega@gmail.com>

# Important upstream docs:
# https://github.com/docker/docker/blob/master/project/PACKAGERS.md

pkgname=docker-git
_pkgname=docker
pkgver=27.4.1+r50904+g35cfb6fb7
pkgrel=1
pkgdesc='Pack, ship and run any application as a lightweight container -git latest'
arch=('x86_64' 'aarch64')
url='https://www.docker.com/'
license=('Apache-2.0')
provides=(docker)
conflicts=(docker)
depends=('glibc' 'bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd-libs'
  'libseccomp' 'libtool' 'runc' 'containerd')
makedepends=('git' 'go' 'btrfs-progs' 'cmake' 'systemd' 'go-md2man' 'sed')
optdepends=('btrfs-progs: btrfs backend support'
  'pigz: parallel gzip compressor support'
  'docker-buildx: extended build capabilities')
options=(!lto)
_TINI_COMMIT=de40ad007797e0dcd8b7126f27bb87401d224240
source=("git+https://github.com/docker/cli.git"
  "git+https://github.com/moby/moby.git"
  "git+https://github.com/krallin/tini.git"
  "${_pkgname}.sysusers")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '541826011a9836d05a2f42293d5f1beadf2ca8d89fb604487d61a013505678eb')

pkgver() {
  cd "moby"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

# create a fake go path directory and pushd into it
# $1 real directory
# $2 gopath directory
_fake_gopath_pushd() {
  mkdir -p "$GOPATH/src/${2%/*}"
  rm -f "$GOPATH/src/$2"
  ln -rsT "$1" "$GOPATH/src/$2"
  pushd "$GOPATH/src/$2" >/dev/null
}

_fake_gopath_popd() {
  popd >/dev/null
}

build() {
  ### check my mistakes on commit version
  echo 'Checking commit mismatch'
  (
    local _cfile
    for _cfile in tini; do
      . "moby/hack/dockerfile/install/$_cfile.installer"
    done
    local _commit _pkgbuild _dockerfile
    err=0
    # FIXME: Do not check TINI anymore, use tag instead of commit
    # TODO: libnetwork is removed
    # for _commit in LIBNETWORK; do
    #   _pkgbuild=_${_commit}_COMMIT
    #   _dockerfile=${_commit}_COMMIT
    #   if [[ ${!_pkgbuild} != ${!_dockerfile} ]]; then
    #     echo "Invalid $_commit commit, should be ${!_dockerfile}" >&2
    #     err=$(($err + 1))
    #   fi
    # done
    return $err
  )

  ### globals
  export GOPATH="$srcdir"
  export PATH="$GOPATH/bin:$PATH"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export LDFLAGS=''
  export GOFLAGS='-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external -ldflags=-compressdwarf=false -ldflags=-B=gobuildid'
  export GO111MODULE=off
  export DISABLE_WARN_OUTSIDE_CONTAINER=1

  ### cli
  echo 'Building cli'
  _fake_gopath_pushd cli github.com/docker/cli
  make VERSION=$pkgver dynbinary
  make manpages
  _fake_gopath_popd

  ### daemon
  echo 'Building daemon'
  _fake_gopath_pushd moby github.com/docker/docker
  DOCKER_GITCOMMIT=$(cd "$srcdir"/moby && git rev-parse --short HEAD) \
  DOCKER_BUILDTAGS='seccomp journald apparmor' \
  VERSION=$pkgver \
    hack/make.sh dynbinary
  _fake_gopath_popd

  ### docker-init
  echo 'Building docker-init'
  _fake_gopath_pushd tini github.com/krallin/tini
  cmake .
  # we must use the static binary because it's started in a foreign os
  make tini-static
  _fake_gopath_popd
}

package() {
  ### init
  install -Dm755 tini/tini-static "$pkgdir/usr/bin/docker-init"
  ### dockerd
  install -Dm755 moby/bundles/dynbinary-daemon/dockerd "$pkgdir"/usr/bin/dockerd
  install -Dm755 moby/bundles/dynbinary-daemon/docker-proxy "$pkgdir/usr/bin/docker-proxy"
  ### systemd units
  cd "$srcdir"/moby/contrib
  install -Dm644 'init/systemd/docker.service' "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 'init/systemd/docker.socket' "$pkgdir/usr/lib/systemd/system/docker.socket"
  # systemd rules
  install -Dm644 'udev/80-docker.rules' "$pkgdir/usr/lib/udev/rules.d/80-docker.rules"
  install -Dm644 "$srcdir/${_pkgname}.sysusers" "$pkgdir/usr/lib/sysusers.d/${_pkgname}.conf"
  ### cli
  cd "$srcdir"/cli
  # binary
  install -Dm755 build/docker "$pkgdir/usr/bin/docker"
  # completion (see FS#79067)
  install -Dm644 <(build/docker completion bash) "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 <(build/docker completion zsh) "$pkgdir/usr/share/zsh/site-functions/_docker"
  install -Dm644 <(build/docker completion fish) "$pkgdir/usr/share/fish/vendor_completions.d/docker.fish"
  # man
  install -dm755 "$pkgdir/usr/share/man"
  cp -r man/man* "$pkgdir/usr/share/man"
}

# vim:set ts=2 sw=2 et:
