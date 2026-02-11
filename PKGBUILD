# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=10.0
_Name="CSharpier"
pkgname="${_Name,,}"
pkgver=1.2.6
pkgrel=1
pkgdesc="An opinionated code formatter for C#"
arch=('x86_64')
url="https://csharpier.com"
_url="https://github.com/belav/${pkgname}"
license=('MIT')
depends=("aspnet-runtime-${_sdk}")
makedepends=("dotnet-sdk-${_sdk}")
options=('!strip' '!debug')
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('2f5692b013f9b0acbfc8ed8a21f28e55c2e3371c223f9f505c8867f65d319731a95282e196750da9ee804c1858c938c63ce41e2cc7afada67a4d15238f024bce')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

_srcenv() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
}

prepare() {
  _srcenv
  local dotnet_options=(
    --runtime "linux-${_msarch}"
    --locked-mode
    # --verbosity normal
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet restore "${dotnet_options[@]}" ./"Src/${_Name}.Cli"
  # dotnet restore "${dotnet_options[@]}" ./"Src/${_Name}.Cli.Tests"
}

build() {
  _srcenv
  local dotnet_options=(
    --configuration Release
    --framework "net${_sdk}"
    --no-restore
    --output build
    --no-self-contained
    --runtime "linux-${_msarch}"
    # --verbosity detailed
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet publish "${dotnet_options[@]}" ./"Src/${_Name}.Cli"
  dotnet build-server shutdown

  find "build" -type f \( -name '*.pdb' -o -name '*.config' \) -delete
}

# check() {
#   _srcenv
#   local dotnet_options=(
#     --configuration Release
#     --framework "net${_sdk}"
#     --no-restore
#     --runtime "linux-${_msarch}"
#     # --verbosity detailed
#   )
#
#   cd "${srcdir}/${_pkgsrc}"
#   dotnet test "${dotnet_options[@]}" ./"Src/${_Name}.Cli.Tests"
#   dotnet build-server shutdown
# }

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaP build/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/${_Name}" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
