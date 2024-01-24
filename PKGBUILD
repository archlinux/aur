# Maintainer:

## useful urls
# https://www.lazarus-ide.org/
# https://gitlab.com/freepascal.org/lazarus/lazarus

## basic info
_pkgbase=lazarus
pkgbase="$_pkgbase-git"
pkgver=3.0.r1133.g371d85a6
pkgrel=1
pkgdesc='Delphi-like IDE for FreePascal'
url="https://gitlab.com/freepascal.org/lazarus/lazarus"
license=('GPL2' 'MPL' 'custom:modifiedLGPL')
arch=('x86_64')

makedepends=(
  'git'
  'fpc'
  'fpc-src'
  'gtk2'
  'gtk3'
  'qt5pas'
  'qt6pas'
  'rsync'
)

_pkgsrc="$_pkgbase"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"

  local _tag=$(git tag | grep '^lazarus' | grep -Ev '[A-Z]{2}' | sort -rV | head -1)
  local _pkgver=$(echo "${_tag:?}" | sed -E 's&^[^0-9]+&&; s&_&.&g')
  local _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
  local _hash=$(git rev-parse --short=8 HEAD)
  printf '%s.r%s.g%s' "${_pkgver:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  cd "$_pkgsrc"

  # prevent out of order execution
  export MAKEFLAGS="-j1"

  # build gtk2 ide
  make FPC=/usr/bin/fpc OPT='-gl -gw -Crtoi' LCL_PLATFORM=gtk2 clean bigide
  # move gtk binaries
  mv lazarus lazarus-gtk2
  mv startlazarus startlazarus-gtk2

  # build gtk3 ide
  make FPC=/usr/bin/fpc OPT='-gl -gw -Crtoi' LCL_PLATFORM=gtk3 clean bigide
  # move gtk binaries
  mv lazarus lazarus-gtk3
  mv startlazarus startlazarus-gtk3

  # build qt5 ide
  make FPC=/usr/bin/fpc OPT='-gl -gw -Crtoi' LCL_PLATFORM=qt5 bigide
  # move qt binaries
  mv lazarus lazarus-qt5
  mv startlazarus startlazarus-qt5

  # build qt6 ide
  make FPC=/usr/bin/fpc OPT='-gl -gw -Crtoi' LCL_PLATFORM=qt6 bigide
  # move qt binaries
  mv lazarus lazarus-qt6
  mv startlazarus startlazarus-qt6
}

_package_lazarus() {
  pkgdesc='Delphi-like IDE for FreePascal common files'
  depends=('fpc' 'fpc-src' 'gdb')
  optdepends=(
    'perl: to run some scirpts in the tools directory'
    'gtk3: to compile gtk3 apps'
    'qt5pas: to compile Qt5 apps'
    'qt6pas: to compile Qt6 apps'
  )

  cd "$_pkgsrc"

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
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.modifiedLGPL
}

_package_lazarus-gtk2() {
  pkgdesc='Delphi-like IDE for FreePascal gtk2 version'
  depends=('lazarus' 'desktop-file-utils' 'gtk2')
  conflicts=('lazarus-gtk3' 'lazarus-qt5' 'lazarus-qt6')

  cd "$_pkgsrc"

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
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.modifiedLGPL
}

_package_lazarus-gtk3() {
  pkgdesc='Delphi-like IDE for FreePascal gtk3 version'
  depends=('lazarus' 'desktop-file-utils' 'gtk3')
  conflicts=('lazarus-gtk2' 'lazarus-qt5' 'lazarus-qt6')

  cd "$_pkgsrc"

  # install gtk binaries
  install -Dm755 lazarus-gtk3 "$pkgdir"/usr/lib/lazarus/lazarus
  install -Dm755 startlazarus-gtk3 "$pkgdir"/usr/lib/lazarus/startlazarus
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

_package_lazarus-qt5() {
  pkgdesc='Delphi-like IDE for FreePascal Qt5 version'
  depends=('lazarus' 'qt5pas')
  conflicts=('lazarus-gtk2' 'lazarus-gtk3' 'lazarus-qt6')

  cd "$_pkgsrc"

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
  install -D -m644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING.modifiedLGPL
}

_package_lazarus-qt6() {
  pkgdesc='Delphi-like IDE for FreePascal Qt6 version'
  depends=('lazarus' 'qt6pas')
  conflicts=('lazarus-gtk2' 'lazarus-gtk3' 'lazarus-qt5')

  cd "$_pkgsrc"

  # install qt binaries
  install -Dm755 lazarus-qt6 "$pkgdir"/usr/lib/lazarus/lazarus
  install -Dm755 startlazarus-qt6 "$pkgdir"/usr/lib/lazarus/startlazarus
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

pkgname=(
  "$pkgbase"
  "$pkgbase-gtk2"
  "$pkgbase-gtk3"
  "$pkgbase-qt5"
  "$pkgbase-qt6"
)

for _p in "${pkgname[@]}"; do
  eval "package_$_p() {
    $(declare -f "_package_lazarus${_p#$pkgbase}")
    _package_lazarus${_p#$pkgbase}
  }"
done
