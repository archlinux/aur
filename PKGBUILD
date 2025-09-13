# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=8.0
_Name="PixiEditor"
pkgname="${_Name,,}"
pkgver=2.0.1.14
pkgrel=1
pkgdesc="All-in-one solution for 2D image editing"
arch=('aarch64' 'x86_64')
url="https://pixieditor.net"
_url="https://github.com/${_Name}/${_Name}"
license=('LGPL-3.0-only')
depends=(
  "dotnet-runtime-${_sdk}"
  'ffmpeg'
  'xdg-utils'
)
makedepends=(
  "dotnet-sdk-${_sdk}"
  "dotnet-sdk>=${_sdk}.19.sdk405"
)
options=('!strip' '!debug')
_pkgsrc="${_url##*/}-${pkgver}"
source=("${_pkgsrc}.tar.gz::${_url}/archive/refs/tags/${pkgver}.tar.gz"
        "${_Name}.desktop")
b2sums=('fb0dd6f2022f3be2da461950931d2ef0daef03282a4e25cb150b06785e9f7cae58d69756a7995f840a76a1d949bb85008c832e717ac1f963b569ca4044bd0256'
        'b9be9f4a0b1ad75b01ebc6a6b57966df3343f0de09ee7ffde3f05dfba140fc6c0e638573c863fad8a77b359039ac3aaba875650226b5df9fa3ec05ba9686fdd0'
        '144fbda5eb66bc2f0265d1f1a5a4f5b31479e11d6a61aca6021a4d8a448fea8890c7f5691df29d978d7008dd086b9ee095aabfe4617fa0b45468bdaf059409d1'
        '55eecc42c8f80dd625103ec059c66f79b1dded25084dacf97f451f8e78a0f810d27ce29408b2de7d8b670a6138e81ccc291890901f2e047a24fddb11d36c930f'
        'a65a5d3e647578ca1fdb01a2695cbb86fec8aadce56806691bb9c83348b23456cde5b26338c955a32c1516ecdcb159c8e2cbb90bc7572ce59b7be49bde9b2f5e'
        '92b281570a8560f6f80288be019d68fd851b255114f1c57ddac37d7fcb70396fb75f0dd6100c1685a53406faf3b5c2a466bd0e5a8463b8faa05aa8783e5379e2')

declare -rAg _modules_name_map=(
  # PixiEditor
  [src/PixiDocks]=https://github.com/PixiEditor/PixiDocks/archive/6e745d0309ad7a00a53f62f2aa362be77903a5fd.tar.gz
  [src/PixiParser]=https://github.com/PixiEditor/PixiParser/archive/d7a83f53f4a0e6a0e0d011cb045ab1f2075e759b.tar.gz
  [src/Drawie]=https://github.com/PixiEditor/Drawie/archive/b6c34c96ac5b01abad69604465445270270270d2.tar.gz
  [src/ColorPicker]=https://github.com/PixiEditor/ColorPicker/archive/943e9abbb60b73c4965b947e987dc2696e0b08f8.tar.gz
)

_get_source_name_string() {
  local host filename name commit
  host=$(echo "$1" | cut -d / -f 3)
  name=$(echo "$1" | cut -d / -f 5)
  filename=${1##*/}
  commit=${filename%%.*}
  case "$host" in
    gitlab.com)
      # It contains $name in $commit
      echo "$commit"
      ;;
    *)
      echo "$name-$commit"
      ;;
  esac
}

