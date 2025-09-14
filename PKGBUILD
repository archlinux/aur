# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=9.0
_Name="Source2Viewer-CLI"
pkgname="${_Name,,}"
pkgver=14.1
pkgrel=1
pkgdesc="Browse VPK archives, view, extract, and decompile Source 2 assets, including maps, models, materials, textures, sounds"
arch=('x86_64')
url="https://s2v.app"
_url="https://github.com/ValveResourceFormat/ValveResourceFormat"
license=('MIT')
depends=(
  "dotnet-runtime-${_sdk}"
)
makedepends=(
  "dotnet-sdk-${_sdk}"
  'git'
)
provides=(
  'vrf-decompiler'
)
conflicts=(
  'vrf-decompiler'
)
replaces=(
  'vrf-decompiler'
)
options=('!strip' '!debug')
_pkgsrc="${_url##*/}"
source=("${_pkgsrc}::git+${_url}.git#tag=${pkgver}?signed")
b2sums=('3eff16231584cfef151f3bd6e76cc8255d9b315ae6664e477861f4db7621a586dbe646d4cf83dbff30ddd8c83d9a056f89e2cff11fbe516762367ba18f21405c')
validpgpkeys=('E58081FB804DF24DF217AB772B6E7BF31D171C61') # Pavel Djundik (GitHub) <xPaw@users.noreply.github.com> (https://github.com/xPaw.gpg)

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
  dotnet restore "${dotnet_options[@]}" ./"CLI"
  dotnet restore "${dotnet_options[@]}" ./"Tests"
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
    -p:DebugType=None
    -p:DebugSymbols=false
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet publish "${dotnet_options[@]}" ./"CLI"
  dotnet build-server shutdown
}

check() {
  _srcenv
  local dotnet_options=(
   --configuration Release
    --framework "net${_sdk}"
    --no-restore
    --runtime "linux-${_msarch}"
    # --verbosity detailed
    -p:Include='[ValveResourceFormat*]*'
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet test "${dotnet_options[@]}" ./"Tests"
  dotnet build-server shutdown
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -va --no-preserve=ownership build/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/${_Name}" "${pkgdir}/usr/bin/${_Name}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
