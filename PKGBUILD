# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Maintainer: Takina Lina <0tkl.zhaoqing@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Jens Adam <jra@byte.cx>
# Contributor: xiota

pkgbase=lazarus-beta
pkgname=('lazarus-beta' 'lazarus-beta-gtk3' 'lazarus-beta-qt6')
_lazarus_tag=3_4
pkgver=3.4.0
pkgrel=1
url='https://www.lazarus-ide.org/'
license=('GPL2' 'MPL' 'custom:modifiedLGPL')
arch=('x86_64')
makedepends=(
  fpc
  fpc-src
  gtk3
  qt6pas
  rsync
)
options=(!makeflags libtool staticlibs !strip)
source=("https://gitlab.com/freepascal.org/lazarus/lazarus/-/archive/lazarus_${_lazarus_tag}/lazarus-lazarus_${_lazarus_tag}.tar.bz2")
sha512sums=('4cca953741f024fa6ca9a34491940937cc617ae8914606d300a4426c8dadbe9e71b9742a66f6aad9ae3176a4e6caf34a58ef594a179d573d7976e5894fa502d7')

build() {
  cd lazarus-lazarus_${_lazarus_tag}

  # build gtk3 ide
  make FPC=/usr/bin/fpc OPT='-gl -gw -Crtoi' LCL_PLATFORM=gtk3 clean bigide
  # move gtk binaries
  mv lazarus lazarus-beta-gtk3
  mv startlazarus startlazarus-beta-gtk3

  # build qt6 ide
  make FPC=/usr/bin/fpc OPT='-gl -gw -Crtoi' LCL_PLATFORM=qt6 bigide
  # move qt binaries
  mv lazarus lazarus-beta-qt6
  mv startlazarus startlazarus-beta-qt6
}

package_lazarus-beta() {
  pkgdesc='Delphi-like IDE for FreePascal common files'
  provides=(lazarus)
  conflicts=(lazarus)
  depends=('fpc' 'fpc-src' 'gdb')
  optdepends=(
    'perl: to run some scirpts in the tools directory'
    'gtk3: to compile gtk3 apps'
    'qt6pas: to compile qt6 apps and use help viewer'
  )

  cd lazarus-lazarus_${_lazarus_tag}

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

  # remove some stuff, not needed or for in other package
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
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.modifiedLGPL
}

package_lazarus-beta-gtk3() {
  pkgdesc='Delphi-like IDE for FreePascal gtk3 version'
  depends=(
    lazarus-beta
    desktop-file-utils
    gtk3
  )
  provides=(lazarus-gtk3)
  conflicts=(
    lazarus-gtk3
    lazarus-gtk2
    lazarus-qt6
    lazarus-qt5
  )

  cd lazarus-lazarus_${_lazarus_tag}

  # install gtk binaries
  install -Dm755 lazarus-beta-gtk3 "$pkgdir"/usr/lib/lazarus/lazarus
  install -Dm755 startlazarus-beta-gtk3 "$pkgdir"/usr/lib/lazarus/startlazarus
  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/lazarus/lazarus "$pkgdir"/usr/bin/lazarus
  ln -s /usr/lib/lazarus/startlazarus "$pkgdir"/usr/bin/startlazarus

  # make 'desktop-file-validate' happy and fix missing .png icon
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' \
    -e 's|\.png|\.xpm|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop "$pkgdir"/usr/share/applications/lazarus.desktop
  install -Dm644 images/ide_icon48x48.png "$pkgdir"/usr/share/pixmaps/lazarus.png

  # license files: /usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.modifiedLGPL
}

package_lazarus-beta-qt6() {
  pkgdesc='Delphi-like IDE for FreePascal qt6 version'
  depends=(
    lazarus-beta
    qt6pas
  )
  provides=(lazarus-qt6)
  conflicts=(
    lazarus-qt6
    lazarus-qt5
    lazarus-gtk3
    lazarus-gtk2
  )

  cd lazarus-lazarus_${_lazarus_tag}

  # install qt binaries
  install -Dm755 lazarus-beta-qt6 "$pkgdir"/usr/lib/lazarus/lazarus
  install -Dm755 startlazarus-beta-qt6 "$pkgdir"/usr/lib/lazarus/startlazarus
  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/lazarus/lazarus "$pkgdir"/usr/bin/lazarus
  ln -s /usr/lib/lazarus/startlazarus "$pkgdir"/usr/bin/startlazarus

  # make 'desktop-file-validate' happy and fix missing .png icon
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' \
    -e 's|\.png|\.xpm|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop "$pkgdir"/usr/share/applications/lazarus.desktop
  install -Dm644 images/ide_icon48x48.png "$pkgdir"/usr/share/pixmaps/lazarus.png

  # license files: /usr/lib/lazarus/COPYING*
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.modifiedLGPL
}
