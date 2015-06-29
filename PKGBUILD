# Maintainer: Kevin Houdebert <kevin@qwazerty.eu>
# Contributor: Ido Rosen <ido@kernel.org>
# Contributor: Sébastien "Seblu" Luttringer
# Contributor: Marcel Wysocki <maci@satgnu.net>
# Contributor: Daniel YC Lin <dlin.tw@gmail>
#
# Inspired by docker-git PKGBUILD

pkgname=docker-experimental-git
pkgver=1.8.0.dev.40a41ff
pkgrel=1
pkgdesc='Pack, ship and run any application as a lightweight container (Experimental)'
arch=('i686' 'x86_64')
url="https://github.com/docker/docker"
license=('Apache')
depends=('bridge-utils' 'iproute2' 'device-mapper' 'sqlite' 'systemd')
makedepends=('git' 'go' 'btrfs-progs')
backup=(etc/sysctl.d/docker.conf)
provides=('docker')
conflicts=('docker')
# don't strip binaries! A sha1 is used to check binary consistency.
options=('!strip')
source=("git+https://github.com/docker/docker.git"
        'docker.service'
        'docker.install'
        'docker.conf')
md5sums=('SKIP'
         '3f7ccab915fb1942f06e18946c2811d2'
         '1a8e60447794b3c4f87a2272cc9f144f'
         '9bce988683771fb8262197f2d8196202')
install='docker.install'

pkgver() {
  cd "${srcdir}/docker"
  _dockerver="$(cat VERSION)"
  echo "${_dockerver//-/.}.$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/docker"
  export AUTO_GOPATH=1
  export DOCKER_EXPERIMENTAL=1
  ./hack/make.sh dynbinary
}

#check() {
#  cd "${srcdir}/docker"
#  ./hack/make.sh dyntest
#}

package() {
  cd "${srcdir}/docker"
  _dockerver="$(cat VERSION)"
  install -Dm755 "bundles/$_dockerver/dynbinary/docker-$_dockerver" "$pkgdir/usr/bin/docker"
  install -Dm755 "bundles/$_dockerver/dynbinary/dockerinit-$_dockerver" "$pkgdir/usr/lib/docker/dockerinit"
  # completion
  install -Dm644 "contrib/completion/bash/docker" "$pkgdir/usr/share/bash-completion/completions/docker"
  install -Dm644 "contrib/completion/zsh/_docker" "$pkgdir/usr/share/zsh/site-functions/_docker"
  # systemd
  install -Dm644 "$srcdir/docker.service" "$pkgdir/usr/lib/systemd/system/docker.service"
  install -Dm644 "$srcdir/docker.conf" "$pkgdir/etc/sysctl.d/docker.conf"
}

# vim:set ts=2 sw=2 et:
