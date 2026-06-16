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
pkgver=9.0.17.sdk118
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
b2sums=('bdd6a0470cf6d36f398f947f15bb5a9eea434453b06a95c425c093537be6151d0d83a7f381132562f400a69bd640f97952b76ce44699faa412891c8134b38619')

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
    gcc-libs
    glibc
    icu
    krb5
    libunwind
    zlib
    openssl
  )
  optdepends=('lttng-ust2.12: CoreCLR tracing')

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner shared/Microsoft.NETCore.App
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-runtime-9.0
}

package_aspnet-runtime-9.0() {
  pkgdesc='The ASP.NET Core runtime'
  depends=(dotnet-runtime-9.0)

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
    gcc-libs
    netstandard-targeting-pack
  )
  optdepends=('aspnet-targeting-pack: Build ASP.NET Core applications')

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner sdk sdk-manifests templates
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-sdk-9.0
}

package_dotnet-targeting-pack-9.0() {
  pkgdesc='The .NET Core targeting pack'
  depends=(netstandard-targeting-pack)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner packs/Microsoft.NETCore.App.{Host.arch-*,Ref}
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-9.0
}

package_aspnet-targeting-pack-9.0() {
  pkgdesc='The ASP.NET Core targeting pack'
  depends=(dotnet-targeting-pack-9.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf dotnet/artifacts/assets/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-*.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner packs/Microsoft.AspNetCore.App.Ref
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-9.0
}

package_dotnet-source-built-artifacts-9.0() {
  pkgdesc='Internal package for building the .NET Core SDK'

  install -Dm 644 dotnet/artifacts/assets/Release/Private.SourceBuilt.Artifacts.*.tar.gz -t "${pkgdir}"/usr/share/dotnet/source-built-artifacts/
}

# vim: ts=2 sw=2 et:
