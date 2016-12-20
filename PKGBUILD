# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='powershell-git'
_pkgname='powershell'
pkgver=6.0.0.alpha.14.7.g3938cdb
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework."
arch=('x86_64')
url="https://github.com/PowerShell/PowerShell"
license=('MIT')
makedepends=('git' 'cmake' 'proot' 'dotnet-cli')
depends=('bash' 'icu55')
conflicts=('powershell' 'powershell-bin')
provides=('powershell')
source=($_pkgname::'git+https://github.com/PowerShell/PowerShell.git'
        'pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop'
        'googletest::git+https://github.com/google/googletest.git'
        'os-release'
        'revert-commit-c695d41.patch'
        'build.sh')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'e903a41166648f2e6113dff83b116e9ed6a5dc7d302ac24ae26811583bcb9cc2'
            '4568c69cf2a0a961d3f16c069b24391dea7898cd7c856cad94b70a73ef6a9224'
            '190dfc2b3b0bbc49db8411c3b934f460cf9d1399e30e93a5ff50e9b33613428b')

pkgver() {
  cd $_pkgname

  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.src/Modules/Pester.url "${srcdir}/pester"
  git config submodule.src/libpsl-native/test/googletest.url "${srcdir}/googletest"
  git submodule update

  # Starting off clean.
  git clean -dfx
}

build() {
  cd $_pkgname

  pushd src/libpsl-native
  cmake .
  make
  popd

  PROOT_NO_SECCOMP=1 \
  proot -b "$srcdir"/os-release:/etc/os-release "$srcdir"/build.sh
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

  mkdir -p "$pkgdir"/usr/share/licenses/$_pkgname
  cp ../../LICENSE.txt "$pkgdir"/usr/share/licenses/$_pkgname/LICENSE

  mkdir -p "$pkgdir"/usr/bin
  ln -s /usr/lib/$_pkgname/ubuntu.16.04-x64/powershell "$pkgdir"/usr/bin/powershell
}
