# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname='powershell-git'
_pkgname='powershell'
binaryname='pwsh'
pkgver=6.0.0.rc.2.69.g79ae39691
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (git version)'
arch=('x86_64')
url='https://github.com/PowerShell/PowerShell'
license=('MIT')
makedepends=('git' 'cmake' 'dotnet-sdk-2.0')
depends=('icu')
provides=('powershell')
conflicts=('powershell')
source=($_pkgname::'git+https://github.com/PowerShell/PowerShell.git'
        'pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop'
        'googletest::git+https://github.com/google/googletest.git'
        build.sh
        dotnet-version.patch)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'a0d7e3fa753f74e9722f71a5ab3da6d9'
         '7fc09756121a31bc336498a18edfe6da')
install=powershell.install

pkgver() {
  cd $_pkgname
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.src/Modules/Pester.url "$srcdir"/pester
  git config submodule.src/libpsl-native/test/googletest.url "$srcdir"/googletest
  git submodule update
  git clean -dfx

  cat $srcdir/dotnet-version.patch | patch -p1
}

build() {
  cd $_pkgname
  $srcdir/build.sh
}

check() {
  cd $_pkgname/src/libpsl-native
  make test
}

package() {
  cd $_pkgname/src/powershell-unix

  mkdir -p $pkgdir/usr/lib/$_pkgname
  cp -a bin/Linux/netcoreapp*/linux-x64 $pkgdir/usr/lib/$_pkgname
  chmod 755 $pkgdir/usr/lib/$_pkgname/linux-x64/$binaryname

  mkdir -p $pkgdir/usr/share/licenses/$_pkgname
  cp ../../LICENSE.txt $pkgdir/usr/share/licenses/$_pkgname/LICENSE

  mkdir -p $pkgdir/usr/bin
  ln -s /usr/lib/$_pkgname/linux-x64/$binaryname $pkgdir/usr/bin/$binaryname
}
