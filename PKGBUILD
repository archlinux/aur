# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

_pkgname=htop
pkgname="${_pkgname}-vim"
pkgver=3.4.1
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
sha256sums=('af9ec878f831b7c27d33e775c668ec79d569aa781861c995a0fbadc1bdb666cf'
            '90677646e98e4463d0fe48272e36d6e92ce74b192c6cec60065b10ab63576ddf')

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
