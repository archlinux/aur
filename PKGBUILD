# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname='powershell-git'
_pkgname='powershell'
pkgver=6.0.0.alpha.9.247.g0c4472e
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
        'revert-commit-c695d41.patch'
        'build.sh')
sha256sums=('SKIP'
            'e903a41166648f2e6113dff83b116e9ed6a5dc7d302ac24ae26811583bcb9cc2'
            '4568c69cf2a0a961d3f16c069b24391dea7898cd7c856cad94b70a73ef6a9224'
            '190dfc2b3b0bbc49db8411c3b934f460cf9d1399e30e93a5ff50e9b33613428b')

pkgver() {
  cd "${_pkgname}"
  git describe --tags --long | sed 's/^v//;s/-/./;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  git submodule update --init

  # Starting off clean.
  git clean -dfx
  rm -rf ~/.nuget

  # Workaround due to
  # https://github.com/PowerShell/PowerShell/commit/c695d41c47c8baa48db1a590fe7378641a9e0ab9
  net_version=$(dotnet --version)
  net_build_number=${net_version##*-}
  if [[ "${build_number}" -lt "3546" ]]; then
    msg "Reverting powershell commit c695d41"
    patch -p1 < ../revert-commit-c695d41.patch
  fi
}

build() {
  cd "${_pkgname}"

  pushd src/libpsl-native
  cmake .
  make
  popd

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
