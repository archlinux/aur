# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='powershell-git'
_pkgname='powershell'
pkgver=6.0.0.alpha.9.192.g901af51
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework."
arch=('x86_64')
url="https://github.com/PowerShell/PowerShell"
license=('MIT')
makedepends=('git' 'cmake' 'proot' 'dotnet-cli')
depends=('bash' 'icu55')
conflicts=('powershell' 'powershell-bin')
provides=('powershell')
source=($_pkgname::'git://github.com/PowerShell/PowerShell.git'
        'os-release'
        'build.sh')
sha256sums=('SKIP'
            'e903a41166648f2e6113dff83b116e9ed6a5dc7d302ac24ae26811583bcb9cc2'
            '50f3e73f74a9b90bf1dcaf702e1fd971f35d685f4bd5a9322970644108933f4e')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule update --init
}

build() {
  cd "${_pkgname}"

  pushd src/libpsl-native
  cmake .
  make
  popd

  dotnet restore

  proot -b "${srcdir}/os-release":/etc/os-release "${srcdir}/build.sh"
}

check() {
  cd "${_pkgname}"/src/libpsl-native
  LANG=en_US.UTF-8 make test
}


package() {
  cd "${_pkgname}"/src/powershell-unix

  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -a bin/Linux/netcoreapp1.0/ubuntu.16.04-x64 "${pkgdir}/usr/lib/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp ../../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/ubuntu.16.04-x64/powershell" "${pkgdir}/usr/bin/powershell"
}

# vim:set ts=2 sw=2 et:
