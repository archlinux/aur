# Maintainer: Christian Pfeiffer <cpfeiffer at rev-crew dot info>
# shellcheck disable=SC2034,SC2154
# shellcheck shell=bash

# The .NET packages build against the packages of one .NET build, never a mix: they makedepend on
# dotnet-build-deps-10.0, which this package (Microsoft's build) or dotnet-build-deps-10.0 (the
# source-built .NET of Arch Linux) provides. With this one, the packages of .NET itself come from
# nuget.org, Microsoft's build that matches the SDK, instead of the source-built artifacts, so they
# conflict. As they all come from nuget.org, any SDK of .NET 10 or later builds them: it's the one of
# Microsoft's current .NET (dotnet-sdk-bin), with the runtimes of .NET 10 for the packages and their
# tests. It ships nothing.
_dotnetver=10.0
pkgname=dotnet-build-deps-$_dotnetver-bin
# The version of Microsoft's .NET SDK (dotnet-sdk-bin) like dotnet-build-deps-10.0 has the one of the
# source-built SDK: the runtime version and the SDK's feature band and patch, which the packages build
# with (their _dotnet_sdk). The SDK is pinned to exactly that release, so the version provided is the
# one installed.
pkgver=11.0.0.sdk100
pkgrel=1
pkgdesc="Build dependencies of the .NET $_dotnetver packages from Microsoft's build of .NET and nuget.org (meta package)"
arch=(x86_64 aarch64)
url='https://dotnet.microsoft.com/'
license=(0BSD)
# Microsoft's build of .NET: the SDK of the current .NET, with its host, which the runtimes of .NET
# $_dotnetver run on too (theirs, dotnet-host-$_dotnetver-bin, conflicts with it); otherwise pacman would
# resolve the dotnet-host>=$_dotnetver.0 of dotnet-runtime-$_dotnetver-bin to Arch Linux's. The runtimes
# and targeting packs of .NET $_dotnetver, which the packages depend on by the names of Arch Linux's.
depends=(
  "dotnet-sdk-bin=$pkgver"
  dotnet-host-bin
  "dotnet-runtime-$_dotnetver-bin"
  "aspnet-runtime-$_dotnetver-bin"
  "aspnet-targeting-pack-$_dotnetver-bin"
)
provides=("dotnet-build-deps-$_dotnetver=$pkgver")
# The source-built packages of .NET $_dotnetver; by their versioned names, which the unversioned ones of
# the current .NET provide while it is $_dotnetver (dotnet-build-deps too)
conflicts=(
  "dotnet-build-deps-$_dotnetver"
  "dotnet-source-build-reference-packages-$_dotnetver"
  "dotnet-source-built-artifacts-$_dotnetver"
  "dotnet-system-io-ports-native-$_dotnetver"
)
source=("LICENSE")
sha512sums=('a33658d9271e5c537ccd41bf540b463ad2a5eca4a060c80486ff42a736f0aa042d10436e7177c34d792177cb11285243dee1f31c4df54fb0bfaabbc306406930')
b2sums=('a29664104e1ee73ca0aee1d633e9095d92a57c92787f8d8740bdb7211ba3205782ed8677f539bdb8cae3dd75a3694be3132e185fa3fc4b3f401e1f88eb776101')

package() {
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
