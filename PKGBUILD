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
pkgver=7.0.0.sdk100+preview.4.22252.9
_hostver=7.0.0-preview.4.22229.4
_dotnetruntimever=7.0.0-preview.4.22229.4
_aspnetruntimever=7.0.0-preview.4.22251.1
_sdkver=7.0.100-preview.4.22252.9
pkgrel=1
arch=(x86_64 aarch64 armv7h)
url=https://www.microsoft.com/net/core
license=(MIT)
options=(staticlibs)
source=(dotnet.sh
        register-completions.bash
        register-completions.fish
        register-completions.zsh)
source_x86_64=(https://download.visualstudio.microsoft.com/download/pr/322dd9d6-3135-4f8f-aa00-4daf61bc51d0/a4e28f08a42034b276e4536acdd0d7f0/dotnet-sdk-7.0.100-preview.4.22252.9-linux-x64.tar.gz)
source_aarch64=(https://download.visualstudio.microsoft.com/download/pr/a292f0a0-1659-40d0-9893-ea4686be6deb/bef1fadbbe9ebe9ee06ba1cb52e809a2/dotnet-sdk-7.0.100-preview.4.22252.9-linux-arm64.tar.gz)
source_armv7h=(https://download.visualstudio.microsoft.com/download/pr/a292f0a0-1659-40d0-9893-ea4686be6deb/bef1fadbbe9ebe9ee06ba1cb52e809a2/dotnet-sdk-7.0.100-preview.4.22252.9-linux-arm64.tar.gz)
sha512sums=('e61b9e3e5a2305646a616d598378230c9755c5dd5363692cc363f8f4add3807563c324dd86f3a7ae9d358c82d730608e7b293935a2b6c81c0c0f62d752a0a1cf'
            '9f977e0bd12abc0dda4d914f369c58fce502b4030cf91d4248b32242d98fe5a2bbd8446502feeb914561f310dfd3c113bb6da19bfd5dfa6233109e62d22fa966'
            '1de3f09b96c44429b026277bb135a019b7577df2dec5f695ce51d18daefe2c1736b3359ab95f2abc46f7320c445b968e5582df92bb2bcad3ac5cfc5a32d3c5b6'
            'f2be62d9cce00357b7b18ae83b976841037830b7b9ed1b67445f76e02550c904be5ab023366441199f9bb3dfd602004b0334395ffdde6c313910c1da5c39c4a3')
sha512sums_x86_64=('35bd0ed3f22ce9ba2fc9d79ad5e01f75b5c819ee8d5ee2e253e3e8dcfec510a284196afc510c682bab65d56481ee4c400ad86a4c7ef547c24c5188a21f205c90')
sha512sums_aarch64=('a04fbd748c6694e71fb6f3f378a3ef8c8c014d5546e1285825e804e8e8a6677e6d75dd9c0c88f44df8e34ee55103bd1039f21caf294e23d916eb42cc202f469c')
sha512sums_armv7h=('a04fbd748c6694e71fb6f3f378a3ef8c8c014d5546e1285825e804e8e8a6677e6d75dd9c0c88f44df8e34ee55103bd1039f21caf294e23d916eb42cc202f469c')

package_dotnet-host-preview-bin() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview, binary)'
  depends=(glibc)
  provides=(dotnet-host dotnet-host=${_hostver%-*})
  conflicts=(dotnet-host)
  replaces=(dotnet-host-preview-bin)

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
  replaces=(dotnet-runtime-preview-bin)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet/shared,licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.NETCore.App "${pkgdir}"/usr/share/dotnet/shared/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-runtime-preview-bin
}

package_aspnet-runtime-preview-bin() {
  pkgdesc='The ASP.NET Core runtime (preview, binary)'
  depends=(dotnet-runtime-preview-bin)
  provides=(aspnet-runtime=${_aspnetruntimever%-*} aspnet-runtime-7.0)
  conflicts=(aspnet-runtime=${_aspnetruntimever%-*})
  replaces=(aspnet-runtime-preview-bin)

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
  replaces=(dotnet-sdk-preview-bin)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  cp -dr --no-preserve='ownership' sdk sdk-manifests templates "${pkgdir}"/usr/share/dotnet/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/dotnet-sdk-preview-bin
}

# package_netstandard-targeting-pack-preview-bin() {
#   pkgdesc='The .NET Standard targeting pack (preview, binary)'
#   provides=(netstandard-targeting-pack-2.1)
#   conflicts=(netstandard-targeting-pack-2.1)
#   replaces=(netstandard-targeting-pack-preview-bin)

#   install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
#   cp -dr --no-preserve='ownership' packs/NETStandard.Library.Ref "${pkgdir}"/usr/share/dotnet/packs/
#   ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/netstandard-targeting-pack-preview-bin
# }

package_dotnet-targeting-pack-preview-bin() {
  pkgdesc='The .NET Core targeting pack (preview, binary)'
  depends=(netstandard-targeting-pack-2.1)
  provides=(dotnet-targeting-pack=${_dotnetruntimever%-*} dotnet-targeting-pack-7.0)
  conflicts=(dotnet-targeting-pack=${_dotnetruntimever%-*})
  replaces=(dotnet-targeting-pack-preview-bin)

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
  replaces=(aspnet-targeting-pack-preview-bin)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,dotnet/packs,licenses}
  cp -dr --no-preserve='ownership' packs/Microsoft.AspNetCore.App.Ref "${pkgdir}"/usr/share/dotnet/packs/
  ln -s dotnet-host-preview-bin "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-preview-bin
}
