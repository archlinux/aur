# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

_pkgname=htop
pkgname="${_pkgname}-vim"
pkgver=3.5.0
pkgrel=1
pkgdesc='Interactive process viewer with a Vim keybindings patch'
arch=('x86_64')
url='https://htop.dev/'
license=('GPL-2.0-or-later')
depends=('libcap' 'libcap.so' 'libnl' 'ncurses' 'libncursesw.so')
makedepends=('lm_sensors')
optdepends=('lm_sensors: show cpu temperatures'
            'lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/archive/${pkgver}/${_pkgname}-${pkgver}.tar.gz"
        'vim-keybindings.patch'
)
sha256sums=('cf0e72abf670ff3547d9130e129d2a97a657a5b20c74132c17502c817babbb41'
            'd12e380f204f75399f20edf6c6b1ae46f6e83303941519fc787ca3774a30e19d')

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -Np1 < ../vim-keybindings.patch
  autoreconf -fi
}

build() {
  cd "${_pkgname}-${pkgver}"

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
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
