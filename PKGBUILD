# Maintainer: TheElevatedOne <adam.mlady@elevated.ovh>

pkgname=7zipl-git
_pkgname=7zipl
pkgver=0.1.0_r1_g3f13d97
pkgrel=1
pkgdesc='7-Zip File Manager for Linux with a plain GTK 4 interface, using the system 7-Zip library (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/TheElevatedOne/7zipl'
license=('LGPL-2.1-or-later')
depends=('7zip' 'glib2' 'glibc' 'gtk4' 'libgcc' 'libstdc++')
makedepends=('git' 'cmake' 'ninja' 'pkgconf')
provides=('7zipl')
conflicts=('7zipl')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
  cmake -B build -S "$_pkgname" -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  cd "$_pkgname"
  install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
