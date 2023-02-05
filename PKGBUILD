# Maintainer: Sean Greenslade <aur AT seangreenslade DOT com>
# Contributor: Lars Rustand <rustand dot lars at gmail dot com>
# Contributor: Boohbah <boohbah at gmail.com>
# Contributor: Eric Belanger <eric at archlinux.org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux.us>
# Contributor: Wesley Merkel <ooesili at gmail.com>
# Contributor: sekret <sekret at posteo.se>

_pkgname=htop
pkgname=$_pkgname-solarized
_tag='4dbd0b5c87f4225495d6e0591a1d7227f120ead1' # git rev-parse ${pkgver}
pkgver=3.2.2
pkgrel=1
pkgdesc='Interactive process viewer with solarized patch'
arch=('i686' 'x86_64' 'armv7h')
url='https://htop.dev/'
license=('GPL')
depends=('libcap' 'libcap.so' 'libnl' 'ncurses' 'libncursesw.so')
makedepends=('git' 'lm_sensors')
optdepends=('lm_sensors: show cpu temperatures'
            'lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
validpgpkeys=('F7ABE8761E6FE68638E6283AFE0842EE36DD8C0C'  # Nathan Scott <nathans@debian.org>
              '0D316B6ABE022C7798D0324BF1D35CB9E8E12EAD') # Benny Baumann <BenBE@geshi.org>
source=("git+https://github.com/htop-dev/htop.git#tag=${_tag}?signed"
        'htop-solarized.patch')
sha256sums=('SKIP'
            '2b8e0b3949abd5b45c862963bde55504cd55845e734ff24fb8a310ca091c40f5')

prepare() {
  cd "${_pkgname}"

  autoreconf -fi

  # Solarized patch
  patch -p1 -N -i "${srcdir}/htop-solarized.patch"
}

build() {
  cd "${_pkgname}"

  ./configure \
      --prefix=/usr \
      --sysconfdir=/etc \
      --enable-affinity \
      --enable-capabilities \
      --enable-delayacct \
      --enable-openvz \
      --enable-sensors \
      --enable-unicode \
      --enable-vserver

  make
}

package() {
  cd "${_pkgname}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
