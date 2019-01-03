# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=ironpython-git
pkgver=2.7.9.r17.g3071442ad
pkgrel=1
pkgdesc="Python implementation for the .NET framework"
arch=("any")
url="http://ironpython.net"
license=("Apache")
depends=('mono>=5.18')
makedepends=('git' 'msbuild-stable')
options=('!strip' 'emptydirs' 'libtool')
source=($pkgname::git+https://github.com/IronLanguages/ironpython2.git
        package.patch)
sha256sums=('SKIP'
            'dac312b21732555742dbb4bf1b7225e98ad2c1ee260d684b3f259369d32b3cd7')

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
