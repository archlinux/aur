# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kristian Mosegaard <kristian@mosen.me>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Krzysztof Bogacki <krzysztof.bogacki@leancode.pl>

pkgbase=dotnet-core-6.0
pkgname=(
 dotnet-runtime-6.0
 dotnet-source-built-artifacts-6.0
 aspnet-runtime-6.0
 dotnet-sdk-6.0
 dotnet-targeting-pack-6.0
 aspnet-targeting-pack-6.0
)
pkgver=6.0.18.sdk118
_bootstrapver=6.0.116
pkgrel=1
arch=(x86_64)
url=https://www.microsoft.com/net/core
license=(MIT)
makedepends=(
  bash
  clang
  cmake
  dotnet-sdk-6.0
  git
  icu
  inetutils
  krb5
  libgit2
  libunwind
  libxml2
  lldb
  llvm
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
_tag=b8b476fbe60becae6d0c3d36b7ba964aeee3523d
source=(
  dotnet-installer::git+https://github.com/dotnet/installer.git#tag=${_tag}
  https://dotnetcli.azureedge.net/source-built-artifacts/assets/Private.SourceBuilt.Artifacts.${_bootstrapver}.tar.gz
  dotnet.sh
  dotnet-core-runtime-disable-package-validation.patch
  dotnet-core-sdk-telemetry-optout.patch
)
noextract=(Private.SourceBuilt.Artifacts.${_bootstrapver}.tar.gz)
b2sums=('SKIP'
        'abb1b6c9b647f0b34c21cac349ca63a9c1907e491ab39169398c35413ea8394880c2544e828940304bc9a45a3a5a1845d6017e6aba6350ebac7df9a09509bf29'
        '4a64e3ee550e296bdde894f9202c6f372934cc29154f47d302599b4c368825a96a7b786faa6109a24a1101ff130fd9e4d0ccba094ec91e7f2ca645725bf71b34'
        'b9472b3967c9d7549ee2bbf0180d919748b40b1f9a65b1c3789be40f62ed17a9d37c2020409f7835570620108bd5ec43e728966d075d66bf0b7261cdd36a60c3'
        '95b083b842da6049a084ca015b7ddc099550aa818fc382d556cca832fee52265be568d20a2c50e70819aef6cf879e7a368f7dd3b5966356643b2efdd756e73f4')

prepare() {
  cp -r /usr/share/dotnet .
  cd dotnet-installer
  # fix bootstrap
  git remote set-url origin https://github.com/dotnet/installer.git
}

pkgver() {
  cd dotnet-installer

  if [[ $(git describe --tags) != v6.0.* ]]; then
    echo "Invalid SDK version"
    exit 1
  fi

  local _standardver=$(xmllint --xpath "//*[local-name()='NETStandardLibraryRefPackageVersion']/text()" eng/Versions.props)

  if [[ $_standardver != 2.1.0 ]]; then
    echo "Invalid Standard version"
    exit 1
  fi

  local _sdkver=$(xmllint --xpath "//*[local-name()='VersionSDKMinor']/text()" eng/Versions.props)$(xmllint --xpath "//*[local-name()='VersionFeature']/text()" eng/Versions.props)
  local _runtimever=$(xmllint --xpath "//*[local-name()='MicrosoftNETCoreAppRuntimewinx64PackageVersion']/text()" eng/Versions.props)


  echo "${_runtimever}.sdk${_sdkver}"
}

build() {
  export COMPlus_LTTng=0
  export VERBOSE=1
  export OPENSSL_ENABLE_SHA1_SIGNATURES=1

  CFLAGS=$(echo $CFLAGS  | sed -e 's/-fstack-clash-protection//' )
  CXXFLAGS=$(echo $CXXFLAGS  | sed -e 's/-fstack-clash-protection//' )
  export EXTRA_CFLAGS="$CFLAGS"
  export EXTRA_CXXFLAGS="$CXXFLAGS"
  export EXTRA_LDFLAGS="$LDFLAGS"
  unset CFLAGS
  unset CXXFLAGS
  unset LDFLAGS

  cd dotnet-installer

  ./build.sh \
    /p:ArcadeBuildTarball=true \
    /p:TarballDir="${srcdir}"/sources

  cd ../sources

  sed -i -E 's|( /p:BuildDebPackage=false)|\1 /p:EnablePackageValidation=false|' src/runtime/eng/SourceBuild.props
  sed -i -E 's|( /p:BuildDebPackage=false)|\1 --cmakeargs -DCLR_CMAKE_USE_SYSTEM_LIBUNWIND=TRUE|' src/runtime/eng/SourceBuild.props

  pushd src/sdk
  patch -Np1 -i ../../../dotnet-core-sdk-telemetry-optout.patch
  popd

  ln -sf "${srcdir}"/Private.SourceBuilt.Artifacts.${_bootstrapver}.tar.gz packages/archive/

  ./prep.sh
  ./build.sh \
    --with-sdk "${srcdir}"/dotnet \
    -- \
    /v:n \
    /p:ContinueOnPrebuiltBaselineError=true \
    /p:LogVerbosity=n \
    /p:MinimalConsoleLogOutput=false \
    /p:PrebuiltPackagesPath="${srcdir}"/sources/packages \
    /p:SkipPortableRuntimeBuild=true
}

package_dotnet-runtime-6.0() {
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
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner shared/Microsoft.NETCore.App
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-runtime-6.0
}

package_dotnet-source-built-artifacts-6.0() {
  pkgdesc='Internal package for building the .NET Core SDK'

  install -Dm 644 sources/artifacts/x64/Release/Private.SourceBuilt.Artifacts.*.tar.gz -t "${pkgdir}"/usr/share/dotnet/source-built-artifacts/
}

package_aspnet-runtime-6.0() {
  pkgdesc='The ASP.NET Core runtime'
  depends=(dotnet-runtime-6.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner shared/Microsoft.AspNetCore.App
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-runtime-6.0
}

package_dotnet-sdk-6.0() {
  pkgdesc='The .NET Core SDK'
  depends=(
    dotnet-runtime-6.0
    dotnet-targeting-pack-6.0
    glibc
    gcc-libs
    netstandard-targeting-pack
  )
  optdepends=('aspnet-targeting-pack-6.0: Build ASP.NET Core applications')

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner sdk sdk-manifests templates
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-sdk-6.0
}

package_dotnet-targeting-pack-6.0() {
  pkgdesc='The .NET Core targeting pack'
  depends=(netstandard-targeting-pack)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner packs/Microsoft.NETCore.App.{Host.arch-x64,Ref}
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-6.0
}

package_aspnet-targeting-pack-6.0() {
  pkgdesc='The ASP.NET Core targeting pack'
  depends=(dotnet-targeting-pack-6.0)

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner packs/Microsoft.AspNetCore.App.Ref
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-6.0
}

# vim: ts=2 sw=2 et:
