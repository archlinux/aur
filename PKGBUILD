# Maintainer: Brenton Horne <brentonhorne77 at gmail dot com>
# Contributor: Jan Dolinar <dolik.rce@gmail.com>

pkgbase=upp-nightly
pkgname=(upp-nightly theide-nightly umk-nightly)
pkgver=10485
pkgrel=1
pkgdesc="Radical and innovative multiplatform C++ framework (known as U++) — nightly build"
arch=('any')
url="http://www.ultimatepp.org"
license=('BSD')
depends=('gtk2' 'libnotify' 'libpng' 'gcc-libs' 'libxft' 'desktop-file-utils')
optdepends=('libnotify: Enables compiling gtk-styled apps' 'sox: Enables playing notification sounds')
options=(!makeflags emptydirs !strip)
source=("http://www.ultimatepp.org/downloads/upp-x11-src-$pkgver.tar.gz"
        'GCC.bm'
        'license.txt'
        'theide.install'
        'https://raw.githubusercontent.com/ultimatepp/mirror/master/uppbox/lpbuild2/theide.1'
        'https://raw.githubusercontent.com/ultimatepp/mirror/master/uppbox/lpbuild2/umk.1'
        'https://raw.githubusercontent.com/ultimatepp/mirror/master/uppbox/lpbuild2/mkfile')
md5sums=('SKIP'
         'a1b57c2231b6b0fa8070941fa4accf72'
         'b214709f096e4f50d61f50988359241e'
         '204e9ece27294b4b73cb3a31f0474d8d'
         'b21415926edc5f18efaec625f6135556'
         'b56d54a9d5d722bb32633a06675fbeb6'
         '9ad99eb6ead298341b6698e505067d7c')

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
  make -f "$srcdir/mkfile" PKG=umk FLAGS="GCC STACKTRACE" NESTS="uppsrc" TIME= COLOR=0 USEMAINCFG=0 JOBS=5 ECHO=0 TARGET="$srcdir/umk"

  msg2 "Building theide..."
  make -f "$srcdir/mkfile" PKG=ide FLAGS="$FLAGS" NESTS="uppsrc" TIME= COLOR=0 USEMAINCFG=0 JOBS=5 ECHO=0 TARGET="$srcdir/theide"
}

package_theide-nightly(){
  # theide specific settings
  pkgdesc="Modern IDE designed for developping large U++/C++ applications — nightly build"
  arch=('i686' 'x86_64')
  conflicts=('theide')
  provides=('theide')
  if [ "$USE_NOGTK" = true ]; then
    depends=('libpng' 'gcc-libs' 'libxft' 'libxinerama' 'desktop-file-utils')
    optdepends=('sox: Enables notification sounds')
  else
    depends=('gtk2' 'libnotify' 'desktop-file-utils')
    optdepends=('sox: Enables notification sounds')
  fi
  options=(!makeflags emptydirs)
  install='theide.install'

  # license
  install -D "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
  # man pages
  install -D "$srcdir/theide.1" "$pkgdir/usr/share/man/man1/theide.1"
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

package_umk-nightly(){
  # theide specific settings
  pkgdesc="Command line builder for U++ applications — nightly build"
  arch=('i686' 'x86_64')
  conflicts=('umk')
  provides=('umk')
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

package_upp-nightly() {
  pkgdesc="Radical and innovative multiplatform C++ framework (known as U++) — nightly build"
  arch=('any')
  depends=('theide-nightly')
  conflicts=('upp')
  provides=('upp')
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
