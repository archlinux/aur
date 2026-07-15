# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kristian Mosegaard <kristian@mosen.me>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Krzysztof Bogacki <krzysztof.bogacki@leancode.pl>

pkgbase=dotnet-core-9.0
pkgname=(
 dotnet-runtime-9.0
 aspnet-runtime-9.0
 dotnet-sdk-9.0
 dotnet-targeting-pack-9.0
 aspnet-targeting-pack-9.0
 dotnet-source-built-artifacts-9.0
)
pkgver=9.0.18.sdk119
pkgrel=1
arch=(x86_64)
url=https://dotnet.microsoft.com
license=(MIT)
makedepends=(
  bash
  clang20
  cmake
  dotnet-sdk-9.0
  dotnet-source-built-artifacts-9.0
  git
  icu
  krb5
  libgit2
  libunwind
  libxml2
  lldb
  llvm20
  lttng-ust2.12
  nodejs
  openssl
  systemd
  zlib
)
optdepends=('bash-completion: Bash completion support')
options=(
  !lto
  staticlibs
)
_tag=14d5ddefede18b29eb0f2ea918c79861a5211177
source=(git+https://github.com/dotnet/dotnet.git#tag=v${pkgver/.*.sdk/.0.})
b2sums=('671a7c3ee9b7e86ce48e5a2441a6f45438de223a9de366ea55bf198d9abf8fedc54a3861577f332e26cf3993a39b7d0c2b5393566ccb67bd8cdbd656b437420b')

prepare() {
  cd dotnet

  # fix bootstrap
  git remote set-url origin https://github.com/dotnet/dotnet.git

  local _bootstrapver=$(xmllint --xpath "//*[local-name()='PrivateSourceBuiltSdkVersion']/text()" eng/Versions.props)
  local _previousver=$(pacman -Q dotnet-source-built-artifacts | sed -r 's/.*([0-9]+\.[0-9]+)\.[0-9]+\.sdk([0-9]+)-.*/\1.\2/')

  if [[ $_bootstrapver == $_previousver ]]; then
    cp -r /usr/share/dotnet .dotnet
    ln -sf /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz prereqs/packages/archive/
  fi
  ./prep-source-build.sh
}

build() {
  cd dotnet

  export COMPlus_LTTng=0
  export VERBOSE=1
  export OPENSSL_ENABLE_SHA1_SIGNATURES=1

  export PATH="/usr/lib/llvm20/bin:$PATH"

  # this uses malloc_usable_size, which is incompatible with fortification level 3
  CFLAGS="${CFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"
  CXXFLAGS="${CXXFLAGS/_FORTIFY_SOURCE=3/_FORTIFY_SOURCE=2}"

  CFLAGS=$(echo $CFLAGS  | sed -e 's/-fstack-clash-protection//' )
  CXXFLAGS=$(echo $CXXFLAGS  | sed -e 's/-fstack-clash-protection//' )
  export EXTRA_CFLAGS="$CFLAGS"
  export EXTRA_CXXFLAGS="$CXXFLAGS"
  export EXTRA_LDFLAGS="$LDFLAGS"
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  ./build.sh --clean-while-building --online --source-build
}

package_dotnet-runtime-9.0() {
  pkgdesc='The .NET Core runtime'
  depends=(
    dotnet-host
    glibc
    libgcc
    libstdc++
    icu
    krb5
    libunwind
    zlib
    openssl
  )
  optdepends=('lttng-ust2.12: CoreCLR tracing')
  provides=(dotnet-runtime=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner shared/Microsoft.NETCore.App
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-runtime-9.0
}

package_aspnet-runtime-9.0() {
  pkgdesc='The ASP.NET Core runtime'
  depends=(dotnet-runtime-9.0)
  provides=(aspnet-runtime=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner shared/Microsoft.AspNetCore.App
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-runtime-9.0
}

package_dotnet-sdk-9.0() {
  pkgdesc='The .NET Core SDK'
  depends=(
    dotnet-runtime-9.0
    dotnet-targeting-pack-9.0
    glibc
    libgcc
    libstdc++
    netstandard-targeting-pack
  )
  optdepends=('aspnet-targeting-pack: Build ASP.NET Core applications')
  provides=(dotnet-sdk=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner sdk sdk-manifests templates
  install -dm 755 "${pkgdir}"/usr/share/dotnet/metadata/workloads/${pkgver%.*.sdk*}.${pkgver#*.sdk}
  touch "${pkgdir}"/usr/share/dotnet/metadata/workloads/${pkgver%.*.sdk*}.${pkgver#*.sdk}/userlocal
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-sdk-9.0
}

package_dotnet-targeting-pack-9.0() {
  pkgdesc='The .NET Core targeting pack'
  depends=(netstandard-targeting-pack)
  provides=(dotnet-targeting-pack=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner packs/Microsoft.NETCore.App.{Host.arch-*,Ref}
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-9.0
}

package_aspnet-targeting-pack-9.0() {
  pkgdesc='The ASP.NET Core targeting pack'
  depends=(dotnet-targeting-pack-9.0)
  provides=(aspnet-targeting-pack=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner packs/Microsoft.AspNetCore.App.Ref
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-9.0
}

package_dotnet-source-built-artifacts-9.0() {
  pkgdesc='Internal package for building the .NET Core SDK'
  provides=(dotnet-source-built-artifacts=${pkgver%.*.sdk*})

  install -Dm 644 dotnet/artifacts/assets/Release/Private.SourceBuilt.Artifacts.*.tar.gz -t "${pkgdir}"/usr/share/dotnet/source-built-artifacts/
}
