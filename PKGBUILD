# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-preview-bin
pkgname=(
  dotnet-host-preview-bin
  aspnet-runtime-preview-bin
  dotnet-runtime-preview-bin
  dotnet-sdk-preview-bin
  # netstandard-targeting-pack-preview-bin
  dotnet-targeting-pack-preview-bin
  aspnet-targeting-pack-preview-bin
)
pkgver=8.0.0.sdk100+preview.6
_hostver=8.0.0-preview.6.23329.7
_dotnetruntimever=8.0.0-preview.6.23329.7
_aspnetruntimever=8.0.0-preview.6.23329.11
_sdkver=8.0.100-preview.6.23330.14
pkgrel=1
arch=(armv7h aarch64 x86_64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source=(dotnet.sh
        register-completions.bash
        register-completions.fish
        register-completions.zsh)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/d5859f18-7182-405d-b933-bf83cb96673c/dddba064f022527ff32778023d0f36b6/dotnet-sdk-8.0.100-preview.6.23330.14-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/46626be9-8672-4c2c-b149-3233496e4372/fb49425c9eeb4f05291a9f57250c0e0d/dotnet-sdk-8.0.100-preview.6.23330.14-linux-arm64.tar.gz)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/0ce806be-89f7-4264-ad1b-6ff1887e7b6b/08a75d03919470fba420b970a7565ef5/dotnet-sdk-8.0.100-preview.6.23330.14-linux-x64.tar.gz)
sha512sums=('e61b9e3e5a2305646a616d598378230c9755c5dd5363692cc363f8f4add3807563c324dd86f3a7ae9d358c82d730608e7b293935a2b6c81c0c0f62d752a0a1cf'
            '9f977e0bd12abc0dda4d914f369c58fce502b4030cf91d4248b32242d98fe5a2bbd8446502feeb914561f310dfd3c113bb6da19bfd5dfa6233109e62d22fa966'
            '1de3f09b96c44429b026277bb135a019b7577df2dec5f695ce51d18daefe2c1736b3359ab95f2abc46f7320c445b968e5582df92bb2bcad3ac5cfc5a32d3c5b6'
            'f2be62d9cce00357b7b18ae83b976841037830b7b9ed1b67445f76e02550c904be5ab023366441199f9bb3dfd602004b0334395ffdde6c313910c1da5c39c4a3')
sha512sums_armv7h=('bffe374b1a16e285ef5eae8f9ab89fb7e8fb576c7f9e1853f42561297dc7edc2280301ccf3d9f909c8468bdfa9064bdc9a05946e539cf9b7084133cf29dca6f1')
sha512sums_aarch64=('b7c83b9e6fb713a6b59b700bbc53cf929514ffd7a63870e021934c59349b40126c898c1b7428acb579d14973d6d2783a96956233eb36ffff299a5aa39f07730b')
sha512sums_x86_64=('ef568a1ecf6140237249544673a52dc496cff682d1a078e9309d195d78e632b3870b7fb23eb38cae7b0638c564f6aa340ca2e209c4ae4fbcddb84073138e8a08')

package_dotnet-host-preview-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview, binary)'
  depends=(glibc)
  provides=(dotnet-host dotnet-host=${_hostver%-*})
  conflicts=(dotnet-host)
  replaces=(dotnet-host-preview)

  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{dotnet,licenses/dotnet-host-preview-bin}}
  cp -dr --no-preserve='ownership' dotnet host "${pkgdir}"/usr/share/dotnet/
  cp -dr --no-preserve='ownership' LICENSE.txt ThirdPartyNotices.txt "${pkgdir}"/usr/share/licenses/dotnet-host-preview-bin
  ln -sf /usr/share/dotnet/dotnet "${pkgdir}"/usr/bin/dotnet
  ln -sf /usr/share/dotnet/host/fxr/"${_hostver}"/libhostfxr.so "${pkgdir}"/usr/lib/libhostfxr.so
  install -Dm 644 "${srcdir}"/dotnet.sh -t "${pkgdir}"/etc/profile.d/
  install -Dm 644 "${srcdir}"/register-completions.bash "${pkgdir}"/usr/share/bash-completion/completions/dotnet
  install -Dm 644 "${srcdir}"/register-completions.fish "${pkgdir}"/usr/share/fish/vendor_completions.d/dotnet.fish
  install -Dm 644 "${srcdir}"/register-completions.zsh "${pkgdir}"/usr/share/zsh/site-functions/_dotnet
}

