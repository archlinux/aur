# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname='powershell-git'
_pkgname='powershell'
pkgver=6.0.0.beta.5.78.gcdbbb7a4b
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework (git version)"
arch=('x86_64')
url="https://github.com/PowerShell/PowerShell"
license=('MIT')
makedepends=('git' 'cmake' 'dotnet-sdk-2.0')
depends=('icu')
provides=('powershell')
source=($_pkgname::'git+https://github.com/PowerShell/PowerShell.git'
        'pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop'
        'googletest::git+https://github.com/google/googletest.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP')
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

  sed -i -e 's/hash powershell/\/bin\/false/g' build.sh 
}

build() {
  cd $_pkgname

  pushd src/libpsl-native
  cmake .
  make -j
  popd

  "$srcdir"/powershell/build.sh
}

check() {
  cd $_pkgname/src/libpsl-native
  make test
}


package() {
  cd $_pkgname/src/powershell-unix

  mkdir -p "$pkgdir"/usr/lib/$_pkgname
  cp -a bin/Linux/netcoreapp*/linux-x64 "$pkgdir"/usr/lib/$_pkgname
  chmod 755 "$pkgdir"/usr/lib/$_pkgname/linux-x64/$_pkgname

  mkdir -p "$pkgdir"/usr/share/licenses/$_pkgname
  cp ../../LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/$_pkgname/linux-x64/$_pkgname "$pkgdir"/usr/bin/powershell
}
