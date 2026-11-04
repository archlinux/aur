# Maintainer: agony <27015 at riseup dot net>

pkgname=disc-image-studio
pkgver=1.4.0
pkgrel=1
pkgdesc='Generate CD, DVD and Blu-ray images that show a picture on the burned disc'
arch=('x86_64')
url='https://github.com/JiaFeiMiao-K-Cat/DiscImageStudio'
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-10.0' 'glibc' 'libgcc' 'libstdc++')
makedepends=('dotnet-sdk-10.0')
options=('!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('895e3d4c1ffe4b1a1b9627a058b7ddc8b6b77a1510cfb78f37b0ff337554b2a7')

_project=src/DiscImageStudio.Cli/DiscImageStudio.Cli.csproj

_dotnet_env() {
  export HOME="${srcdir}/home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_GENERATE_ASPNET_CERTIFICATE=false
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
  mkdir -p "${HOME}"
}

prepare() {
  cd "DiscImageStudio-${pkgver}"
  _dotnet_env
  dotnet restore "${_project}" --disable-build-servers
}

build() {
  cd "DiscImageStudio-${pkgver}"
  _dotnet_env
  dotnet publish "${_project}" \
    --no-restore \
    --disable-build-servers \
    --configuration Release \
    --self-contained false \
    --output "${srcdir}/publish" \
    -p:DebugType=none \
    -p:DebugSymbols=false
}

check() {
  "${srcdir}/publish/${pkgname}" selftest
}

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/publish/." "${pkgdir}/usr/lib/${pkgname}/"
  ln -s "/usr/lib/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "DiscImageStudio-${pkgver}/THIRD-PARTY-NOTICES.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
