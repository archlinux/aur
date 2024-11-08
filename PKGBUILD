# Maintainer: envolution
# Contributor: Olliver Schinagl <oliver@schinagl.nl>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
pkgname=openfortivpn-git
_pkgname=openfortivpn
pkgver=1.22.1+r836+gc49663d26
pkgrel=1
pkgdesc="An open implementation of Fortinet's proprietary PPP+SSL VPN solution"
arch=(x86_64)
url=https://github.com/adrienverge/openfortivpn
license=(GPL3)
depends=(
  glibc
  openssl
  ppp
  resolvconf
  systemd-libs
)
makedepends=(
  git
  systemd
  autoconf
)
provides=('openfortivpn')
conflicts=('openfortivpn')
backup=(etc/openfortivpn/config)
source=(git+https://github.com/adrienverge/openfortivpn.git)
sha256sums=('SKIP')

prepare() {
  cd openfortivpn
  autoreconf -fiv
}

pkgver(){
  cd "${srcdir}/openfortivpn"
  _version=$(git tag --sort=-v:refname --list | grep '^v[0-9.]*$' | head -n1 | cut -c2-)
  _commits=$(git rev-list --count HEAD)
  _short_commit_hash=$(git rev-parse --short=9 HEAD)
  echo "${_version#'v'}+r${_commits}+g${_short_commit_hash}"
}

build() {
  cd openfortivpn
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-resolvconf
  make
}

package() {
  make DESTDIR="${pkgdir}" -C openfortivpn install
}

# vim: ts=2 sw=2 et:
