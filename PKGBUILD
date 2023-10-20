# Maintainer:
# Contributor: Gutawer <https://github.com/Gutawer>

_pkgname="ultimate-doom-builder"
pkgname="$_pkgname-git"
pkgver=3.0.0.4119.ca6769b7
pkgrel=1
pkgdesc='A level editor for Doom-engine games, with experimental Linux support.'
arch=('x86_64')
url="https://github.com/jewalky/UltimateDoomBuilder"
license=('GPL3')
depends=(
  'mono'
)
makedepends=(
  'coreutils'
  'git'
  'imagemagick'
  'libglvnd'
  'make'
  'mono-msbuild'
  'sed'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="${_pkgname:?}"
source=(
  "$_pkgsrc"::"git+$url.git"
  "ultimate-doom-builder.desktop"
)
sha256sums=(
  'SKIP'
  'adbcced4ed6394636d89ef9330e8c339e6433594642154af44f9d54fdc27d156'
)

pkgver()  {
  cd "$_pkgsrc"

  local _file="Source/Core/Properties/AssemblyInfo.cs"
  local _regex='^\[assembly: AssemblyVersion\("([0-9]+\.[0-9]+)(\.[0-9]+)(\.[0-9]+)"\)\].*$'

  local _version=$( grep -E "$_regex" "$_file" | sed -E "s@$_regex@\1\2@" )

  local _revision=$(
    git rev-list --count HEAD
  )
  _hash=$(
    git rev-parse --short HEAD
  )

  # Not following recommended version format because .NET versions are weird.

  printf "%s.%s.%s" \
    "$_version" \
    "$_revision" \
    "$_hash"
}

build() {
  cd "$_pkgsrc"

  local VNUMBER=$(git rev-list --count HEAD)
  local VHASH=$(git rev-parse --short=7 HEAD)
  local FILES=(
    "Source/Core/Properties/AssemblyInfo.cs" \
    "Source/Plugins/BuilderModes/Properties/AssemblyInfo.cs"
  )

  for FILE in "${FILES[@]}"
  do
    echo 'Changing assembly info in `'$FILE'` ...'
    sed -b -i 's/\(\[assembly: AssemblyVersion(".*\.\)[0-9]*")\]/\1'$VNUMBER'")\]/' $FILE
    sed -b -i 's/\(\[assembly: AssemblyHash("\)[0-9a-zA-Z]*")\]/\1'$VHASH'")\]/' $FILE
  done

  make

  git restore Source/
}

package() {
  cd "$_pkgsrc"

  mkdir -p "${pkgdir:?}/opt/ultimate-doom-builder"
  cp -dpr --no-preserve=ownership Build/* "${pkgdir:?}/opt/ultimate-doom-builder/"
  sed -i '1 acd /opt/ultimate-doom-builder/' "${pkgdir:?}/opt/ultimate-doom-builder/builder"

  mkdir -p "${pkgdir:?}/usr/bin"
  ln -sf /opt/ultimate-doom-builder/builder "${pkgdir:?}/usr/bin/ultimate-doom-builder"

  install -D "${srcdir:?}/ultimate-doom-builder.desktop" -t "${pkgdir:?}/usr/share/applications/ultimate-doom-builder.desktop"

  mkdir -p "${pkgdir:?}/usr/share/pixmaps"
  convert "Source/Core/Resources/UDB2.ico[3]" "${pkgdir:?}/usr/share/pixmaps/ultimate-doom-builder.png"
}
