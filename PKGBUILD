# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

_pkgname=htop
pkgname="${_pkgname}-vim"
pkgver=3.2.1
pkgrel=1
pkgdesc='Interactive process viewer with a Vim keybindings patch'
arch=('x86_64')
url='https://htop.dev/'
license=('GPL')
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
sha256sums=('b5ffac1949a8daaabcffa659c0964360b5008782aae4dfa7702d2323cfb4f438'
            'dd0fbe1685d4e7966c18dcfa9946da436a1d198d071def5ff7c39df8126e9483')

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
      --enable-cgroup \
      --enable-delayacct \
      --enable-openvz \
      --enable-unicode \
      --enable-vserver

  make
}

package() {
  make -C "${_pkgname}-${pkgver}" DESTDIR="${pkgdir}" install
}
