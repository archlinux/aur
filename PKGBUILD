# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgname=powershell
_pkgver=6.0.0-beta.5
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="A cross-platform automation and configuration tool/framework (latest release)"
arch=('x86_64')
url="https://github.com/PowerShell/PowerShell"
license=('MIT')
makedepends=('git' 'cmake' 'dotnet-sdk-2.0')
depends=('icu')
source=($pkgname::git+https://github.com/PowerShell/PowerShell.git#tag=v$_pkgver
        pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop
        googletest::git+https://github.com/google/googletest.git)
md5sums=('SKIP'
         'SKIP'
         'SKIP')
install=powershell.install

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.src/Modules/Pester.url "$srcdir"/pester
  git config submodule.src/libpsl-native/test/googletest.url "$srcdir"/googletest
  git submodule update
  git clean -dfx

  sed -i -e 's/hash powershell/\/bin\/false/g' build.sh 
}

build() {
  cd $pkgname

  pushd src/libpsl-native
  cmake .
  make -j
  popd

  "$srcdir"/powershell/build.sh
}

check() {
  cd $pkgname/src/libpsl-native

  make test
}


package() {
  cd $pkgname/src/powershell-unix

  mkdir -p "$pkgdir"/usr/lib/$pkgname
  cp -a bin/Linux/netcoreapp*/linux-x64 "$pkgdir"/usr/lib/$pkgname
  chmod 755 "$pkgdir"/usr/lib/$pkgname/linux-x64/$pkgname

  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  cp ../../LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/$pkgname/linux-x64/$pkgname "$pkgdir"/usr/bin/powershell
}
