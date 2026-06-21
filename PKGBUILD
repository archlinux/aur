# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Kristian Mosegaard <kristian@mosen.me>
# Contributor: Max Liebkies <mail@maxliebkies.de>
# Contributor: Krzysztof Bogacki <krzysztof.bogacki@leancode.pl>

pkgbase=dotnet-core-6.0
pkgname=(
 dotnet-runtime-6.0
 aspnet-runtime-6.0
 dotnet-sdk-6.0
 dotnet-targeting-pack-6.0
 aspnet-targeting-pack-6.0
 dotnet-source-built-artifacts-6.0
)
pkgver=6.0.36.sdk136
pkgrel=2
arch=(x86_64)
url=https://www.microsoft.com/net/core
license=(MIT)
makedepends=(
  bash
  clang19
  cmake
  dotnet-sdk-6.0
  dotnet-source-built-artifacts-6.0
  git
  icu
  krb5
  libgit2
  libunwind
  libxml2
  lldb
  llvm19
  lttng-ust2.12
  nodejs
  openssl
  patchutils
  systemd
  zlib
)
optdepends=('bash-completion: Bash completion support')
options=(
  !lto
  staticlibs
)
source=(
  dotnet-installer::git+https://github.com/dotnet/installer.git#tag=v${pkgver/.*.sdk/.0.}
  dotnet.sh
  dotnet-core-runtime-disable-package-validation.patch
  dotnet-core-sdk-telemetry-optout.patch
  dotnet-core-6.0-Fix-clang19-build.patch::https://github.com/dotnet/runtime/commit/043ae8c50dbe1c7377cf5ad436c5ac1c226aef79.patch?full_index=1
)
b2sums=('36c51d8759cd3e91fe42893d04d25f9c3a9a31c46c12bb9c2487110a399ee3d18bbf91f1a00f50ea1ba1c900e24a9d75181ccfd4ec762343cd3715246e77cb8e'
        '4a64e3ee550e296bdde894f9202c6f372934cc29154f47d302599b4c368825a96a7b786faa6109a24a1101ff130fd9e4d0ccba094ec91e7f2ca645725bf71b34'
        'b9472b3967c9d7549ee2bbf0180d919748b40b1f9a65b1c3789be40f62ed17a9d37c2020409f7835570620108bd5ec43e728966d075d66bf0b7261cdd36a60c3'
        '95b083b842da6049a084ca015b7ddc099550aa818fc382d556cca832fee52265be568d20a2c50e70819aef6cf879e7a368f7dd3b5966356643b2efdd756e73f4'
        '43c592f21a379710f5e223f22f01dda55633e5b4fc1dc3cce613ea7667811773ac2515a7e194b77942e48b63c614ceaa09610281395e3e647d56e25839205c07')

prepare() {
  # fix bootstrap
  cd dotnet-installer
  git remote set-url origin https://github.com/dotnet/installer.git
}

build() {
  export COMPlus_LTTng=0
  export VERBOSE=1
  export OPENSSL_ENABLE_SHA1_SIGNATURES=1

  export PATH="/usr/lib/llvm19/bin:$PATH"

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

  cd dotnet-installer

  local _bootstrapver=$(xmllint --xpath "//*[local-name()='PrivateSourceBuiltArtifactsPackageVersion']/text()" eng/Versions.props)
  local _previousver=$(pacman -Q dotnet-source-built-artifacts-6.0 | sed -r 's/.*([0-9]+\.[0-9]+)\.[0-9]+\.sdk([0-9]+)-.*/\1.\2/')

  ./build.sh \
    /p:ArcadeBuildTarball=true \
    /p:TarballDir="${srcdir}"/sources

  cd ../sources

  sed -i -E 's|( /p:BuildDebPackage=false)|\1 /p:EnablePackageValidation=false|' src/runtime/eng/SourceBuild.props
  sed -i -E 's|( /p:BuildDebPackage=false)|\1 --cmakeargs -DCLR_CMAKE_USE_SYSTEM_LIBUNWIND=TRUE|' src/runtime/eng/SourceBuild.props

  pushd src/runtime
  # Fix clang19 build
  filterdiff ../../../dotnet-core-6.0-Fix-clang19-build.patch -p1 -i src/coreclr/vm/comreflectioncache.hpp | patch -Np1
  popd
  pushd src/sdk
  patch -Np1 -i ../../../dotnet-core-sdk-telemetry-optout.patch
  popd

  if [[ $_bootstrapver != $_previousver ]]; then
    ./prep.sh --bootstrap
    ./build.sh \
      -- \
      /v:n \
      /p:ContinueOnPrebuiltBaselineError=true \
      /p:LogVerbosity=n \
      /p:MinimalConsoleLogOutput=false \
      /p:PrebuiltPackagesPath="${srcdir}"/sources/packages \
      /p:SkipPortableRuntimeBuild=true
  else
    cp -r /usr/share/dotnet .
    ln -sf /usr/share/dotnet/source-built-artifacts/Private.SourceBuilt.Artifacts.*.tar.gz packages/archive/
    ./build.sh \
      --with-sdk "${srcdir}"/sources/dotnet \
      -- \
      /v:n \
      /p:ContinueOnPrebuiltBaselineError=true \
      /p:LogVerbosity=n \
      /p:MinimalConsoleLogOutput=false \
      /p:PrebuiltPackagesPath="${srcdir}"/sources/packages \
      /p:SkipPortableRuntimeBuild=true
  fi
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
  provides=(dotnet-runtime=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner shared/Microsoft.NETCore.App
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-runtime-6.0
}

package_aspnet-runtime-6.0() {
  pkgdesc='The ASP.NET Core runtime'
  depends=(dotnet-runtime-6.0)
  provides=(aspnet-runtime=${pkgver%.*.sdk*})

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
  provides=(dotnet-sdk=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner sdk sdk-manifests templates
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-sdk-6.0
}

package_dotnet-targeting-pack-6.0() {
  pkgdesc='The .NET Core targeting pack'
  depends=(netstandard-targeting-pack)
  provides=(dotnet-targeting-pack=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner packs/Microsoft.NETCore.App.{Host.arch-x64,Ref}
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-targeting-pack-6.0
}

package_aspnet-targeting-pack-6.0() {
  pkgdesc='The ASP.NET Core targeting pack'
  depends=(dotnet-targeting-pack-6.0)
  provides=(aspnet-targeting-pack=${pkgver%.*.sdk*})

  install -dm 755 "${pkgdir}"/usr/share/{dotnet,licenses}
  bsdtar -xf sources/artifacts/x64/Release/dotnet-sdk-${pkgver%.*.sdk*}.${pkgver#*sdk}-arch-x64.tar.gz -C "${pkgdir}"/usr/share/dotnet/ --no-same-owner packs/Microsoft.AspNetCore.App.Ref
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-targeting-pack-6.0
}

package_dotnet-source-built-artifacts-6.0() {
  pkgdesc='Internal package for building the .NET Core SDK'
  provides=(dotnet-source-built-artifacts=${pkgver%.*.sdk*})

  install -Dm 644 sources/artifacts/x64/Release/Private.SourceBuilt.Artifacts.*.tar.gz -t "${pkgdir}"/usr/share/dotnet/source-built-artifacts/
}
