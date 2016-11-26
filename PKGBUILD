# Maintainer: Sergio Correia <sergio@correia.cc>

pkgname=powershell
_pkgver=6.0.0-alpha.13
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="A cross-platform automation and configuration tool/framework."
arch=('x86_64')
url="https://github.com/PowerShell/PowerShell"
license=('MIT')
makedepends=('git' 'cmake' 'proot' 'dotnet-cli')
depends=('bash' 'icu55')
source=($pkgname::git+https://github.com/PowerShell/PowerShell.git#tag=v$_pkgver
        pester::git+https://github.com/PowerShell/psl-pester.git#branch=develop
        googletest::git+https://github.com/google/googletest.git
        os-release
        revert-commit-c695d41.patch
        build.sh)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'f5841baa62b1322c07f9394940cec818'
         'b75d22e1c794dded7308f5bc70dea409'
         'd20378ea8504200919c65de6592f0b24')

prepare() {
  cd "${pkgname}"
  git submodule init
  git config submodule.src/Modules/Pester.url "${srcdir}/pester"
  git config submodule.src/libpsl-native/test/googletest.url "${srcdir}/googletest"
  git submodule update

  # Starting off clean.
  git clean -dfx

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
  cd "${pkgname}"

  pushd src/libpsl-native
  cmake .
  make
  popd

  PROOT_NO_SECCOMP=1 \
  proot -b "${srcdir}/os-release":/etc/os-release "${srcdir}/build.sh"
}

check() {
  cd "${pkgname}"/src/libpsl-native

  PROOT_NO_SECCOMP=1 \
  proot -b "${srcdir}/os-release":/etc/os-release \
  make test
}


package() {
  cd "${pkgname}"/src/powershell-unix

  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -a bin/Linux/netcoreapp1.0/ubuntu.16.04-x64 "${pkgdir}/usr/lib/${pkgname}"

  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp ../../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/ubuntu.16.04-x64/powershell" "${pkgdir}/usr/bin/powershell"
}
