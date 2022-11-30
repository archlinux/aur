# Maintainer: Mikołaj "D1SoveR" Banasik <d1sover@gmail.com>
pkgname='luxtorpeda-git'
pkgver=61.0.0.r373.e192991
pkgrel=1
pkgdesc='Steam Play compatibility tool to run games using native Linux engines'
arch=('x86_64' 'i686')
url='https://github.com/luxtorpeda-dev/luxtorpeda'
license=('GPL2')
depends=()
makedepends=('git' 'rust' 'clang' 'godot-headless-bin')
optdepends=('steam: The Steam client')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')

# Standard godot requires X11 for building a project even with '--no-window' argument,
# and to avoid that, we prefer godot-headless package, which specifically avoids that
# requirement.
# If regular godot package from Arch repository is preferred, run the build with
# 'USE_STANDARD_GODOT=1' environment variable; in such case, if it's run on a headless
# system, an extra make dependency will be pulled to fake the X11 server.
#
if [[ -v USE_STANDARD_GODOT ]]; then
  makedepends[-1]="godot"
  godot_command=('make' 'GODOT=/usr/bin/godot')
  if [[ ! -v DISPLAY ]]; then
    makedepends+=('xorg-server-xvfb')
    godot_command=('xvfb-run' "--auth-file=$(mktemp -u)" '--error-file=/dev/stderr' "${godot_command[@]}")
  fi
else
  godot_command=('make' 'GODOT=/usr/bin/godot-headless')
fi

source=("git+${url}.git"
        'reproducible-build.patch'
        'size-optimisations.patch'
        'install-fix.patch')
sha256sums=('SKIP'
            '445877f799295c8aca62fecd5679de9fbd08dd7d1dc11d8dd960cb14e0e6bda5'
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
  godot_version="$(pacman -Qi "${makedepends[3]}" | awk -F " : " '/^Version/ {print $2}' | sed -E 's/-[^-]+$//')"
  godot_template_dir="${XDG_DATA_HOME:-$HOME/.local/share}/godot/templates/$godot_version.stable"
  godot_download_loc="$srcdir/godot-templates-$godot_version.zip"

  if [ -d "$godot_template_dir" ]; then
    echo "Godot export templates v${godot_version} already present, skipping download"
  else
    echo "No Godot export templates v${godot_version} present, downloading..."

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
    echo "Unpacking export templates into user directory..."
    mkdir -p "$godot_template_dir"
    cd "$godot_template_dir"
    bsdtar -xf "$godot_download_loc"
    mv templates/* . && rmdir templates
  fi

  # The actual build is run in a sub-shell with a trap set up to remove the temporary export templates.
  # pacman sets up its own traps for signals and exists, and the sub-shell setup ensures that the clean-up
  # will happen regardless of what happens during the build process (including user-initiated aborts).
  (
    if [ -v template_sha512 ]; then
      trap -- "echo 'Removing temporary export templates...' && rm -f '$godot_template_dir/'* && rmdir -p --ignore-fail-on-non-empty '$godot_template_dir'" EXIT TERM
    fi

    cd "$srcdir/${pkgname%-git}" &&
    mkdir -p "target/release" &&
    "${godot_command[@]}" luxtorpeda
  )
}

check() {
  cd "$srcdir/${pkgname%-git}"
  make test
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
