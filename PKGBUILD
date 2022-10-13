# Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Attila Greguss <floyd0122[at]gmail[dot]com>

pkgbase=dotnet-core-preview-bin
pkgname=(
  dotnet-host-preview-bin
  aspnet-runtime-preview-bin
  dotnet-runtime-preview-bin
  dotnet-sdk-preview-bin
  # netstandard-targeting-pack-preview-bin
  dotnet-targeting-pack-preview-bin
  aspnet-targeting-pack-preview-bin
)
pkgver=7.0.0.sdk100+rc.2
_hostver=7.0.0-rc.2.22472.3
_dotnetruntimever=7.0.0-rc.2.22472.3
_aspnetruntimever=7.0.0-rc.2.22476.2
_sdkver=7.0.100-rc.2.22477.23
pkgrel=1
arch=(armv7h aarch64 x86_64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source=(dotnet.sh
        register-completions.bash
        register-completions.fish
        register-completions.zsh)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/0afdf504-a1ed-4605-ab6b-7c7164d5364c/01c39281aa99d2663453546fd853fbb6/dotnet-sdk-7.0.100-rc.2.22477.23-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/8eb03851-3b65-4116-8d6a-f5665e88b90f/901ff01f63c7dd06c3550e0a0cd15587/dotnet-sdk-7.0.100-rc.2.22477.23-linux-arm64.tar.gz)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/f5c74056-330b-452b-915e-d98fda75024e/18076ca3b89cd362162bbd0cbf9b2ca5/dotnet-sdk-7.0.100-rc.2.22477.23-linux-x64.tar.gz)
sha512sums=('e61b9e3e5a2305646a616d598378230c9755c5dd5363692cc363f8f4add3807563c324dd86f3a7ae9d358c82d730608e7b293935a2b6c81c0c0f62d752a0a1cf'
            '9f977e0bd12abc0dda4d914f369c58fce502b4030cf91d4248b32242d98fe5a2bbd8446502feeb914561f310dfd3c113bb6da19bfd5dfa6233109e62d22fa966'
            '1de3f09b96c44429b026277bb135a019b7577df2dec5f695ce51d18daefe2c1736b3359ab95f2abc46f7320c445b968e5582df92bb2bcad3ac5cfc5a32d3c5b6'
            'f2be62d9cce00357b7b18ae83b976841037830b7b9ed1b67445f76e02550c904be5ab023366441199f9bb3dfd602004b0334395ffdde6c313910c1da5c39c4a3')
sha512sums_armv7h=('ac719b627140019a824d114e4d5dcc8d5cfd357406ad62d8a7fb57b9bff49750ccbf40f067a4e525bcb6061aabaa5a657e2c7c36768de2d0f6c31528c5bc172b')
sha512sums_aarch64=('bd5f6fc2bc6783bcf71b4a5c274b2e710336fc031c2577f5ccdb9be2679ce8b15e40fb8e631e2dd18b2359396107fe44d867d341f6fc5daae165f8f238adee17')
sha512sums_x86_64=('22db5d1d16f6fcedfc46f87896920425b5d9b61d09c47d254d6ac731c6d853657882b21faf21f313ed20b33e6331d01b9f723b2c586f0e0cf5acc5ed570b0260')

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
              'msquic>=2.0.0: HTTP/3 support with System.Net.Quic')
  provides=(dotnet-runtime=${_dotnetruntimever%-*} dotnet-runtime-7.0)
  conflicts=(dotnet-runtime=${_dotnetruntimever%-*})
  replaces=(dotnet-runtime-preview)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview-bin
}

package_aspnet-runtime-preview-bin() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=(dotnet-runtime-preview-bin)
  provides=(aspnet-runtime=${_aspnetruntimever%-*} aspnet-runtime-7.0)
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
  provides=(dotnet-sdk=${_sdkver%-*} dotnet-sdk-7.0)
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
  provides=(dotnet-targeting-pack=${_dotnetruntimever%-*} dotnet-targeting-pack-7.0)
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
  provides=(aspnet-targeting-pack=${_aspnetruntimever%-*} aspnet-targeting-pack-7.0)
  conflicts=(aspnet-targeting-pack=${_aspnetruntimever%-*})
  replaces=(aspnet-targeting-pack-preview)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-preview-bin
}
