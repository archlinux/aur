# Maintainer: Eduard Tolosa <edu4rdshl[at]protonmail.com>

pkgbase=lazarus-svn
pkgname=('lazarus-svn' 'lazarus-svn-gtk2' 'lazarus-svn-qt5')
pkgver=r61931.b8f2e92f03
pkgrel=1
epoch=1
pkgdesc='Delphi-like build environment for FreePascal.'
arch=(x86_64)
url=https://www.lazarus-ide.org/
license=('GPL2' 'MPL' 'custom:modifiedLGPL')
conflicts=('lazarus')
makedepends=('git' 'fpc' 'fpc-src' 'gtk2' 'qt5pas' 'rsync')
optdepends=('perl: to run some scirpts in the tools directory.'
            'gtk2: to compile gtk2 apps.'
            'qt5pas: to compile qt5 apps and use help viewer')
provides=('lazarus')
source=("$pkgbase::git+https://gitlab.com/freepascal.org/lazarus/lazarus.git")
sha512sums=('SKIP')

pkgver() {
  cd $pkgbase

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgbase

  # build gtk2 ide
  make FPC=/usr/bin/fpc LCL_PLATFORM=gtk2 clean bigide
  # move gtk binaries
  mv lazarus lazarus-gtk2
  mv startlazarus startlazarus-gtk2

  # build qt5 ide
  make FPC=/usr/bin/fpc LCL_PLATFORM=qt5 bigide
  # move qt binaries
  mv lazarus lazarus-qt5
  mv startlazarus startlazarus-qt5
  make clean lazbuild
}

package_lazarus-svn() {
  pkgdesc='Delphi-like IDE for FreePascal common files'
  depends=('fpc' 'fpc-src' 'gdb')
  optdepends=(
    'perl: to run some scirpts in the tools directory'
    'gtk2: to compile gtk2 apps'
    'qt5pas: to compile qt5 apps and use help viewer'
  )

  cd $pkgbase

  # skip the 'make install' mess completely and do everything manually
  mkdir -p "$pkgdir"/usr/lib/lazarus "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1 "$pkgdir"/usr/share/doc
  rsync -a \
    --exclude="CVS"     --exclude=".cvsignore" \
    --exclude="*.ppw"   --exclude="*.ppl" \
    --exclude="*.ow"    --exclude="*.a"\
    --exclude="*.rst"   --exclude=".#*" \
    --exclude="*.~*"    --exclude="*.bak" \
    --exclude="*.orig"  --exclude="*.rej" \
    --exclude=".xvpics" \
    --exclude="killme*" --exclude=".gdb_hist*" \
    --exclude="debian"  --exclude="COPYING*" \
    --exclude="*.app"   --exclude="tools/install" \
    . "$pkgdir"/usr/lib/lazarus

  #remove some stuff, not needed or for in other package
  pushd "$pkgdir"/usr/lib/lazarus
  rm lazarus-*
  rm startlazarus-*
  popd

  ln -s /usr/lib/lazarus/lazbuild "$pkgdir"/usr/bin/lazbuild
  cp -R install/man/man1/* "$pkgdir"/usr/share/man/man1/
  mv "$pkgdir"/usr/lib/lazarus/docs "$pkgdir"/usr/share/doc/lazarus
  mkdir -p "$pkgdir"/usr/lib/lazarus/docs
  ln -s /usr/share/doc/lazarus/chm "$pkgdir"/usr/lib/lazarus/docs/html
  ln -s /usr/share/doc/lazarus/lazdoc.css "$pkgdir"/usr/lib/lazarus/docs/lazdoc.css

  rm -r "$pkgdir"/usr/lib/lazarus/install

  # license files: /usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/lazarus/COPYING.modifiedLGPL
}

package_lazarus-svn-gtk2() {
  pkgdesc='Delphi-like IDE for FreePascal gtk2 version'
  depends=('lazarus' 'desktop-file-utils' 'gtk2')
  conflicts=('lazarus-qt5')

  cd $pkgbase

  # install gtk binaries
  install -Dm755 lazarus-gtk2 "$pkgdir"/usr/lib/lazarus/lazarus
  install -Dm755 startlazarus-gtk2 "$pkgdir"/usr/lib/lazarus/startlazarus
  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/lazarus/lazarus "$pkgdir"/usr/bin/lazarus
  ln -s /usr/lib/lazarus/startlazarus "$pkgdir"/usr/bin/startlazarus

  # make 'desktop-file-validate' happy and fix missing .png icon
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' \
    -e 's|\.png|\.xpm|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop "$pkgdir"/usr/share/applications/lazarus.desktop
  install -Dm644 images/ide_icon48x48.png "$pkgdir"/usr/share/pixmaps/lazarus.png

  # license files: /usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/lazarus/COPYING.modifiedLGPL
}

package_lazarus-svn-qt5() {
  pkgdesc='Delphi-like IDE for FreePascal qt5 version'
  depends=('lazarus' 'qt5pas')
  conflicts=('lazarus-gtk2')
  replaces=('lazarus-qt' 'lazarus-qt4')

  cd $pkgbase

  # install qt binaries
  install -Dm755 lazarus-qt5 "$pkgdir"/usr/lib/lazarus/lazarus
  install -Dm755 startlazarus-qt5 "$pkgdir"/usr/lib/lazarus/startlazarus
  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/lazarus/lazarus "$pkgdir"/usr/bin/lazarus
  ln -s /usr/lib/lazarus/startlazarus "$pkgdir"/usr/bin/startlazarus

  # make 'desktop-file-validate' happy and fix missing .png icon
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' \
    -e 's|\.png|\.xpm|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop "$pkgdir"/usr/share/applications/lazarus.desktop
  install -Dm644 images/ide_icon48x48.png "$pkgdir"/usr/share/pixmaps/lazarus.png

  # license files: /usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/lazarus/COPYING.modifiedLGPL
}

# vim:set ts=2 sts=2 sw=2 et:
