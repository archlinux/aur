# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=ironpython-git
pkgver=2.7.9.r24.g5c594f32b
pkgrel=1
pkgdesc="Python implementation for the .NET framework"
arch=("any")
url="http://ironpython.net"
license=("Apache")
depends=('mono>=5.18')
makedepends=('git' 'msbuild-stable' 'dos2unix')
options=('!strip' 'emptydirs' 'libtool')
source=($pkgname::git+https://github.com/IronLanguages/ironpython2.git
        package.patch)
sha256sums=('SKIP'
            'b57180aa2eacdf668e87dd605181867928b4363a3d9a1abf5186e8c21d6e560d')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^ipy-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  git submodule update --init
  patch -p0 < ../package.patch
  sed -i "s:@pkgdir@:$pkgdir:" Package/deb/Deb.Packaging.targets
}

build() {
  cd "$srcdir/$pkgname"
  msbuild Build.proj /t:Stage /p:Configuration=Release
}

package() {
  cd "$srcdir/$pkgname"
  msbuild Build.proj /t:Package /p:Configuration=Release
}
