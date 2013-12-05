# $Id$
# Maintainer: Ido Rosen <ido@kernel.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Marcel Wysocki <maci@satgnu.net>
#
# NOTE: To request changes to this package, please submit a pull request
#       to the GitHub repository at https://github.com/ido/packages-archlinux
#       Otherwise, open a GitHub issue.  Thank you! -Ido
#

pkgname=docker-git
pkgver=0.7.0.dev.4905.a8e99d9
pkgrel=1
epoch=1
pkgdesc='Pack, ship and run any application as a lightweight container'
arch=('x86_64' 'i686')
url="https://github.com/dotcloud/docker"
license=('Apache')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'lxc' 'sqlite' 'systemd')
makedepends=('git' 'go' 'device-mapper')
provides=('docker')
conflicts=('docker' 'lxc-docker')
replaces=('lxc-docker-git')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=("git+https://github.com/dotcloud/docker.git"
        'docker.service'
        'docker.install')
md5sums=('SKIP'
         '3f7ccab915fb1942f06e18946c2811d2'
         '1a8e60447794b3c4f87a2272cc9f144f')
install='docker.install'
# magic harcoded path
_magic=src/github.com/dotcloud

pkgver() {
  cd "${srcdir}/docker"
  _dockerver="$(cat VERSION)"
  printf "%s.%s.%s" "${_dockerver//-/.}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "$_magic"
  ln -sfn "../../../docker" "$_magic/docker"
}

build() {
  cd "$_magic/docker"
  export GOPATH="$srcdir:$srcdir/$_magic/docker/vendor"
  ./hack/make.sh dynbinary
}

check() {
  cd "$_magic/docker"
  # Will be added upstream soon
  #./hack/make.sh dyntest
}

package() {
  cd "$_magic/docker"
  _dockerver="$(cat VERSION)"
  install -Dm755 "bundles/$_dockerver/dynbinary/docker-$_dockerver" "$pkgdir/usr/bin/docker"
  install -Dm755 "bundles/$_dockerver/dynbinary/dockerinit-$_dockerver" "$pkgdir/usr/lib/docker/dockerinit"
  # completion
  install -Dm644 "contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 "contrib/completion/zsh/_docker" "$pkgdir/usr/share/zsh/site-functions/_docker"
  # systemd
  install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/system/docker.service"
}

# vim:set ts=2 sw=2 et:
