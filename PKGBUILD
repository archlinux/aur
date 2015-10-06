# $Id: bfc54885f6617a81b35939f12f0a9f02199bb6d8 $
# Maintainer: Ido Rosen <ido@kernel.org>
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

pkgname=docker-git
pkgver=1.9.0.dev.16580.729c9a9
pkgrel=1
epoch=1
pkgdesc='Pack, ship and run any application as a lightweight container'
arch=(i686 'x86_64')
url="https://github.com/docker/docker"
license=('Apache')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd')
makedepends=('git' 'go' 'btrfs-progs' 'go-md2man')
backup=(etc/sysctl.d/docker.conf)
provides=('docker')
conflicts=('docker')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=("git+https://github.com/docker/docker.git"
        'docker.service'
        'docker.install'
        docker.conf
        )
md5sums=('SKIP'
         '3f7ccab915fb1942f06e18946c2811d2'
         '1a8e60447794b3c4f87a2272cc9f144f'
         '9bce988683771fb8262197f2d8196202')
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
  install -Dm755 "bundles/$_dockerver/dynbinary/docker-$_dockerver" "$pkgdir/usr/bin/docker"
  install -Dm755 "bundles/$_dockerver/dynbinary/dockerinit-$_dockerver" "$pkgdir/usr/lib/docker/dockerinit"
  # completion
  install -Dm644 "contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 "contrib/completion/zsh/_docker" "$pkgdir/usr/share/zsh/site-functions/_docker"
  # systemd
  install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 "$srcdir/docker.conf" "$pkgdir/etc/sysctl.d/docker.conf"

  cd man
  for section in 1 5; do
    for i in *.$section; do
      install -Dm644 "$i" "$pkgdir/usr/share/man/man$section/$i"
    done
  done
}

# vim:set ts=2 sw=2 et:
