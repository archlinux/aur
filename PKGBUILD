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
pkgver=8.0.0.sdk100+preview.5
_hostver=8.0.0-preview.5.23280.8
_dotnetruntimever=8.0.0-preview.5.23280.8
_aspnetruntimever=8.0.0-preview.5.23302.2
_sdkver=8.0.100-preview.5.23303.2
pkgrel=1
arch=(armv7h aarch64 x86_64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source=(dotnet.sh
        register-completions.bash
        register-completions.fish
        register-completions.zsh)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/bec1bcaf-802f-4337-99ea-dc775f4db430/d6c60f6694b77394cd75d2a2f6ecab7c/dotnet-sdk-8.0.100-preview.5.23303.2-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/93db1aea-6913-4cdc-8129-23e3e3de8dd1/4a942a2fbbb6ca6667c01ec414096ee0/dotnet-sdk-8.0.100-preview.5.23303.2-linux-arm64.tar.gz)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/07b027f8-4ef8-48cb-becc-132652c625bb/441ef662adfe931013745df24d53b26d/dotnet-sdk-8.0.100-preview.5.23303.2-linux-x64.tar.gz)
sha512sums=('e61b9e3e5a2305646a616d598378230c9755c5dd5363692cc363f8f4add3807563c324dd86f3a7ae9d358c82d730608e7b293935a2b6c81c0c0f62d752a0a1cf'
            '9f977e0bd12abc0dda4d914f369c58fce502b4030cf91d4248b32242d98fe5a2bbd8446502feeb914561f310dfd3c113bb6da19bfd5dfa6233109e62d22fa966'
            '1de3f09b96c44429b026277bb135a019b7577df2dec5f695ce51d18daefe2c1736b3359ab95f2abc46f7320c445b968e5582df92bb2bcad3ac5cfc5a32d3c5b6'
            'f2be62d9cce00357b7b18ae83b976841037830b7b9ed1b67445f76e02550c904be5ab023366441199f9bb3dfd602004b0334395ffdde6c313910c1da5c39c4a3')
sha512sums_armv7h=('31c2ecf28823ea90314f0670b0798d02577cde76ad1b84f6ed987aa93e699e3c257f160c3da5417e09b8c20516c2b4740a2ca0f70dffc0b14c5340fba1fcef37')
sha512sums_aarch64=('13c6c559646c359ce07584328ef2e5cf5cb70371197deea9d31caee249c45b07ec1b874bcc5e3cb3b601b5ae280883cda555fd4cd2bf4a255d3be431574e46d6')
sha512sums_x86_64=('dfe2085a92854a5cee84cb7be9344368f5dcb6333c4ca215375a34b862f3a3ee66c953b9957f7b46f6cd710992ee038f6b4c2bd16464b4a216a1785868e86f7c')

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
