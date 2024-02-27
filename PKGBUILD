# Maintainer: Jah Way <jahway603 at protonmail dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

_pkgname='chkservice'
pkgname="${_pkgname}-git"
pkgver=0.3.r2.ea40b14f
pkgrel=1
pkgdesc='Systemd units manager with ncurses terminal interface'
arch=('x86_64')
url='https://github.com/srakitnican/chkservice'
license=('GPL3')
depends=('libsystemd')
makedepends=('cmake' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git"
        get-state.patch)
sha256sums=('SKIP'
            '3db092cd91bf14ab35db55e692249ba0b08277fce99614812a5d5f0a5d0980c9')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch --directory=$_pkgname --forward --strip=1 --input="$srcdir/get-state.patch"
}

build() {
  cd $srcdir/$_pkgname
  cmake -B build -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  make -C build
}

package() {
  make DESTDIR="${pkgdir}" PREFIX='/usr' -C 'build' install
  install -Dvm644 "${_pkgname}/README.md" -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dvm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

# vim: ts=2 sw=2 et:
