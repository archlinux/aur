# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: jason ryan <jasonwryan@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowwski.pl>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: evr <evanroman at gmail>
# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>

pkgname=mpdscribble-git
_pkgname=mpdscribble
pkgver=0.23.r60.gd62d214
pkgrel=1
pkgdesc='MPD client which submits track info to {Libre,Last}.fm - master branch'
url='https://github.com/MusicPlayerDaemon/mpdscribble'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL')
depends=('curl' 'libmpdclient')
makedepends=('boost' 'systemd' 'meson' 'ninja' 'git')
provides=("mpdscribble")
conflicts=("mpdscribble")
install=$_pkgname.install
source=("${_pkgname}::git+${url}.git")
validpgpkeys=('0392335A78083894A4301C43236E8A58C6DB4512') # Max Kellermann <max@musicpd.org>
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR="${pkgdir}" meson build \
     --prefix=/usr \
     --sysconfdir=/etc
}

build() {
  cd "${srcdir}/${_pkgname}"

  DESTDIR="${pkgdir}" meson build \
  --prefix=/usr \
  --buildtype=plain
  meson compile -C build
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" meson install -C build

  install -Dm644 build/systemd/system/mpdscribble.service \
    "${pkgdir}"/usr/lib/systemd/system/mpdscribble@.service
  install -Dm644 build/systemd/user/mpdscribble.service \
    "${pkgdir}"/usr/lib/systemd/user/mpdscribble.service

  # example config
  install -Dm644 doc/mpdscribble.conf \
    "${pkgdir}"/usr/share/mpdscribble/mpdscribble.conf.example
  rm -r "${pkgdir}"/etc

  install -d "${pkgdir}"/var/cache/mpdscribble
    touch "${pkgdir}"/var/cache/mpdscribble/mpdscribble.cache
}

# vim:set ts=2 sw=2 et:
