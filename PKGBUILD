# Maintainer: Vladimir Panteleev <arch-pkg at thecybershadow.net>

pkgname=edk2-ovmf-macboot-git
pkgver=r21417.30f2b3985d
pkgrel=1
pkgdesc="edk2 UEFI firmware with macOS compatibility fixes"
arch=('any')
url="https://www.contrib.andrew.cmu.edu/~somlo/OSXKVM/"
license=('BSD')
depends=()
makedepends=('git' 'nasm' 'iasl')
optdepends=()
source=("git+https://github.com/gsomlo/edk2#branch=macboot")
md5sums=('SKIP')
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
