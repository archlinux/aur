# The name of the folder that contains the source files
folder_name="lucidglyph"

pkgname=("lucidglyph")
pkgver=0.12.0
pkgrel=1
arch=('any')
pkgdesc='Carefully tuned adjustments designed to improve font rendering on Linux systems packaged for Arch Linux.'
source=(
  "$folder_name::git+https://github.com/maximilionus/lucidglyph#tag=v$pkgver"
  '0001-make-DEST_ENVIRONMENT-dynamic.patch'
)
validpgpkeys=(
  "B7E510C142B88F4B"
)
md5sums=(
  'SKIP'
  'cd0ec01d52992dbb763ac0e972c5cd18'
)
sha512sums=(
  'SKIP'
  '86ee125fefd3d1a25995d4b4af8c58ea3b8a08c94f8e02c7516297bc632ce65513c43b2671b66590cc69a2999eda1ea82445974d753fd3a6762572de7945c6b7'
)
makedepends=('git')
depends=(
  "fontconfig"
  "pam"
  "freetype2"
)
license=("GPL-3.0")
url="https://github.com/maximilionus/lucidglyph"

build() {
  cd "$srcdir/$folder_name" || exit 1

  local patch_files
  patch_files=(
    "$srcdir/0001-make-DEST_ENVIRONMENT-dynamic.patch"
  )

  for patch_file in "${patch_files[@]}"; do
    patch -p1 <"$patch_file" || exit 1
  done
}

package() {
  cd "$srcdir/$folder_name" || exit 1

  local lucid_glyph_environment_file
  lucid_glyph_environment_file="$pkgdir/etc/environment.d/lucidglyph.conf"

  # Create the directory if it doesn't exist
  install -d "$(dirname "$lucid_glyph_environment_file")"

  local env_args
  env_args=(
    "DEST_ENVIRONMENT=$lucid_glyph_environment_file"
    "DESTDIR=$pkgdir"
  )

  env "${env_args[@]}" ./lucidglyph.sh install || exit 1

  # Remove /usr/share/lucidglyph/info
  rm --verbose "$pkgdir/usr/share/lucidglyph/info"

  # Remove uninstaller shell script
  rm --verbose "$pkgdir/usr/share/lucidglyph/uninstaller.sh"

  # Remove empty files and directories
  find "$pkgdir" -empty -delete
}
