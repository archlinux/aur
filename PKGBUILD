# Maintainer: agony <27015 at riseup dot net>

pkgname=kiota
pkgver=1.38.0
pkgrel=1
pkgdesc='OpenAPI based HTTP client code generator'
arch=('x86_64')
url='https://github.com/microsoft/kiota'
license=('MIT')
depends=('dotnet-runtime-10.0' 'glibc' 'libgcc' 'libstdc++')
makedepends=('dotnet-sdk-10.0')
options=('!debug')
install=kiota.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b69b1981d4405224a5dbe02c21f43be9c753e5dd99c1f499b8af269a24fc1488')

_project=src/kiota/kiota.csproj

_dotnet_env() {
  export HOME="${srcdir}/home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_GENERATE_ASPNET_CERTIFICATE=false
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
  mkdir -p "${HOME}"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  _dotnet_env
  # global.json pins SDK 10.0.402, newer than the SDK in extra
  rm global.json
  dotnet restore "${_project}" --disable-build-servers
}

build() {
  cd "${pkgname}-${pkgver}"
  _dotnet_env
  dotnet publish "${_project}" \
    --no-restore \
    --disable-build-servers \
    --configuration Release \
    --framework net10.0 \
    --self-contained false \
    --output "${srcdir}/publish" \
    -p:EnableSourceControlManagerQueries=false \
    -p:DebugType=none \
    -p:DebugSymbols=false
}

check() {
  _dotnet_env
  KIOTA_OFFLINE_ENABLED=true KIOTA_CLI_TELEMETRY_OPTOUT=1 \
    "${srcdir}/publish/kiota" info -l Java | grep -q 'maturity level'
}

package() {
  install -d "${pkgdir}/usr/lib/${pkgname}" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/publish/." "${pkgdir}/usr/lib/${pkgname}/"
  ln -s "/usr/lib/${pkgname}/kiota" "${pkgdir}/usr/bin/kiota"
  install -Dm644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
