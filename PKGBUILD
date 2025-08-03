# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=8.0
_Name="Nuke"
pkgname="${_Name,,}"
pkgver=9.0.4
pkgrel=1
pkgdesc="The AKEless Build System for C#/.NET"
arch=('x86_64')
url="https://nuke.build"
_url="https://github.com/nuke-build/${pkgname}"
license=('MIT')
depends=("dotnet-runtime-${_sdk}")
makedepends=("dotnet-sdk-${_sdk}")
options=('!strip' '!debug')
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('80250d5ae27d001fbc5722ec0a62373cd6096318ccaddd27e7a5d0975aef917827759d34ba1c3f2518ba697df47d2fa5273e77450e044299b4f51e37e50a720d')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

_srcenv() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
  export NUKE_TELEMETRY_OPTOUT=true
}

prepare() {
  _srcenv
  local dotnet_options=(
    # --runtime "linux-${_msarch}"
    --locked-mode
    # --verbosity normal
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet restore "${dotnet_restore_options[@]}" ./build/_build.csproj
}

build() {
  _srcenv
  local dotnet_options=(
    --framework "net${_sdk}"
    --configuration Release
    # --runtime "linux-${_msarch}"
    --no-self-contained
    --no-restore
    --output build-makepkg
    # --verbosity detailed
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet publish "${dotnet_options[@]}" ./build/_build.csproj
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaP build-makepkg/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/_build" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
