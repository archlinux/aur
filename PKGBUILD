# Maintainer: Dawid Potocki <archlinux a dawidpotocki , com>

_pkgname=htop
pkgname="$_pkgname-vim"
pkgver=3.0.5
pkgrel=2
pkgdesc='Interactive process viewer with a Vim keybindings patch'
arch=('x86_64')
url='https://htop.dev/'
license=('GPL')
depends=('ncurses' 'libncursesw.so' 'libnl')
makedepends=('lm_sensors')
optdepends=('lm_sensors: show cpu temperatures'
            'lsof: show files opened by a process'
            'strace: attach to a running process')
provides=('htop')
conflicts=('htop')
options=('!emptydirs')
source=("https://github.com/htop-dev/htop/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'vim-keybindings.patch'
)
sha256sums=('4c2629bd50895bd24082ba2f81f8c972348aa2298cc6edc6a21a7fa18b73990c'
            '181d5bd6c3d9cfe65bb78453ccd5be22db947485954879af65d3b9757fcf46f5'
)

prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np1 < ../vim-keybindings.patch

  autoreconf -fi
}

build() {
  cd "$_pkgname-$pkgver"

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
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
}
