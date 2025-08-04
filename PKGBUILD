# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=6.0
_Name="Myriad"
pkgname="${_Name,,}"
pkgver=0.8.3
pkgrel=1
pkgdesc="Code generator for F#"
arch=('x86_64')
url="https://github.com/MoiraeSoftware/${_Name}"
license=('Apache-2.0')
depends=("dotnet-runtime-${_sdk}")
makedepends=("dotnet-sdk-${_sdk}" "dotnet-sdk>=${_sdk}.36.sdk202")
options=('!strip' '!debug')
_pkgsrc="${url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1d177b0a4f3a5847b96ad1ec0897cdb51ef65652bc354841246ef8eb4a810490d69c1deadff31b4a81d3de33b0e79fa015bb9f8042f932458b23405ac409db5c')

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
  dotnet tool restore
  # dotnet paket restore --target-framework "net${_sdk}"
  dotnet restore "${dotnet_options[@]}" ./src/Myriad/Myriad.fsproj
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
  dotnet publish "${dotnet_options[@]}" ./src/Myriad/Myriad.fsproj
  dotnet build-server shutdown

  find "build" -type f \( -name '*.pdb' -o -name '*.config' \) -delete
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaP build/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/${_Name}" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
