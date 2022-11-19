# Maintainer: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
pkgname='luxtorpeda-git'
pkgver=60.0.0.r370.2c040cd
pkgrel=1
pkgdesc='Steam Play compatibility tool to run games using native Linux engines'
arch=('x86_64' 'i686')
url='https://github.com/luxtorpeda-dev/luxtorpeda'
license=('GPL2')
depends=()
makedepends=('git' 'rust' 'godot')
optdepends=('steam: The Steam client')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("git+${url}.git"
        'reproducible-build.patch'
        'size-optimisations.patch'
        'install-fix.patch')
sha256sums=('SKIP'
            '38a0cc7ec879a2f2dec10adf98d9d76ad7ea9a66a097122031f1759a2c4761d1'
            '02fe3f63b7ff6e3f020c61ce02b2f91a8129668bc06aa16ba37709ed755b9334'
            '40c1cca6675266cef790fed9db66f963b310ddec952e452674a318d02b088700')

pkgver() {
  cd "${pkgname%-git}"
  local base="$(grep -oP '(?<=^version = ")[^"]+(?="$)' Cargo.toml)"
  local revision_count="$(git rev-list --count HEAD)"
  local revision_commit="$(git rev-parse --short HEAD)"
  echo "$base.r$revision_count.$revision_commit"
}

prepare() {
  cd "${pkgname%-git}"
  patch -Np1 -i "$srcdir/reproducible-build.patch"
  patch -Np1 -i "$srcdir/size-optimisations.patch"
  patch -Np1 -i "$srcdir/install-fix.patch"
}

build() {

  # Arch build of Godot doesn't support system-wide export templates,
  # therefore we need to use user-local installation - so we'll attempt
  # to pull the templates ONLY if they're not already present, and if they are,
  # then we simply skip the step and run with already-downloaded ones.
  #
  # Additionally, if we had to pull the export templates, we remove them
  # afterwards to avoid polluting user directory.
  #
  godot_version="$(pacman -Qi godot | awk -F " : " '/^Version/ {print $2}' | sed -E 's/-[^-]+$//')"
  godot_template_dir="${XDG_DATA_HOME:-$HOME/.local/share}/godot/templates/$godot_version.stable"
  godot_download_loc="$srcdir/godot-templates-$godot_version.zip"

  if [ -d "$godot_template_dir" ]; then
    echo "Godot export templates already present, skipping download"
  else
    echo "No Godot export templates present, downloading..."

    echo "Retrieving SHA512 checksum for verification..."
    template_sha512="$(curl -Ss "https://downloads.tuxfamily.org/godotengine/$godot_version/SHA512-SUMS.txt" | awk '/Godot_v'"$godot_version"'-stable_export_templates.tpz$/ {print $1}')  godot-templates-$godot_version.zip"

    if [ ! -f "$godot_download_loc" ]; then
      echo "Downloading export templates..."
      curl -o "$godot_download_loc" "https://downloads.tuxfamily.org/godotengine/$godot_version/Godot_v$godot_version-stable_export_templates.tpz"
    else
      echo "Export templates appear to already be downloaded"
    fi

    (cd "$srcdir" && sha512sum --quiet --check <(echo "$template_sha512"))
    echo "SHA512 checksums verified"

    # Unpack the godot templates into user-local directory
    mkdir -p "$godot_template_dir"
    unzip -j "$godot_download_loc" -d "$godot_template_dir"
  fi

  # Perform build and track what its success/failure is;
  # if there's a failure, we don't want to raise it until
  # the temporary export templates have been cleaned up
  if (
    cd "$srcdir/${pkgname%-git}" &&
    mkdir -p "target/release" &&
    make GODOT=/usr/bin/godot luxtorpeda
  ); then
    build_exitcode=0
  else
    build_exitcode=1
  fi

  if [ -v template_sha512 ]; then
    echo "Removing temporary export templates..."
    rm "$godot_template_dir/"*
    rmdir -p --ignore-fail-on-non-empty "$godot_template_dir"
  fi

  if [ "$build_exitcode" -ne 0 ]; then
    false
  fi
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make test
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
