# The name of the folder that contains the source files
folder_name="lucidglyph"

pkgname=("lucidglyph")
pkgver=0.13.1
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
  'b4790600c5d775a5fb78df11f02f924a'
)
sha512sums=(
  'SKIP'
  '4662263480f0378b83cc19b98eda0ae1f0f7ca70fb8cb23c8899e3b830d9ea854fdf98d5f8903861d2af5ea4a7605ad8595287a8cca46e7323860f27a222fe79' # 0001-make-DEST_ENVIRONMENT-dynamic.patch
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
    "DEST_CONF=/etc"
    "DEST_USR=/usr"
    "DISABLE_METADATA=1"
  )

  env "${env_args[@]}" ./lucidglyph.sh install --system || exit 1
}
