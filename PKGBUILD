# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Max Liebkies <mail@maxliebkies.de>

pkgbase=dotnet-core-preview
pkgname=('dotnet-host-preview' 'dotnet-runtime-preview' 'aspnet-runtime-preview' 'dotnet-sdk-preview')
pkgver=3.0.0+100+preview.009812
_pkgver=3.0.0+100-preview-009812
pkgrel=1
arch=('x86_64')
url='https://www.microsoft.com/net/core'
license=('MIT')
makedepends=(
  'clang' 'cmake' 'curl' 'git' 'icu' 'krb5' 'libunwind' 'lldb' 'llvm'
  'lttng-ust' 'openssl' 'zlib'
)
options=('staticlibs')
source=(
  'dotnet-source-build::git+https://github.com/dotnet/source-build.git'
  'dotnet-application-insights::git+https://github.com/Microsoft/ApplicationInsights-dotnet.git'
  'dotnet-aspnet-razor::git+https://github.com/aspnet/Razor.git'
  'dotnet-cecil::git+https://github.com/mono/cecil.git'
  'dotnet-cli::git+https://github.com/dotnet/cli.git'
  'dotnet-cli-migrate::git+https://github.com/dotnet/cli-migrate.git'
  'dotnet-clicommandlineparser::git+https://github.com/dotnet/clicommandlineparser.git'
  'dotnet-common::git+https://github.com/aspnet/common.git'
  'dotnet-core-sdk::git+https://github.com/dotnet/core-sdk.git'
  'dotnet-core-setup::git+https://github.com/dotnet/core-setup.git'
  'dotnet-coreclr::git+https://github.com/dotnet/coreclr.git'
  'dotnet-corefx::git+https://github.com/dotnet/corefx.git'
  'dotnet-fsharp::git+https://github.com/Microsoft/VisualFSharp.git'
  'dotnet-linker::git+https://github.com/mono/linker.git'
  'dotnet-msbuild::git+https://github.com/Microsoft/msbuild.git'
  'dotnet-newtonsoft-json::git+https://github.com/dseefeld/Newtonsoft.Json.git'
  'dotnet-nuget-client::git+https://github.com/NuGet/NuGet.Client.git'
  'dotnet-roslyn::git+https://github.com/dotnet/roslyn.git'
  'dotnet-roslyn-tools::git+https://github.com/dotnet/roslyn-tools.git'
  'dotnet-sdk::git+https://github.com/dotnet/sdk.git'
  'dotnet-standard::git+https://github.com/dotnet/standard.git'
  'dotnet-templating::git+https://github.com/dotnet/templating.git'
  'dotnet-toolset::git+https://github.com/dotnet/toolset.git'
  'dotnet-vstest::git+https://github.com/Microsoft/vstest.git'
  'dotnet-websdk::git+https://github.com/aspnet/websdk.git'
  'dotnet-xliff-tasks::git+https://github.com/dotnet/xliff-tasks.git'
  'https://download.visualstudio.microsoft.com/download/pr/d5460b29-cab8-43e6-b939-d150f4119e5e/b6269597f778fb9932925d50e6a0b0ed/aspnetcore-runtime-3.0.0-preview-18579-0056-linux-x64.tar.gz'
  'dotnet.sh'
  'dotnet-coreclr-rid.patch'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '1efa641bba4fd458136517f31f9719130fc3c733525d98ab152dc2a9639018c1'
            'f4cb02490234b853946477f82514f0c6247b55b08b2e85fae98e99a6e6974edd'
            '2c4fc48151e5319d57c8761091709070a17da91eddc2de8a26bc32c60679bfee')

prepare() {
  cd dotnet-source-build

  for submodule in src/{application-insights,aspnet-razor,cli,cli-migrate,clicommandlineparser,common,core-sdk,core-setup,coreclr,corefx,fsharp,linker,msbuild,newtonsoft-json,nuget-client,roslyn,roslyn-tools,sdk,standard,templating,toolset,vstest,websdk,xliff-tasks}; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../dotnet-${submodule#src/}
    git submodule update
  done

  cd src/linker

  for submodule in cecil; do
    git submodule init ${submodule}
    git config submodule.${submodule}.url ../../../dotnet-${submodule}
    git submodule update
  done

  cd ../coreclr

  patch -Np1 -i "${srcdir}"/dotnet-coreclr-rid.patch
}

build() {
  cd dotnet-source-build

  export SOURCE_BUILD_SKIP_SUBMODULE_CHECK=1

  ./build.sh
}

package_dotnet-host-preview() {
  pkgdesc='A generic driver for the .NET Core Command Line Interface (preview)'
  provides=('dotnet-host')
  conflicts=('dotnet-host')

  cd dotnet-source-build/bin/x64/Release

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses/dotnet-host}
  tar -C "${pkgdir}"/opt/dotnet -xf dotnet-sdk-${_pkgver/[0-9]\+}-linux-x64.tar.gz ./dotnet ./host
  tar -C "${pkgdir}"/usr/share/licenses/dotnet-host -xf dotnet-sdk-${_pkgver/[0-9]\+}-linux-x64.tar.gz ./LICENSE.txt ./ThirdPartyNotices.txt
  chown root:root -R "${pkgdir}"/opt/dotnet
  install -Dm 755 "${srcdir}"/dotnet.sh "${pkgdir}"/usr/bin/dotnet
}

package_dotnet-runtime-preview() {
  pkgdesc='The .NET Core runtime (preview)'
  depends=('dotnet-host-preview' 'icu' 'krb5' 'libunwind' 'openssl' 'zlib'
           'libcurl.so')
  optdepends=('lttng-ust: CoreCLR tracing')
  provides=('dotnet-runtime-3.0')
  conflicts=('dotnet-runtime-3.0')

  cd dotnet-source-build/bin/x64/Release

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  tar -C "${pkgdir}"/opt/dotnet -xf dotnet-sdk-${_pkgver/[0-9]\+}-linux-x64.tar.gz ./shared
  chown root:root -R "${pkgdir}"/opt/dotnet
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-runtime
}

package_aspnet-runtime-preview() {
  pkgdesc='The ASP.NET Core runtime (preview)'
  depends=('dotnet-runtime-preview')
  provides=('aspnet-runtime-3.0')
  conflicts=('aspnet-runtime-3.0')

  install -dm 755 "${pkgdir}"/{opt/dotnet/shared,usr/share/licenses}
  cp -dr --no-preserve='ownership' shared/Microsoft.AspNetCore.{All,App} "${pkgdir}"/opt/dotnet/shared/
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/aspnet-runtime
}

package_dotnet-sdk-preview() {
  pkgdesc='The .NET Core SDK (preview)'
  depends=('dotnet-runtime-preview')
  provides=('dotnet-sdk-3.0')
  conflicts=('dotnet-sdk-3.0')

  cd dotnet-source-build/bin/x64/Release

  install -dm 755 "${pkgdir}"/{opt/dotnet,usr/share/licenses}
  tar -C "${pkgdir}"/opt/dotnet -xf dotnet-sdk-${_pkgver/[0-9]\+}-linux-x64.tar.gz ./sdk
  chown root:root -R "${pkgdir}"/opt/dotnet
  ln -s dotnet-host "${pkgdir}"/usr/share/licenses/dotnet-sdk
}

# vim: ts=2 sw=2 et:
