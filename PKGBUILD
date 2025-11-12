# Maintainer:

## links
# https://www.lazarus-ide.org/
# https://gitlab.com/freepascal.org/lazarus/lazarus
# https://www.freepascal.org/docs-html/user/usersu15.html

## options
: ${_debug:=true}
: ${_runtime_checks:=true}

: ${_build_gtk2:=false}
: ${_build_gtk3:=true}
: ${_build_qt5:=false}
: ${_build_qt6:=true}

_pkgbase="lazarus"
pkgbase="$_pkgbase-git"
pkgver=4.4.r2158.g80cd7ab
pkgrel=1
pkgdesc='Delphi-like IDE for FreePascal'
url="https://gitlab.com/freepascal.org/lazarus/lazarus"
arch=('x86_64')
license=(
  # ide, designer, codetools, etc
  # synedit (or MPL-1.1)
  'GPL-2.0-only'

  # component library
  'LGPL-2.0-only'
  'LicenseRef-LGPL-exception'

  # documentation
  'CC-BY-SA-4.0'
)

makedepends=(
  'fpc'
  'fpc-src'
  'git'
  'gtk3'
  'qt6pas'
  'rsync'
)

options=(!makeflags libtool staticlibs !strip)

_pkgsrc="$_pkgbase"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _tag _pkgver _revision _hash
  _tag=$(git tag | grep '^lazarus' | grep -Ev '[A-Z]{2}' | sort -rV | head -1)
  _pkgver=$(echo "${_tag:?}" | sed -E 's&^[^0-9]+&&; s&_&.&g')
  _revision=$(git rev-list --count --cherry-pick "$_tag"...HEAD)
  _hash=$(git rev-parse --short=7 HEAD)
  printf '%s.r%s.g%s' "${_pkgver:?}" "${_revision:?}" "${_hash:?}"
}

_package_lazarus() {
  cd "$_pkgsrc"

  # skip the 'make install' mess completely and do everything manually
  mkdir -p "$pkgdir"/usr/lib/lazarus "$pkgdir"/usr/bin "$pkgdir"/usr/share/man/man1 "$pkgdir"/usr/share/doc
  rsync -a \
    --exclude="CVS" --exclude=".cvsignore" \
    --exclude="*.ppw" --exclude="*.ppl" \
    --exclude="*.ow" --exclude="*.a" \
    --exclude="*.rst" --exclude=".#*" \
    --exclude="*.~*" --exclude="*.bak" \
    --exclude="*.orig" --exclude="*.rej" \
    --exclude=".xvpics" \
    --exclude="killme*" --exclude=".gdb_hist*" \
    --exclude="debian" --exclude="COPYING*" \
    --exclude="*.app" --exclude="tools/install" \
    --exclude=".git*" \
    . "$pkgdir"/usr/lib/lazarus

  #remove some stuff, not needed or in other package
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

  _package_licenses

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_package_platform() {
  _platform="${1:?}"

  cd "$_pkgsrc"

  # install binaries
  install -Dm755 lazarus-"$_platform" "$pkgdir"/usr/lib/lazarus/lazarus
  install -Dm755 startlazarus-"$_platform" "$pkgdir"/usr/lib/lazarus/startlazarus
  install -dm755 "$pkgdir"/usr/bin

  # symlinks
  ln -s /usr/lib/lazarus/lazarus "$pkgdir"/usr/bin/lazarus
  ln -s /usr/lib/lazarus/startlazarus "$pkgdir"/usr/bin/startlazarus

  # make 'desktop-file-validate' happy
  sed -e 's|\(Categories\).*|\1=IDE;Development;|' -i install/lazarus.desktop
  install -Dm644 install/lazarus.desktop "$pkgdir"/usr/share/applications/lazarus.desktop
  install -Dm644 images/ide_icon48x48.png "$pkgdir"/usr/share/pixmaps/lazarus.png

  _package_licenses

  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}

_package_licenses() {
  install -Dm644 COPYING.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.overview
  install -Dm644 COPYING.modifiedLGPL.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.LGPL-exception
}

build() {
  cd "$_pkgsrc"

  local _fpc_options=(-O3 '-k"-O1 --sort-common --as-needed -z relro -z now -z pack-relative-relocs"')

  if [[ "${_debug::1}" == "t" ]]; then
    _fpc_options+=(-gl -gw)
  fi

  if [[ "${_runtime_checks::1}" == "t" ]]; then
    _fpc_options+=(-Crtoi)
  fi

  for _platform in gtk3 qt6; do
    # build ide
    echo "Building for platform: ${_q}"
    make FPC=/usr/bin/fpc OPT="${_fpc_options[*]}" LCL_PLATFORM="$_platform" bigide

    # move binaries
    mv lazarus lazarus-$_platform
    mv startlazarus startlazarus-$_platform
  done
}

pkgname=(
  "$pkgbase"
  "$_pkgbase-gtk3-git"
  "$_pkgbase-qt6-git"
)

_pkgtype="${pkgbase#$_pkgbase}"
for _p in "${pkgname[@]}"; do
  _q=$(cut -d'-' -f2 <<< "$_p")

  case "${_q::2}" in
    gt)
      eval "package_$_p() {
        pkgdesc+=' - ${_q:?} version'
        depends=('lazarus${_pkgtype:-}' 'desktop-file-utils' '${_q:?}')
        provides=(lazarus-${_q:?}=${pkgver%%.g*})
        conflicts=('lazarus-gtk2' 'lazarus-gtk3' 'lazarus-qt5' 'lazarus-qt6')

        _package_platform ${_q:?}
      }"
      ;;
    qt)
      eval "package_$_p() {
        pkgdesc+=' - ${_q:?} version'
        depends=('lazarus${_pkgtype:-}' '${_q:?}pas')
        provides=(lazarus-${_q:?}=${pkgver%%.g*})
        conflicts=('lazarus-gtk2' 'lazarus-gtk3' 'lazarus-qt5' 'lazarus-qt6')

        _package_platform ${_q:?}
      }"
      ;;
    *) # lazarus-git
      eval "package_$_p() {
        pkgdesc+=' - common files'
        depends=('fpc' 'fpc-src' 'gdb')
        optdepends=(
          'perl: to run some scripts in the tools directory'
          'gtk2: to compile GTK2 apps'
          'gtk3: to compile GTK3 apps'
          'qt5pas: to compile Qt5 apps'
          'qt6pas: to compile Qt6 apps'
        )

        provides=(lazarus=${pkgver%%.g*})
        conflicts=(lazarus)

        $(declare -f "_package_lazarus")
        _package_lazarus
      }"
      ;;
  esac
done
