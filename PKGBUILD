# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=edk2-ovmf-macboot-git
pkgver=r23825.59642be02d
pkgrel=2
pkgdesc="edk2 UEFI firmware with macOS compatibility fixes (gsomlo's miscopt branch)"
arch=('any')
url="https://www.contrib.andrew.cmu.edu/~somlo/OSXKVM/"
license=('BSD')
depends=()
makedepends=('git' 'nasm' 'iasl' 'python2')
optdepends=()
source=("git+https://github.com/gsomlo/edk2#branch=gls-miscopt")
sha256sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd "$srcdir/edk2"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/edk2"
  make -C BaseTools
  bash -c '. edksetup.sh BaseTools && build -a X64 -t GCC5 -p OvmfPkg/OvmfPkgX64.dsc'
}

package() {
  cd "$srcdir/edk2"
  install -D -m644 -t "$pkgdir/usr/share/ovmf-macboot" "$(find ./Build/ -name OVMF.fd)"
}
