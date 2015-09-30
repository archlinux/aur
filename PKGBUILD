# $Id: PKGBUILD 246414 2015-09-16 21:25:15Z daniel $
# Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Brice Carpentier <brice@dlfp.org>

pkgname=msbuild-bin
pkgver=14.1.0.0
_pkgver=$pkgver-prerelease
pkgrel=1
pkgdesc="Microsoft Build Engine"
arch=(i686 x86_64)
license=('MIT')
url="https://github.com/dotnet/corefx/blob/8b6efd4a91288d94b13f9757c6f1a3b356d39dd8/build.sh#L102"
depends=('mono')
makedepends=('nuget')
provides=('msbuild')
options=('!strip')

build() {
  nuget install Microsoft.Build.Mono.Debug -Version ${_pkgver} -OutputDirectory "$srcdir/msbuild" -source "https://www.myget.org/F/dotnet-buildtools/"
  cd msbuild
}

package() {
  install -d "$pkgdir/usr/share"
  cp -ra msbuild "$pkgdir/usr/share/"

  install -d "$pkgdir/usr/bin"
  echo '#!/bin/sh
mono /usr/share/msbuild/Microsoft.Build.Mono.Debug.'${pkgver}'-prerelease/lib/MSBuild.exe "$@"
' > "$pkgdir/usr/bin/MSBuild.exe"
chmod +x "$pkgdir/usr/bin/MSBuild.exe"
ln -s MSBuild.exe "$pkgdir/usr/bin/msbuild.exe"
}
