# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

# **Note**
#
# This package builds from a fork of the original upstream repo. Upstream hasn't
# been updated or maintained for years and uses an old, also un-maintained fork
# of Dear ImGui. This old Dear ImGui version causes bugs in the UI event
# handling, which makes file selection dialogs in the application unusable.
# The fork used here updates ImGui to the latest repo version (as of 07/23)
# and also replaces the 'osdialog' sub-module with 'portable-file-dialogs'
# and fixes a few other bugs.

_name=WaveEdit
_pkgname=${_name,,}
pkgname=$_pkgname-git
pkgver=1.2.r136.9914dc7
pkgrel=1
pkgdesc='A wavetable editor for wavetable synthesizers (git version)'
arch=(x86_64)
url='https://synthtech.com/waveedit'
license=(GPL3)
depends=(jansson libsamplerate libsndfile sdl2 zenity)
makedepends=(gendesk git imagemagick)
groups=(pro-audio)
provides=($_pkgname "$_pkgname=${pkgver//.r*/}" "${_pkgname//-/.}")
conflicts=($_pkgname "${_pkgname//-/.}")
source=("$_pkgname::git+https://github.com/SpotlightKid/$_name.git#branch=aur"
        'imgui::git+https://github.com/ocornut/imgui.git'
        'lodepng::git+https://github.com/lvandeve/lodepng.git'
        'portable-file-dialogs::git+https://github.com/samhocevar/portable-file-dialogs.git'
        'pffft::git+https://github.com/marton78/pffft.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')


pkgver() {
  cd $_pkgname
  local ver="$(grep ^VERSION Makefile | cut -f 3 -d ' ')"
  printf "%s.r%s.%s" "$ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #(
  #  set -o pipefail
  #  git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
}

prepare() {
  cd $_pkgname

  git submodule init
  git config submodule.imgui.url "$srcdir"/imgui
  git config submodule.lodepng.url "$srcdir"/lodepng
  git config submodule.portable-file-dialogs.url "$srcdir"/portable-file-dialogs
  git config submodule.pfft.url "$srcdir"/pfft
  git -c protocol.file.allow=always submodule update

  # Patch source for where WaveEdit looks for wave catalogs
  sed -i -E -e 's|rootPath = ".*?"|rootPath = "/usr/share/waveedit/catalog"|' src/catalog.cpp
  # Patch source for where WaveEdit looks for images
  sed -i -E -e 's|"([-a-z]+\.png)"|"/usr/share/'$_pkgname'/images/\1"|' src/ui.cpp
  # Patch source for where WaveEdit looks for fonts
  sed -i -e 's|"fonts/|"/usr/share/'$_pkgname'/fonts/|' src/ui.cpp
  # Patch source for where WaveEdit looks for the manual PDF
  sed -i -e 's|"manual\.pdf"|"/usr/share/doc/'$pkgname'/manual.pdf"|' src/ui.cpp
}

build() {
  cd $_pkgname

  make
  convert logo.ico[2] logo.png
  gendesk -f -n \
    --pkgname "$_pkgname" \
    --pkgdesc "$pkgdesc" \
    --name=$_name \
    --exec=$_name \
    --categories 'Audio;AudioVideoEditing;Music;AudioVideo;'
}

package() {
  cd $_pkgname

  install -vDm 755 $_name -t "$pkgdir"/usr/bin
  ln -sf $_name "$pkgdir"/usr/bin/$_pkgname
  # UI images & fonts
  install -vDm 644 logo-{dark,light}.png -t "$pkgdir"/usr/share/$_pkgname/images
  install -vDm 644 fonts/*.ttf -t "$pkgdir"/usr/share/$_pkgname/fonts
  # banks
  install -vDm 644 banks/*.wav -t "$pkgdir"/usr/share/$_pkgname/banks
  # wav catalog
  for cat in catalog/*; do
    install -vDm 644 $cat/*.wav -t "$pkgdir"/usr/share/$_pkgname/$cat
  done
  # desktop file & icon
  install -vDm 644 logo.png "$pkgdir"/usr/share/pixmaps/$_pkgname.png
  install -vDm 644 $_pkgname.desktop -t "$pkgdir"/usr/share/applications
  # documentation
  install -vDm644 doc/*.{html,pdf,woff} -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm644 doc/images/*.png -t "$pkgdir"/usr/share/doc/$pkgname/images
  # Don't install 'Montserrat' font used by manual.html, fallback font is fine.
  #install -vDm644 doc/Montserrat/*.ttf -t "$pkgdir/usr/share/doc/${pkgname}/Montserrat"
}
