# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

_pkgname=htop
pkgname="${_pkgname}-vim"
pkgver=3.5.3
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
b2sums=('d975a81830c5c659b6e573685922812e453e331426f49f6073d674487ec6abf54c38d81ffd6ff40ba0133300fcebdb80cd40f0841cd97eb7b8c7b414bc9f4bc4'
        '24c6205033b63b20f740bd2088ceb0c312509b0f9f3299fb61d52664e7a3b36690ab9ab746064d91184168df24907cfb599fc25887a0386635e677f37c0f5fe8')

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