package_dotnet-runtime-preview-bin() {
  pkgdesc='The .NET Core runtime (preview, binary)'
  depends=(
    "dotnet-host>=${_hostver%-*}"
    glibc 
    icu
    krb5
    libcurl.so
    libunwind
    openssl
    zlib
  )

  optdepends=('lttng-ust: CoreCLR tracing'
              'msquic>=2.1.0: HTTP/3 support with System.Net.Quic')
  provides=(dotnet-runtime=${_dotnetruntimever%-*} dotnet-runtime-8.0)
  conflicts=(dotnet-runtime=${_dotnetruntimever%-*})
  replaces=(dotnet-runtime-preview)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview-bin
}

package_aspnet-runtime-preview-bin() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=(dotnet-runtime-preview-bin)
  provides=(aspnet-runtime=${_aspnetruntimever%-*} aspnet-runtime-8.0)
  conflicts=(aspnet-runtime=${_aspnetruntimever%-*})
  replaces=(aspnet-runtime-preview)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/aspnet-runtime-preview-bin
}

package_dotnet-sdk-preview-bin() {
  pkgdesc='The .NET Core SDK (preview, binary)'
  depends=(
    dotnet-runtime-preview-bin
    dotnet-targeting-pack-preview-bin
    glibc
    netstandard-targeting-pack-2.1
  )
  optdepends=('aspnet-targeting-pack-preview-bin: Build ASP.NET Core applications')
  provides=(dotnet-sdk=${_sdkver%-*} dotnet-sdk-8.0)
  conflicts=(dotnet-sdk=${_sdkver%-*})
  replaces=(dotnet-sdk-preview)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-preview-bin
}

# package_netstandard-targeting-pack-preview-bin() {
#   pkgdesc='The .NET Standard targeting pack (preview, binary)'
#   provides=(netstandard-targeting-pack-2.1)
#   conflicts=(netstandard-targeting-pack-2.1)
#   replaces=(netstandard-targeting-pack-preview)

#   install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
#   cp -dr --no-preserve='ownership' packs/NETStandard.Library.Ref "${pkgdir}"/usr/share/dotnet/packs/
#   ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/netstandard-targeting-pack-preview-bin
# }

package_dotnet-targeting-pack-preview-bin() {
  pkgdesc='The .NET Core targeting pack (preview, binary)'
  depends=(netstandard-targeting-pack-2.1)
  provides=(dotnet-targeting-pack=${_dotnetruntimever%-*} dotnet-targeting-pack-8.0)
  conflicts=(dotnet-targeting-pack=${_dotnetruntimever%-*})
  replaces=(dotnet-targeting-pack-preview)

  if [ $CARCH = 'x86_64' ]; then msarch=x64;
  elif [ $CARCH = 'aarch64' ]; then msarch=arm64;
  elif [ $CARCH = 'armv7h' ]; then msarch=arm; fi

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.NETCore.App.{Host.linux-${msarch},Ref} "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-preview-bin
}

package_aspnet-targeting-pack-preview-bin() {
  pkgdesc='The ASP.NET Core targeting pack (preview, binary)'
  depends=(dotnet-targeting-pack-preview-bin)
  provides=(aspnet-targeting-pack=${_aspnetruntimever%-*} aspnet-targeting-pack-8.0)
  conflicts=(aspnet-targeting-pack=${_aspnetruntimever%-*})
  replaces=(aspnet-targeting-pack-preview)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-preview-bin
}
