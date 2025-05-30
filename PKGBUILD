# The name of the folder that contains the source files
folder_name="lucidglyph"

pkgname=("lucidglyph")
pkgver=0.11.0
pkgrel=2
arch=('any')
description='Carefully tuned adjustments designed to improve font rendering on Linux systems packaged for Arch Linux. It is patched to install the package globally and deal with an individual file at `/etc/environment.d` file, unlike the original that manually patches `/etc/environment` file directly.'
source=(
  "$folder_name::git+https://github.com/maximilionus/lucidglyph#tag=v$pkgver"
  "0001-allow-changing-uninstall-file-absolute-path.patch"
  "0002-allow-changing-absolute-environment-file-destination.patch"
)
validpgpkeys=(
  "B7E510C142B88F4B"
)
md5sums=(
  'SKIP'
  # ./0001-allow-changing-uninstall-file-absolute-path.patch
  'd8acbd5c286a8d3fcc9bfb523e626a5a'
  # ./0002-allow-changing-absolute-environment-file-destination.patch
  'bad5d9e406fbccfd55cf56478d73ed56'
)
sha512sums=(
  'SKIP'
  # ./0001-allow-changing-uninstall-file-absolute-path.patch
  '79ac53609f0fe97f56202ea12f9a7f755c7edd6de284b7537ed61ab4066228256baae47447dfe8c8f35964418a457ec8c67207fa7b7b37891b675c572169be5b'
  # ./0002-allow-changing-absolute-environment-file-destination.patch
  'bd7574b55f26a4482b6dc9a5e6da38d3133f0b24070ec7b399e3c482d5dd662a21a6db53bba3ab3f17dad86d6cf993318e3eaf0a614996c9d49b97f5c3bc2d4d'
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
    "$srcdir/0001-allow-changing-uninstall-file-absolute-path.patch"
    "$srcdir/0002-allow-changing-absolute-environment-file-destination.patch"
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

  local uninstaller_file_location
  # Point it to `/dev/null` to avoid having to delete the file afterwards
  uninstaller_file_location="/tmp/lucidglyph-uninstaller"

  local env_args
  env_args=(
    "DEST_UNINSTALL_FILE_ABSOLUTE_PATH=$uninstaller_file_location"
    "DEST_ENVIRONMENT=$lucid_glyph_environment_file"
    "DESTDIR=$pkgdir"
  )

  env "${env_args[@]}" ./lucidglyph.sh install || exit 1

  # Remove /usr/share/lucidglyph/info
  rm --verbose "$pkgdir/usr/share/lucidglyph/info"

  # Remove empty files and directories
  find "$pkgdir" -empty -delete
}
