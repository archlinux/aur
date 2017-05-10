# Maintainer: Moritz Kiefer <moritz.kiefer@purelyfunctional.org>
pkgname=helio-workstation-git
pkgver=v1.7.r16.43d4dc6
pkgrel=1
pkgdesc=""
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=('alsa-lib' 'curl' 'webkit2gtk')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=
source=("${pkgname%-git}::git+https://github.com/peterrudenko/helio-workstation.git"
       	"JUCE::git+https://github.com/WeAreROLI/JUCE.git")
md5sums=('SKIP'
         'SKIP')
noextract=()

prepare() {
  cd "$srcdir/${pkgname%-git}"
  git submodule init
  git config submodule.ThirdParty/JUCE.url $srcdir/JUCE
  git submodule update
}

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}/ThirdParty/JUCE/extras/Projucer/Builds/LinuxMakefile"
  CONFIG=Release make
  ./build/Projucer --resave ./../../../../../../Projects/Projucer/Helio\ Workstation.jucer
  cd "$srcdir/${pkgname%-git}/Projects/LinuxMakefile"
  CONFIG=Release64 make
}

package() {
  cd "$srcdir/${pkgname%-git}/Projects/Installers/Linux/Helio-1.7-amd64/"
  cp -r usr "$pkgdir/usr"
  cd "$srcdir/${pkgname%-git}/Projects/LinuxMakefile/build"
  install -dm775 "$pkgdir/opt/helio_workstation/"
  install -m755 "Helio" "$pkgdir/opt/helio_workstation/helio_workstation"
}
