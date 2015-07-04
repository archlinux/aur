# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Andrew Smith <ChucklesTheBeard@gmail.com>
# Contributer: Patrik Plihal <patrik.plihal@gmail.com>

pkgname=ckan-git
pkgver=v1.10.0.r2.g031a52c
pkgrel=1
pkgdesc="A metadata repository and associated tools for searching, installing, and managing mods for Kerbal Space Program (KSP)"
arch=('any')
url="http://forum.kerbalspaceprogram.com/threads/100067-"
license=('MIT')
provides=('ckan')
depends=('mono' 'curl')
makedepends=('git' 'python2' 'python2-requests')
source=('git://github.com/KSP-CKAN/CKAN'
        'disable_version_checks.diff')
sha256sums=('SKIP'
            '9dc21143045cb85511b114f83c33583ab7fc48d647e153e93596cc1445cc6aa1')

pkgver() {
  cd "$srcdir/CKAN"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
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
    bin/Debug/CurlSharp.dll
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

# vim:set ts=2 sw=2 et:
