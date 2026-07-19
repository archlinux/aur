# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

_pkgname=htop
pkgname="${_pkgname}-vim"
pkgver=3.5.2
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
sha256sums=('a66a62bbd1eba59889c68f868b643e53320eea93da19f43ba13c822a826d82ba'
            '26d2bcde57a3de0e0b3e95de8c6de1eb665eae1d5faf5051f3b7b1bb5e27c1dc')

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
