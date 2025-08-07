# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=10.0
_Name="CSharpier"
pkgname="${_Name,,}"
pkgver=1.1.1
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
b2sums=('7909b77ee047d0ef64947434efb49c859a957b9cadf135cb5e70f9c601fdf6136a4bac927e3461d91d01e0957126d1fde480483c9d73a78154def5b1405fe697')

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
