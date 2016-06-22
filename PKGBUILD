# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

_pkgname=sickgear
pkgname=${_pkgname}-git
pkgver=0.11.12.r0.g9198eb6
pkgrel=3
pkgdesc="Provides management of TV shows and/or Anime, detects new episodes, links to downloader apps, and more."
arch=('any')
url="https://github.com/SickGear/SickGear"
license=('GPL3')
makedepends=('git')
depends=('python2-cheetah')
optdepends=('sabnzbd: supported NZB downloader'
            'transmission-cli: supported torrent client'
            'deluge: supported torrent client'
            'rtorrent: supported torrent client'
            'qbittorrent: supported torrent client'
            'python2-notify: desktop notifications'
            'python2-pyopenssl: enable SSL'
            'unrar: RAR extraction support'
            'git: pull new versions from git')
provides=(${_pkgname})
conflicts=(${_pkgname}
           'sickbeard'
           'sickrage'
           'sickrage-git'
           'sickrage2-git')
options=('!strip')
install=${_pkgname}.install

_source="https://github.com/SickGear/SickGear.git"

source=('sickgear.service'
        'sickgear.tmpfiles'
        'sickgear.sysusers'
        'fix-signal-handling.patch'
        "${_pkgname}::git+${_source}")

sha256sums=('76108d56417bc6e5352db779c7e74812eda07b440cc293547809aa9504e10209'
            '5c7a327168f2b2d361eeaa9e9f82e79a87381908d8ba6b1d1eb90ac64ad38ac2'
            '54873ee12aa334a0c0830dbe48251f994d8ae851ae0b55250c098ff9f7f9ea60'
            '8da4938dbba87fbb7c88715d03ceff51544ed79cff3c8ea0ed31866a7d345083'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^release_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"

  # Change origin back to upstream to allow updates
  git remote set-url origin "${_source}"

  # Patch to fix SIGINT and SIGTERM signal handling
  patch -Np1 -i "${srcdir}/fix-signal-handling.patch"
}

package() {
  install -dm 755 "${pkgdir}"/{opt/sickgear/app,usr/lib/{tmpfiles.d,sysusers.d,systemd/system}}

  cp -dRT --no-preserve=ownership "${_pkgname}/" "${pkgdir}/opt/sickgear/app/"

  install -m 644 sickgear.service "${pkgdir}/usr/lib/systemd/system/"
  install -m 644 sickgear.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/sickgear.conf"
  install -m 644 sickgear.sysusers "${pkgdir}/usr/lib/sysusers.d/sickgear.conf"
}