_fill_gitmodules_recursively() {
  local gitmodule
  find "${1:-.}" -type f -name .gitmodules | while read -r gitmodule
  do
    if [[ "$gitmodule" =~ ^\.\/ ]]
    then
      gitmodule=${gitmodule#*\.\/}
    fi
    local prefix
    prefix=$(dirname "$gitmodule")"/"
    if [[ "$prefix" =~ ^\.\/ ]]
    then
      prefix=${prefix#*\.\/}
    fi
    echo "Parsing $gitmodule to fill submodules..."
    local p
    grep path "$gitmodule" | awk '{print $3}' | while read -r p
    do
      p=${p%$'\r'} # Remove control characters
      if [[ -n "$p" ]]
      then
        local target url name commit fname
        target="$prefix$p"
        url="${_modules_name_map[$target]}"
        fname=$(_get_source_name_string "$url")
        echo "Filling $target with $srcdir/$fname..."
        cp -r "$srcdir/$fname/." "$target"
        _fill_gitmodules_recursively "$target"
      fi
    done
  done
}

declare _source_str _uri
for _uri in "${_modules_name_map[@]}"; do
  _source_str="$(_get_source_name_string "$_uri").tar.gz::$_uri"
  if [[ "${source[*]/$_source_str/}" == "${source[*]}" ]]
  then
    source+=("$_source_str")
  fi
done
unset _source_str _uri

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
  local dotnet_restore_options=(
    --runtime "linux-${_msarch}"
    --locked-mode
    # --verbosity normal
  )
  local dotnet_restore_projects=(
    PixiEditor.PixiAuth/PixiEditor.PixiAuth.csproj
    PixiParser/src/PixiParser/PixiParser.csproj
    PixiParser/src/PixiParser.Skia/PixiParser.Skia.csproj
    PixiEditor.Zoombox/PixiEditor.Zoombox.csproj
    PixiEditor.UpdateModule/PixiEditor.UpdateModule.csproj
    PixiEditor.WasmApi.Gen/PixiEditor.WasmApi.Gen.csproj
    PixiEditor.SVG/PixiEditor.SVG.csproj
    PixiEditor.Platform/PixiEditor.Platform.csproj
    PixiEditor.UI.Common/PixiEditor.UI.Common.csproj
    PixiEditor.Platform.Standalone/PixiEditor.Platform.Standalone.csproj
    Drawie/src/Drawie.Numerics/Drawie.Numerics.csproj
    Drawie/src/Drawie.Interop.Avalonia/Drawie.Interop.Avalonia.csproj
    Drawie/src/Drawie.Interop.Avalonia.Vulkan/Drawie.Interop.Avalonia.Vulkan.csproj
    Drawie/src/Drawie.Interop.Avalonia.Core/Drawie.Interop.Avalonia.Core.csproj
    Drawie/src/Drawie.Interop.Avalonia.OpenGl/Drawie.Interop.Avalonia.OpenGl.csproj
    Drawie/src/Drawie.Backend.Skia/Drawie.Backend.Skia.csproj
    Drawie/src/DrawiEngine/DrawiEngine.csproj
    Drawie/src/Drawie.Backend.Core/Drawie.Backend.Core.csproj
    ColorPicker/src/ColorPicker.Models/ColorPicker.Models.csproj
    ColorPicker/src/ColorPicker.AvaloniaUI/ColorPicker.AvaloniaUI.csproj
    PixiEditor.OperatingSystem/PixiEditor.OperatingSystem.csproj
    PixiEditor.Linux/PixiEditor.Linux.csproj
    ChunkyImageLib/ChunkyImageLib.csproj
    PixiEditor.IdentityProvider/PixiEditor.IdentityProvider.csproj
    PixiEditor.IdentityProvider.PixiAuth/PixiEditor.IdentityProvider.PixiAuth.csproj
    PixiEditor.Gen/PixiEditor.Gen.csproj
    PixiEditor.Extensions/PixiEditor.Extensions.csproj
    PixiEditor.Extensions.Runtime/PixiEditor.Extensions.Runtime.csproj
    PixiEditor.Extensions.WasmRuntime/PixiEditor.Extensions.WasmRuntime.csproj
    PixiEditor.Extensions.CommonApi/PixiEditor.Extensions.CommonApi.csproj
    PixiEditor.Common/PixiEditor.Common.csproj
    PixiEditor.Desktop/PixiEditor.Desktop.csproj
    PixiEditor.ChangeableDocument.Gen/PixiEditor.ChangeableDocument.Gen.csproj
    PixiEditor.AnimationRenderer.FFmpeg/PixiEditor.AnimationRenderer.FFmpeg.csproj
    PixiEditor/PixiEditor.csproj
    PixiDocks/src/PixiDocks.Core/PixiDocks.Core.csproj
    PixiEditor.AnimationRenderer.Core/PixiEditor.AnimationRenderer.Core.csproj
    Drawie/src/Drawie.Windowing/Drawie.Windowing.csproj
    Drawie/src/Drawie.RenderApi/Drawie.RenderApi.csproj
    Drawie/src/Drawie.RenderApi.Vulkan/Drawie.RenderApi.Vulkan.csproj
    Drawie/src/Drawie.RenderApi.OpenGl/Drawie.RenderApi.OpenGl.csproj
    PixiDocks/src/PixiDocks.Avalonia/PixiDocks.Avalonia.csproj
    PixiEditor.Extensions.CommonApi.Diagnostics/PixiEditor.Extensions.CommonApi.Diagnostics.csproj
    PixiEditor.ChangeableDocument/PixiEditor.ChangeableDocument.csproj
  )

  cd "${srcdir}/${_pkgsrc}"
  _fill_gitmodules_recursively

  cd "src"
  for dotnet_restore_project in "${dotnet_restore_projects[@]}"; do
    dotnet restore "${dotnet_restore_options[@]}" "${dotnet_restore_project}"
  done
}

build() {
  _srcenv
  local dotnet_publish_options=(
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
  dotnet publish "${dotnet_publish_options[@]}" ./src/"${_Name}.Desktop"
  dotnet build-server shutdown
}

package() {
  cd "${srcdir}"
  install -vDm644 "${_Name}.desktop" "${pkgdir}/usr/share/applications/${_Name}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaP build/* "${pkgdir}/usr/lib/${pkgname}/"
  ln -vsf "/usr/lib/${pkgname}/${_Name}.Desktop" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "/usr/lib/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -vsf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname}/ThirdParty/Linux/ffmpeg/ffmpeg"
}
