pkgname=sqlconvert-tools
pkgdesc="convert sql server to sqlite"
pkgver=v0.0.1.r14.g077a8c2
pkgrel=1
arch=('x86_64' 'aarch64')
url=https://github.com/vcup/MonitorFileSystem
license=('GPL3')
makedepends=('git')
source=(
  'git+https://github.com/vcup/SqlConvertTools'
  'https://dotnet.microsoft.com/download/dotnet/scripts/v1/dotnet-install.sh'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/SqlConvertTools"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
prepare(){
  [[ -d "${srcdir}/dotnet-sdk" ]] && rm -rf "${srcdir}/dotnet-sdk"
  bash "${srcdir}/dotnet-install.sh" --install-dir "${srcdir}/dotnet-sdk" --channel Current --no-path
  cd "${srcdir}/SqlConvertTools"
  git submodule update --init --recursive
}
check(){
  cd "${srcdir}/SqlConvertTools"
  PATH="${srcdir}/dotnet-sdk:${PATH}"
}
build(){
  cd "${srcdir}/SqlConvertTools"
  PATH="${srcdir}/dotnet-sdk:${PATH}"
  dotnet restore ./SqlConvertTools.sln
  dotnet publish ./SqlConvertTools/SqlConvertTools.csproj -c "Release" \
    --nologo --force --output ./out
}
package(){
  mkdir -p "${pkgdir}/opt/sqlconvert-tools"
  mkdir -p "${pkgdir}/usr/bin"

  cd "${srcdir}/SqlConvertTools/out"
  cp -a * "${pkgdir}/opt/sqlconvert-tools"

  ln -sf /opt/sqlconvert-tools/SqlConvertTools "${pkgdir}/usr/bin/sqlconvert-tools"
}
