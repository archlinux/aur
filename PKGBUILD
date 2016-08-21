# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='powershell-git'
_pkgname='powershell'
pkgver=6.0.0.alpha.9.104.g7f82c29
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework."
arch=('i686' 'x86_64')
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
            'c1c4bb82227190eb78d163eb48c422ed7738dd86d0e0e17b7a445f568540a15c')

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
  make test
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
