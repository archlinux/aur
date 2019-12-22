# Maintainer: Fabrizio del Tin <fdt@university.pub>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Jan Dolinar <dolik.rce@gmail.com>

pkgbase=upp
pkgname=(upp theide umk)
yearver=2019.2
pkgver=13664
pkgrel=1
pkgdesc="Radical and innovative multiplatform C++ framework (known as U++)"
arch=('any')
url="http://www.ultimatepp.org"
license=('BSD')
groups=()
depends=('gtk2' 'libnotify' 'libpng' 'gcc-libs' 'libxft' 'desktop-file-utils')
makedepends=()
optdepends=('libnotify: Enables compiling gtk-styled apps' 'sox: Enables playing notification sounds')
replaces=()
backup=()
options=(!makeflags emptydirs !strip)
source=("http://downloads.sourceforge.net/project/upp/upp/$yearver/upp-x11-src-$pkgver.tar.gz"
        'GCC.bm'
        'license.txt'
        'https://raw.githubusercontent.com/ultimatepp/mirror/master/uppbox/lpbuild2/theide.1'
        'https://raw.githubusercontent.com/ultimatepp/mirror/master/uppbox/lpbuild2/umk.1'
        'https://raw.githubusercontent.com/ultimatepp/mirror/master/uppbox/lpbuild2/mkfile')
noextract=()
sha256sums=('3a5b73db0b61ea5bcf9bf8b37ede3bf2b994079e793ec71d087d0b95bf472d41'
            '5c0955ef99bc08d4c79b96a470bc17eb2ae3bed5f0d66d86eff7fb726629ae79'
            '880ad22b3a7cef8adc2750553e5b7b785ec926168f50e01bacddcae52c07e71a'
            'cdb98e08996a809c9a323f83768edde6a22a6aad73d9ed6a193f70ac78a8b123'
            'ce881f93471bcb65a7cc4cb4d539579fda67c783b810289ab45a02113146f645'
            '45be7a52fb5db25c09b3851c708f2d21022240667e3d2cf39b4f614c9ad01078')

# uncomment this to true to build theide with simpler GUI (with no GTK dependecies)
#USE_NOGTK=false

build() {
  cd "$srcdir/upp-x11-src-$pkgver"

  FLAGS="GCC GUI MT STACKTRACE"
  USE_NOGTK="${USE_NOGTK:-false}"
  if [ "$USE_NOGTK" == "true" ]; then
    SUFFIX="-nogtk"
    FLAGS="$FLAGS NOGTK"
  fi

  # set the version string
  echo "#define IDE_VERSION \"$pkgver-Arch-$CARCH-$SUFFIX\"" > "uppsrc/ide/version.h"

  # build
  msg2 "Building umk..."
  make -j $(nproc --all) -f "$srcdir/mkfile" PKG=umk FLAGS="GCC STACKTRACE" NESTS="uppsrc" TIME= COLOR=0 USEMAINCFG=0 JOBS=5 ECHO=0 TARGET="$srcdir/umk"

  msg2 "Building theide..."
  make -j $(nproc --all) -f "$srcdir/mkfile" PKG=ide FLAGS="$FLAGS" NESTS="uppsrc" TIME= COLOR=0 USEMAINCFG=0 JOBS=5 ECHO=0 TARGET="$srcdir/theide"
}

package_theide(){
  # theide specific settings
  pkgdesc="Modern IDE designed for developping large U++/C++ applications"
  arch=('i686' 'x86_64')
  if [ "$USE_NOGTK" = true ]; then
    depends=('libpng' 'gcc-libs' 'libxft' 'libxinerama' 'desktop-file-utils')
    optdepends=('sox: Enables notification sounds')
  else
    depends=('gtk2' 'libnotify' 'desktop-file-utils')
    optdepends=('sox: Enables notification sounds')
  fi
  options=(!makeflags emptydirs)

  # license
  install -D "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  # man pages
  install -D "$srcdir/theide.1" "$pkgdir/usr/share/man/man1/theide.1"
#  install -D "$srcdir/umk.1" "$pkgdir/usr/share/man/man1/umk.1"
  # desktop entry
  install -D "$srcdir/upp-x11-src-$pkgver/uppsrc/ide/theide.desktop" "$pkgdir/usr/share/applications/theide.desktop"
  # icon
  install -D "$srcdir/upp-x11-src-$pkgver/uppsrc/ide/theide-48.png" "$pkgdir/usr/share/pixmaps/theide.png"
  # fix permissions
  find "$pkgdir/usr/" -print0 | xargs -0 chown root:root
  find "$pkgdir/usr/" -type f -print0 | xargs -0 chmod 644
  find "$pkgdir/usr/" -type d -print0 | xargs -0 chmod 755
  # install applications
  install -D "$srcdir/theide" "$pkgdir/usr/bin/theide"
}

package_umk(){
  # theide specific settings
  pkgdesc="Command line builder for U++ applications"
  arch=('i686' 'x86_64')
  depends=('gcc-libs' 'desktop-file-utils')
  options=(!makeflags emptydirs)

  # license
  install -D "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  # man pages
  install -D "$srcdir/umk.1" "$pkgdir/usr/share/man/man1/umk.1"
  # fix permissions
  find "$pkgdir/usr/" -print0 | xargs -0 chown root:root
  find "$pkgdir/usr/" -type f -print0 | xargs -0 chmod 644
  find "$pkgdir/usr/" -type d -print0 | xargs -0 chmod 755
  # install applications
  install -D "$srcdir/umk" "$pkgdir/usr/bin/umk"
}

package_upp() {
  pkgdesc="Radical and innovative multiplatform C++ framework (known as U++)"
  arch=('any')
  depends=('theide')
  optdepends=('libnotify: Enables compiling gtk-styled apps')
  options=(emptydirs !strip)
  #copy source files
  mkdir -p "$pkgdir/usr/share/upp"
  msg2 "Moving the source codes..."
  cp -r "$srcdir/upp-x11-src-$pkgver/"{bazaar,examples,reference,tutorial,uppsrc} "$pkgdir/usr/share/upp/"
  echo "#define IDE_VERSION \"$pkgver-Arch\"" > "$pkgdir/usr/share/upp/uppsrc/ide/version.h"
  msg2 "Copying additional files..."
  #license
  mkdir -p "$pkgdir/usr/share/licenses/upp"
  cp "$srcdir/license.txt" "$pkgdir/usr/share/licenses/upp"
  #build method
  cp "$srcdir/GCC.bm" "$pkgdir/usr/share/upp"
  #fix permissions
  msg2 "Setting permissions..."
  find "$pkgdir/usr/" -print0 | xargs -0 chown root:root
  find "$pkgdir/usr/" -type f -print0 | xargs -0 chmod 644
  find "$pkgdir/usr/" -type d -print0 | xargs -0 chmod 755
}
