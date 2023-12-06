# Maintainer: Roman Sommer <roman.sommer@fau.de>
pkgname=hise
_pkgvermajor=3
_pkgverminor=6
_pkgverpatch=2
pkgver=$_pkgvermajor.$_pkgverminor.$_pkgverpatch
pkgrel=1
epoch=
pkgdesc="Open source toolkit for building virtual instruments and audio effects"
arch=('i686' 'x86_64')
url="https://hise.dev"
license=('GPLv3+')
groups=()
depends=(faust jack) # HISE brings its own JUCE
makedepends=(juce) # we still need Projucer from Arch, which doesn't segfault on saving
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_sourcearchive="$pkgver.tar.gz"
_srcname="HISE-$pkgver"
source=("https://github.com/christophhart/HISE/archive/refs/tags/$_sourcearchive"
	"0001-Faust-fix-missing-header.patch"
	"0002-HISE-Standalone.jucer-enable-Faust-for-LinuxMakefile.patch"
	"0003-Settings-set-default-HISE-Path-to-install-location.patch"
       )
sha256sums=('8588af4d43178184920a9578b5eaf5887e6e98617c2b5385f98ed43f81fa9689'
            '52077d6630d10fc34ae28c287db357d88d1299ebcd8eb838eb4a865f857c6736'
            '8ffb216fd65c4bd04e5775e219f4b548e0f0ccb8ee5887ef08e49c787129404a'
            '20918a218034f2c37ba1bfef5b5d1eed1fb7a0aa1022c9ce49ad8443a201f83c')

noextract=()

prepare() {
  cd "$srcdir/$_srcname"
  patch -p1 < ../0001-Faust-fix-missing-header.patch
  patch -p1 < ../0002-HISE-Standalone.jucer-enable-Faust-for-LinuxMakefile.patch
  patch -p1 < ../0003-Settings-set-default-HISE-Path-to-install-location.patch
  Projucer --resave "$srcdir/$_srcname/projects/standalone/HISE Standalone.jucer"
}

build() {
  cd "$srcdir/$_srcname/projects/standalone/Builds/LinuxMakefile"
  make CONFIG=Release
}

# check() {
#   cd "$srcdir/projects/standalone/Builds/LinuxMakefile"
# }

package() {
  cd "$srcdir/$_srcname/projects/standalone/Builds/LinuxMakefile"
  install -Dm755 "build/HISE Standalone" "$pkgdir/usr/bin/hise"
  rm -rf build
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/hise"
  cp -ar "$_srcname" "$pkgdir/usr/share/hise/src"
}

# vim:set ts=2 sw=2 et:
