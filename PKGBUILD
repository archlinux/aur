# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>
# Contributor: jason ryan <jasonwryan@gmail.com>
# Contributor: Bartłomiej Piotrowski <nospam@bpiotrowwski.pl>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: evr <evanroman at gmail>
# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>

pkgname=mpdscribble-git
_pkgname=mpdscribble
pkgver=0.25.r2.g9ab7a45
pkgrel=3
pkgdesc='MPD client which submits track info to {Libre,Last}.fm - master branch'
url='https://github.com/MusicPlayerDaemon/mpdscribble'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
license=('GPL')
depends=('curl' 'libmpdclient')
makedepends=('boost' 'systemd' 'meson' 'ninja' 'git')
provides=("mpdscribble")
conflicts=("mpdscribble")
install=$_pkgname.install
source=("${_pkgname}::git+${url}.git" 'mpdscribble.sysusers')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

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
  install -Dm644 ${srcdir}/mpdscribble.sysusers \
    "${pkgdir}"/usr/lib/sysusers.d/mpdscribble.conf

  # example config
  install -Dm644 doc/mpdscribble.conf \
    "${pkgdir}"/usr/share/mpdscribble/mpdscribble.conf.example
  rm -r "${pkgdir}"/etc

  install -d "${pkgdir}"/var/cache/mpdscribble
    touch "${pkgdir}"/var/cache/mpdscribble/mpdscribble.cache
}

# vim:set ts=2 sw=2 et:
