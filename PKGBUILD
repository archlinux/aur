# Maintainer:
# Contributor: Gutawer <https://github.com/Gutawer>

: ${_install_path=usr/lib}

_pkgname="ultimate-doom-builder"
pkgname="$_pkgname-git"
pkgver=3.0.0.4239.99086de
pkgrel=1
pkgdesc="A level editor for Doom-engine games"
url="https://github.com/UltimateDoomBuilder/UltimateDoomBuilder"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'libxfixes'
  'mono'
)
makedepends=(
  'git'
  'imagemagick'
  'libglvnd'
  'mono-msbuild'
)
optdepends=(
  'gtk2: use non-built-in color scheme'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  local _file _regex _version _revision
  _file="Source/Core/Properties/AssemblyInfo.cs"
  _regex='^\[assembly: AssemblyVersion\("([0-9]+\.[0-9]+)(\.[0-9]+)(\.[0-9]+)"\)\].*$'
  _version=$(grep -E "$_regex" "$_file" | sed -E "s@$_regex@\1\2@")
  _revision=$(git rev-list --count HEAD)
  _hash=$(git rev-parse --short=7 HEAD)

  # Not following recommended VCS version format because .NET versions are weird.
  printf "%s.%s.%s" "${_version:?}" "${_revision:?}" "${_hash:?}"
}

build() {
  cd "$_pkgsrc"
  local VNUMBER=$(git rev-list --count HEAD)
  local VHASH=$(git rev-parse --short=7 HEAD)
  local FILES=(
    "Source/Core/Properties/AssemblyInfo.cs"
    "Source/Plugins/BuilderModes/Properties/AssemblyInfo.cs"
  )

  for FILE in "${FILES[@]}"; do
    echo 'Changing assembly info in "'${FILE}'" ...'
    sed -b -i 's/\(\[assembly: AssemblyVersion(".*\.\)[0-9]*")\]/\1'${VNUMBER}'")\]/' $FILE
    sed -b -i 's/\(\[assembly: AssemblyHash("\)[0-9a-zA-Z]*")\]/\1'${VHASH}'")\]/' $FILE
  done

  make
}

package() {
  cd "$_pkgsrc"

  # copy files
  install -dm755 "$pkgdir/$_install_path/ultimate-doom-builder"
  cp -a Build/* "$pkgdir/$_install_path/ultimate-doom-builder/"

  # script
  # https://github.com/UltimateDoomBuilder/UltimateDoomBuilder/issues/989
  install -Dm755 /dev/stdin "$pkgdir/$_install_path/ultimate-doom-builder/builder" << END
#!/usr/bin/env sh
_builder_path="\$(dirname \$(readlink -f "\$0"))"
exec mono "\$_builder_path/Builder.exe" "\$@"
END

  # symlink
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/$_install_path/ultimate-doom-builder/builder" "$pkgdir/usr/bin/ultimate-doom-builder"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/ultimate-doom-builder.desktop" << END
[Desktop Entry]
Type=Application
Name=Ultimate Doom Builder
Comment=$pkgdesc
TryExec=$_pkgname
Exec=$_pkgname %u
Icon=$_pkgname
StartupNotify=true
Terminal=false
Categories=Game;
END

  # icon
  install -dm755 "$pkgdir/usr/share/pixmaps"
  magick "Source/Core/Resources/UDB2.ico[3]" "$pkgdir/usr/share/pixmaps/ultimate-doom-builder.png"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir/"
}
