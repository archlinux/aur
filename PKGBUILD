# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Jochem Kossen <j.kossen@home.nl>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=abcde-poddmo-git
pkgver=2.12.2.r2.gd793fa5
pkgrel=2
pkgdesc='Frontend command-line utility that grabs tracks off a CD, encodes them to ogg or mp3 format, and tags them, all in one go'
arch=(any)
url="https://github.com/poddmo/abcde"
license=('GPL')
depends=(
    sh 
    cd-discid
    wget
    vorbis-tools
    which
    )
makedepends=(git)
optdepends=(
    'cdparanoia: Paranoia ripping support'
    'flac: FLAC encoding support'
    'glyr: album art support'
    'imagemagick: album art support'
    'lame: MP3 encoding support'
    'opus-tools: Opus encoding support'
    'python-eyed3: ID3 tag support'
    'vorbisgain: Ogg Vorbis normalization support'
    )
backup=("etc/abcde.conf")
provides=(abcde)
conflicts=(abcde)
source=("abcde-poddmo::git+https://github.com/poddmo/abcde"
        hostname.patch)
sha256sums=('SKIP'
            '6b4d8e70dbd34ad269db44fdb9f63eccc448b632cfc98d1b635c3ee6a77362ad')

pkgver() {
  cd abcde-poddmo
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd abcde-poddmo
  sed -e "s:normalize-audio:normalize:g" -i abcde
  # https://bugs.archlinux.org/task/58046
  sed -i 's/^#CDDBMETHOD=musicbrainz/CDDBMETHOD=cddb/' abcde.conf
  # replace inetutils hostname with coreutils uname -n
  patch -Np1 -i ../hostname.patch

  sed -i 's|doc/$(abcde_version)|doc|g' Makefile
}

package() {
  make -C abcde-poddmo DESTDIR="${pkgdir}" prefix=/usr sysconfdir=/etc install
}
