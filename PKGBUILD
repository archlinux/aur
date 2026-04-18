# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_sdk=8.0
_Name="PixiEditor"
pkgname="${_Name,,}"
pkgver=2.1.0.20
pkgrel=1
pkgdesc="All-in-one solution for 2D image editing"
arch=(
  'aarch64'
  'x86_64'
)
url="https://pixieditor.net"
_url="https://github.com/${_Name}/${_Name}"
license=(
  'LGPL-3.0-only'
)
depends=(
  "dotnet-runtime-${_sdk}"
  'ffmpeg'
  'xdg-utils'
)
makedepends=(
  "dotnet-sdk-${_sdk}-bin"
)
options=(
  '!strip'
  '!debug'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/${pkgver}/${_pkgsrc}.tar.gz"
  "${pkgname}.desktop"
)
b2sums=('ae5667db72f2b99deadd8e4604d3f0c28917102a518ce2704d257b396e86147a561155d5f749edfd3d71c5b70289953ce6bcb0f3db7e92e04f49d89a88400ef7'
        'b9be9f4a0b1ad75b01ebc6a6b57966df3343f0de09ee7ffde3f05dfba140fc6c0e638573c863fad8a77b359039ac3aaba875650226b5df9fa3ec05ba9686fdd0'
        '7925d2bc21b10bde1f03ada83ae2e0d9f49718786ec8a99a3fade686931c033a77cd367f8e5f83db7bde6c868137daf8b06980d5778fea2b45b0ef0248485ad7'
        '421ffd4469be4c6fcbbfd991a50388d82181b33eac95b3a53fa47c1427ef22b55b7ba6519e427b27034cfd334380be7775d966b52ab0d9d5529bd27f255da80b'
        '4e60933e88247d24fba03536869cb89ec08fb242457f9a5bd2e947f0dca8dbf561e62d6ab22cf5baa26280df8ee1dc72d89a050b9a991c97fa22da3649f70c43'
        '42db7ac7ed50d9b98b520b7e76ddb581ce0f25ec38f70e513d7ca1344e8c997c36b821424e512d08050725c4242ffa90fbe19640e2aa3f76396587fc08bf6d6c')

declare -rAg _modules_name_map=(
  # PixiEditor
  [src/PixiDocks]=https://github.com/PixiEditor/PixiDocks/archive/382f6a56e90c834d9cd39612c9fa6394be698c8f.tar.gz
  [src/PixiParser]=https://github.com/PixiEditor/PixiParser/archive/092d1f659506cfe6cb2a23dceeb0e17ba1234921.tar.gz
  [src/Drawie]=https://github.com/PixiEditor/Drawie/archive/f887e90902a14e1a974b0801f1f6b40777a33062.tar.gz
  [src/ColorPicker]=https://github.com/PixiEditor/ColorPicker/archive/90fc721d36e604a78bacfc101aae0ad893ff0f1b.tar.gz
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

_source() {
  export NUGET_PACKAGES="${srcdir}/.nuget"
  export DOTNET_SKIP_FIRST_TIME_EXPERIENCE=true
  export DOTNET_NOLOGO=true
  export DOTNET_CLI_TELEMETRY_OPTOUT=true
}

prepare() {
  _source
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
  _source
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
  dotnet publish "${dotnet_publish_options[@]}" ./"src/${_Name}.Desktop"
  dotnet build-server shutdown
}

package() {
  cd "${srcdir}"
  install -vDm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${_Name}.desktop"

  cd "${_pkgsrc}"
  install -vd "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/${pkgname}"
  cp -vaT --no-preserve=ownership ./"build" "${pkgdir}/usr/lib/${pkgname}"
  ln -vsf "/usr/lib/${pkgname}/${_Name}.Desktop" "${pkgdir}/usr/bin/${pkgname}"

  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -vd "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -vsf "/usr/lib/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ln -vsf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname}/ThirdParty/Linux/ffmpeg/ffmpeg"
}
