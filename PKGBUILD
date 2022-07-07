# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=ironpython-git
_pkgname=ironpython2
pkgver=2.7.12.r1.gaa0526d4b
_pkgver=${pkgver/%.r*}
pkgrel=1
pkgdesc="Python implementation for the .NET framework"
arch=("any")
url="http://ironpython.net"
license=("Apache")
depends=('mono>=5.18' 'dotnet-runtime')
makedepends=('git' 'powershell' 'dotnet-sdk' 'dos2unix' 'dpkg')
options=('!strip' 'emptydirs' 'libtool')
source=(git+https://github.com/IronLanguages/ironpython2.git)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^ipy-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init
}

build() {
  cd "$srcdir/$_pkgname"
  ./make.ps1 stage
  ./make.ps1 package
}

package() {
  cd "$srcdir/$_pkgname"
  dpkg -x Package/Release/Packages/IronPython-$_pkgver/ironpython_$_pkgver.deb "$pkgdir"
}
