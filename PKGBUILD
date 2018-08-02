# Maintainer: Solomon Choina <shlomochoina@gmail.com>

pkgname=archipelago
pkgver=2.2.6.r0.gb930b80
_pkgver=2.2.6
pkgrel=1
pkgdesc="An open-source terminal emulator built on web technology"
arch=("x86_64")
url="https://github.com/npezza93/archipelago"
license=("MIT")
depends=('nodejs' 'libxkbfile' 'libx11')
makedepends=("git" "yarn" 'node-gyp' 'python2' 'libx11' 'rpm-org')
source=("git+https://github.com/npezza93/archipelago.git#tag=v$_pkgver")
sha512sums=('SKIP')

pkgver() {
 cd "$pkgname"
 git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/archipelago
  yarn install #--ignore-engines
  ./node_modules/.bin/electron-builder --linux deb
}

package() {
  cd $srcdir/archipelago
  ar -x dist/*.deb
  tar -xf data.tar.xz

  cp -r {opt/,usr/} $pkgdir/
  
install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
    #!/usr/bin/bash
    /opt/Archipelago/archipelago
END

}
