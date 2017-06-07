# Maintainer: Kyle Sferrazza <kyle.sferrazza@gmail.com>

pkgname=powershell-beta
_pkgname=powershell
_pkgver=6.0.0-beta.2
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="A cross-platform automation and configuration tool/framework (beta version)"
arch=('x86_64')
url="https://github.com/PowerShell/PowerShell"
license=('MIT')
makedepends=('git' 'cmake' 'proot' 'dotnet-cli-git')
depends=('icu')
provides=('powershell')
source=($_pkgname::git+https://github.com/PowerShell/PowerShell.git#tag=v$_pkgver
        pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop
        googletest::git+https://github.com/google/googletest.git
        os-release)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'f5841baa62b1322c07f9394940cec818')

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.src/Modules/Pester.url "$srcdir"/pester
  git config submodule.src/libpsl-native/test/googletest.url "$srcdir"/googletest
  git submodule update
  git clean -dfx
}

build() {
  cd $_pkgname

  pushd src/libpsl-native
  cmake .
  make -j
  popd

  PROOT_NO_SECCOMP=1 \
  proot -b "$srcdir"/os-release:/etc/os-release "$srcdir"/powershell/build.sh
}

check() {
  cd $_pkgname/src/libpsl-native

  PROOT_NO_SECCOMP=1 \
  proot -b "$srcdir"/os-release:/etc/os-release \
  make test
}


package() {
  cd $_pkgname/src/powershell-unix

  mkdir -p "$pkgdir"/usr/lib/$_pkgname
  cp -a bin/Linux/netcoreapp*/ubuntu.16.04-x64 "$pkgdir"/usr/lib/$_pkgname
  chmod 755 "$pkgdir"/usr/lib/$_pkgname/ubuntu.16.04-x64/$_pkgname

  mkdir -p "$pkgdir"/usr/share/licenses/$_pkgname
  cp ../../LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/$_pkgname/ubuntu.16.04-x64/powershell "$pkgdir"/usr/bin/powershell
}
