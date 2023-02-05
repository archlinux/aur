# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

_pkgname=htop
pkgname="${_pkgname}-vim"
pkgver=3.2.2
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
sha256sums=('3829c742a835a0426db41bb039d1b976420c21ec65e93b35cd9bfd2d57f44ac8'
            '06eb3383e3643f0edcbf5c2b5a7ef8e261dd9f81a2435bd9a17f941583c44bd2')

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
