# Maintainer: Lari Tikkanen <lartza@wippies.com>
# Contributor: Andrew Smith <ChucklesTheBeard@gmail.com>
# Contributor: Patrik Plihal <patrik.plihal@gmail.com>

pkgname=ckan-git
pkgver=1.18.0.r5.g0ab70f4
pkgrel=1
pkgdesc="A metadata repository and associated tools for searching, installing, and managing mods for Kerbal Space Program (KSP)"
arch=('any')
url="https://github.com/KSP-CKAN/CKAN"
license=('MIT')
provides=('ckan')
conflicts=('ckan')
depends=('mono' 'curl')
makedepends=('git' 'python2' 'python2-requests')
source=('git://github.com/KSP-CKAN/CKAN'
        'disable_version_checks.diff')
sha256sums=('SKIP'
            '21ed582d41da7f52ea4014fdcfadcadb7025f0fbae924fccd345c3b1f0fbff44')

pkgver() {
  cd "$srcdir/CKAN"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {

  # ignore certain version checks that return "inconclusive" exceptions for development builds
  cd "$srcdir/CKAN/"
  git apply $srcdir/disable_version_checks.diff
}

build() {
  cd "$srcdir/CKAN"
  xbuild /verbosity:minimal CKAN.sln

  cd "$srcdir/CKAN/Cmdline"
  mono ../Core/packages/ILRepack.1.25.0/tools/ILRepack.exe \
    /target:exe \
    /out:$srcdir/ckan.exe \
    bin/Debug/CmdLine.exe \
    bin/Debug/CKAN-GUI.exe \
    bin/Debug/ChinhDo.Transactions.dll \
    bin/Debug/CKAN.dll \
    bin/Debug/CommandLine.dll \
    bin/Debug/ICSharpCode.SharpZipLib.dll \
    bin/Debug/log4net.dll \
    bin/Debug/Newtonsoft.Json.dll \
    bin/Debug/INIFileParser.dll \
    bin/Debug/CurlSharp.dll \
    bin/Debug/Autofac.dll
}

check() {
  #nunit-console4 is included in mono

  cd "$srcdir/CKAN/"
  command nunit-console4 --exclude=FlakyNetwork Tests/bin/Debug/CKAN.Tests.dll
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  cp $srcdir/ckan.exe "$pkgdir/usr/bin/ckan"
}
