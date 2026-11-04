# Maintainer: agony <27015 at riseup dot net>

pkgname=disc-image-studio-git
_pkgname=disc-image-studio
pkgver=r64.fb0a598
pkgrel=1
pkgdesc='Generate CD, DVD and Blu-ray images that show a picture on the burned disc (git version)'
arch=('x86_64')
url='https://github.com/JiaFeiMiao-K-Cat/DiscImageStudio'
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-10.0' 'glibc' 'libgcc' 'libstdc++')
makedepends=('dotnet-sdk-10.0' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

_project=src/DiscImageStudio.Cli/DiscImageStudio.Cli.csproj

_dotnet_env() {
  export HOME="${srcdir}/home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1
  export DOTNET_GENERATE_ASPNET_CERTIFICATE=false
  export DOTNET_NOLOGO=1
  export DOTNET_SKIP_WORKLOAD_INTEGRITY_CHECK=1
  mkdir -p "${HOME}"
}

pkgver() {
  cd "${_pkgname}"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${_pkgname}"
  _dotnet_env
  dotnet restore "${_project}" --disable-build-servers
}

build() {
  cd "${_pkgname}"
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
  "${srcdir}/publish/${_pkgname}" selftest
}

package() {
  install -d "${pkgdir}/usr/lib/${_pkgname}" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/publish/." "${pkgdir}/usr/lib/${_pkgname}/"
  ln -s "/usr/lib/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${_pkgname}/THIRD-PARTY-NOTICES.txt" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
