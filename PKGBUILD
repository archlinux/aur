# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgname=powershell
binaryname=pwsh
_pkgver=6.0.0-rc.2
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc='A cross-platform automation and configuration tool/framework (latest release)'
arch=('x86_64')
url='https://github.com/PowerShell/PowerShell'
license=('MIT')
makedepends=('git' 'cmake' 'dotnet-sdk-2.0')
depends=('icu')
source=($pkgname::git+https://github.com/PowerShell/PowerShell.git#tag=v$_pkgver
        pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop
        googletest::git+https://github.com/google/googletest.git
        build.sh
        dotnet-version.patch)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'a0d7e3fa753f74e9722f71a5ab3da6d9'
         '7fc09756121a31bc336498a18edfe6da')
install=powershell.install

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.src/Modules/Pester.url $srcdir/pester
  git config submodule.src/libpsl-native/test/googletest.url $srcdir/googletest
  git submodule update
  git clean -dfx

  cat $srcdir/dotnet-version.patch | patch -p1
}

build() {
  cd $pkgname
  $srcdir/build.sh
}

check() {
  cd $pkgname/src/libpsl-native
  make test
}

package() {
  cd $pkgname/src/powershell-unix

  mkdir -p $pkgdir/usr/lib/$pkgname
  cp -a bin/Linux/netcoreapp*/linux-x64 $pkgdir/usr/lib/$pkgname
  chmod 755 $pkgdir/usr/lib/$pkgname/linux-x64/$binaryname

  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  cp ../../LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  mkdir -p $pkgdir/usr/bin
  ln -s /usr/lib/$pkgname/linux-x64/$binaryname $pkgdir/usr/bin/$binaryname
}
