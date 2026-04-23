# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=8.0
_Name="PixiEditor"
pkgname="${_Name,,}"
pkgver=2.1.0.22
pkgrel=1
pkgdesc="All-in-one solution for 2D image editing"
arch=(
  'aarch64'
  'x86_64'
)
url="https://pixieditor.net"
_url="https://github.com/${_Name}/${_Name}"
license=(
  'LGPL-3.0-or-later'
)
depends=(
  "dotnet-runtime-${_sdk}"
  'ffmpeg'
  'hicolor-icon-theme'
  'xdg-utils'
)
makedepends=(
  "dotnet-sdk-${_sdk}-bin"
  'git'
)
options=(
  '!strip'
  '!debug'
)
_pkgsrc="${_url##*/}"
source=(
  "${_pkgsrc}::git+${_url}.git#tag=${pkgver}"
  "${_pkgsrc}-PixiDocks::git+https://github.com/PixiEditor/PixiDocks.git"
  "${_pkgsrc}-PixiParser::git+https://github.com/PixiEditor/PixiParser.git"
  "${_pkgsrc}-Drawie::git+https://github.com/PixiEditor/Drawie.git"
  "${_pkgsrc}-ColorPicker::git+https://github.com/PixiEditor/ColorPicker.git"
)
b2sums=('48fe14a4a2e5905e51c670d69fa37e8ddc651acdd6ddc225fbffd73f7dfebd291082e255558f48f604b99aaa1962b15a4d7212e9a38e7c6d0f6d311ef4164791'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

if   [ "${CARCH}" = 'aarch64' ]; then _msarch=arm64;
elif [ "${CARCH}" = 'armv7h'  ]; then _msarch=arm;
elif [ "${CARCH}" = 'i686'    ]; then _msarch=x86;
elif [ "${CARCH}" = 'x86_64'  ]; then _msarch=x64; fi

_source() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
}

prepare() {
  _source
  local dotnet_options=(
    --runtime "linux-${_msarch}"
    --locked-mode
  )

  cd "${srcdir}/${_pkgsrc}"
  git submodule init
  git config submodule.src/PixiDocks.url   "${srcdir}/${_pkgsrc}-PixiDocks"
  git config submodule.src/PixiParser.url  "${srcdir}/${_pkgsrc}-PixiParser"
  git config submodule.src/Drawie.url      "${srcdir}/${_pkgsrc}-Drawie"
  git config submodule.src/ColorPicker.url "${srcdir}/${_pkgsrc}-ColorPicker"
  git -c protocol.file.allow=always submodule update

  dotnet restore "${dotnet_options[@]}" ./"src/${_Name}.Desktop"

  cd "assets/flatpak"
  sed -e "s/${pkgname}.sh/${pkgname}/g" \
      -i "net.pixieditor.PixiEditor.desktop"
}

build() {
  _source
  local dotnet_options=(
    --configuration Release
    --framework "net${_sdk}"
    # --no-restore # TODO
    --output build
    --no-self-contained
    --runtime "linux-${_msarch}"
    # --verbosity detailed
    -p:DebugType=None
    -p:DebugSymbols=false
  )

  cd "${srcdir}/${_pkgsrc}"
  dotnet publish "${dotnet_options[@]}" ./"src/${_Name}.Desktop"
  dotnet build-server shutdown
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaT --no-preserve=ownership "build" "${pkgdir}/usr/lib/${pkgname}"
  ln -vsf "/usr/lib/${pkgname}/${_Name}.Desktop" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  cd "assets/flatpak"
  install -vDm644 "icon-512.png" \
    "${pkgdir}/usr/share/icons/hicolor/512x512/apps/net.pixieditor.PixiEditor.png"
  install -vDm644 "net.pixieditor.PixiEditor.desktop" \
    "${pkgdir}/usr/share/applications/net.pixieditor.PixiEditor.desktop"
  install -vDm644 net.pixieditor.PixiEditor.metainfo.xml \
    "${pkgdir}/usr/share/metainfo/net.pixieditor.PixiEditor.metainfo.xml"
  install -vDm644 net.pixieditor.PixiEditor-mime.xml \
    "${pkgdir}/usr/share/mime/packages/net.pixieditor.PixiEditor.xml"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "/usr/lib/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -vsf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname}/ThirdParty/Linux/ffmpeg/ffmpeg"
}
