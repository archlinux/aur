# Maintainer: Aaron Robinson <aaronrobin1234@gmail.com>
# Former Maintainer: Florian Maunier <fmauneko@dissidence.ovh>
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
pkgver=9.0.0.sdk100+preview.1
_hostver=9.0.0-preview.1.24080.9
_dotnetruntimever=9.0.0-preview.1.24080.9
_aspnetruntimever=9.0.0-preview.1.24081.5
_sdkver=9.0.100-preview.1.24101.2
pkgrel=1
arch=(armv7h aarch64 x86_64)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source=(dotnet.sh
        register-completions.bash
        register-completions.fish
        register-completions.zsh)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/f5e9fc40-e56c-4276-bcf8-3ecf80f7c1a7/94900c87e4529a89ac71d164665088c7/dotnet-sdk-9.0.100-preview.1.24101.2-linux-arm.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/e8743929-2c7b-4410-88f5-5f247040b498/ff454c589dc8d5dd9cb42e0950f34a69/dotnet-sdk-9.0.100-preview.1.24101.2-linux-arm64.tar.gz)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/f51b05d4-bc43-4290-9b33-aaa212edbba6/e10559d91242409faf5c37cb529de8f3/dotnet-sdk-9.0.100-preview.1.24101.2-linux-x64.tar.gz)
sha512sums=('e61b9e3e5a2305646a616d598378230c9755c5dd5363692cc363f8f4add3807563c324dd86f3a7ae9d358c82d730608e7b293935a2b6c81c0c0f62d752a0a1cf'
            '9f977e0bd12abc0dda4d914f369c58fce502b4030cf91d4248b32242d98fe5a2bbd8446502feeb914561f310dfd3c113bb6da19bfd5dfa6233109e62d22fa966'
            '1de3f09b96c44429b026277bb135a019b7577df2dec5f695ce51d18daefe2c1736b3359ab95f2abc46f7320c445b968e5582df92bb2bcad3ac5cfc5a32d3c5b6'
            'f2be62d9cce00357b7b18ae83b976841037830b7b9ed1b67445f76e02550c904be5ab023366441199f9bb3dfd602004b0334395ffdde6c313910c1da5c39c4a3')
sha512sums_armv7h=('fa14b4545688097f490b9730a9063a3f7e7b779fd57a4bee43e61ef6f61c6aa5ba33ae5e1c8e0bc13dd060709d3eebbd04b044e06a9a70eecc73243db4107086')
sha512sums_aarch64=('b7c29e4e4baf2d2ba7b29fc5a080df708c5a915e6fb1ce2ff93ffc8f18e7725fae5d569ab1349ef4b067d05d00886a17c8d1a95e211602db1ee5da820b5edefd')
sha512sums_x86_64=('e176126d9a12075d91a0ad2b4dd50021a564258742d86560bd216ac36482c763087bd8affc68fe9a8d3c46f61f864bc2c7c2e455739d21614516c4f73fd281fd')

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
  provides=(dotnet-runtime=${_dotnetruntimever%-*} dotnet-runtime-9.0)
  conflicts=(dotnet-runtime=${_dotnetruntimever%-*})
  replaces=(dotnet-runtime-preview)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview-bin
}

package_aspnet-runtime-preview-bin() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=(dotnet-runtime-preview-bin)
  provides=(aspnet-runtime=${_aspnetruntimever%-*} aspnet-runtime-9.0)
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
  provides=(dotnet-sdk=${_sdkver%-*} dotnet-sdk-9.0)
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
  provides=(dotnet-targeting-pack=${_dotnetruntimever%-*} dotnet-targeting-pack-9.0)
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
  provides=(aspnet-targeting-pack=${_aspnetruntimever%-*} aspnet-targeting-pack-9.0)
  conflicts=(aspnet-targeting-pack=${_aspnetruntimever%-*})
  replaces=(aspnet-targeting-pack-preview)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-preview-bin
}
