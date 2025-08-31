# Maintainer: Gergely Meszaros <maetveis@gmail.com>
# Contribute at https://gitlab.com/Maetveis/aur-packages

_name='activitywatch'
pkgname="$_name-git"
pkgver=0.13.2.r11.gbd4c5e6
pkgrel=1
pkgdesc='Log what you do on your computer. Simple, extensible, no third parties.'
arch=('x86_64')
url="https://github.com/ActivityWatch/$_name"
license=('MPL2')

depends=(
  'python-click'
  'python-deprecation'
  'python-flask-cors'
  'python-flask-restx' # AUR
  'python-flask'
  'python-iso8601'
  'python-markupsafe'
  'python-peewee'
  'python-persist-queue' # AUR hosted in this repo
  'python-platformdirs'
  'python-pynput' # AUR
  'python-pyqt6'
  'python-requests'
  'python-setuptools'
  'python-tabulate'
  'python-timeslot' # AUR
  'python-tomlkit'
  'python-typing_extensions'
  'python-werkzeug'
  'python-xlib'
  'python'
)
makedepends=(
  'cargo'
  'desktop-file-utils'
  'git'
  'imagemagick'
  'npm'
  'python-installer'
  'python-poetry'
)
provides=('activitywatch')
conflicts=('activitywatch')

# Makepkg doesn't do LTO for rust, this causes C/C++ code compiled with LTO to fail to link with
# rust code (without LTO)
options=('!lto')

source=(
  "$_name::git+$url"
  'aw-core-install-schemas.patch'
  'aw-qt-install-logo.patch'
  'aw-server-fix-static-install.patch'
  'aw-server-pr152-fix-importerror-new-flask.patch::https://github.com/ActivityWatch/aw-server/pull/152.patch'
)
sha256sums=(
  'SKIP'
  'cba81025c0e38fd6022b0926972a839d7e6305830bf0c18e561692bfd2806b35'
  '9a8ef6abf6bc05d9c0c3d21fbc69621031f2b817c34ec075fcf2a88dd4415dd6'
  'd2abcb1605f70ceaa8ff2a3e3df25b1e088c17eced8f48355c937fe3c08a827a'
  'c716bf33264fdef5e6cb5bd5057601a51ee530918cba2f1a3c4773c81dff7c9b'
)

_aw_core="$_name/aw-core"
_aw_qt="$_name/aw-qt"
_aw_server_rust_dir='aw-server-rust'
_aw_server_rust="$_name/$_aw_server_rust_dir"
_aw_server="$_name/aw-server"
_aw_webui="$_aw_server/aw-webui"

_triple="$CARCH-unknown-linux-gnu"

pkgver() {
  cd "$_name" || exit 1
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "$srcdir/$_name" clean -dfx
  git -C "$srcdir/$_name" submodule foreach --recursive 'git clean -dfx'
  git -C "$srcdir/$_name" submodule update --init --recursive
  git -C "$srcdir/$_aw_core" apply "$srcdir/aw-core-install-schemas.patch"
  git -C "$srcdir/$_aw_qt" apply "$srcdir/aw-qt-install-logo.patch"
  git -C "$srcdir/$_aw_server" apply "$srcdir/aw-server-fix-static-install.patch"
  git -C "$srcdir/$_aw_server" apply "$srcdir/aw-server-pr152-fix-importerror-new-flask.patch"

  cd "$srcdir/$_aw_server_rust" || exit 1
  export RUSTUP_TOOLCHAIN='stable'
  cargo fetch --locked --target="$CARCH-unknown-linux-gnu"
}

_find_submodules() {
    cd "$srcdir/$_name" || exit 1

    IFS=' ' read -r -a submodules \
      < <(sed --silent '/^SUBMODULES/{s/^SUBMODULES[[:blank:]]*:=[[:blank:]]*//;p}' Makefile)

    IFS=' ' read -r -a python_submodules <<<"${submodules[@]/$_aw_server_rust_dir}"
}

_get_rustflags() {
  local _extra_rustflags=("--remap-path-prefix=$srcdir=${DBGSRCDIR:-/usr/src/debug}/$pkgbase")

  IFS=$'\x1f' read -r -a _cargo_encoded_rustflags <<<"$CARGO_ENCODED_RUSTFLAGS"
  _cargo_encoded_rustflags+=("${_extra_rustflags[@]}")
  (
    IFS=$'\x1f';
    printf '%s' "${_cargo_encoded_rustflags[*]}"
  )
}

build() {
  # Build aw-webui
  make --directory="$srcdir/$_aw_webui" build

  # References $srcdir in the output
  python -                                          \
    "$srcdir/$_aw_webui/dist/service-worker.js.map" \
    "$srcdir"                                       \
    "${DBGSRCDIR:-/usr/src/debug}/$pkgbase" <<'PYTHON'
import sys
with open(sys.argv[1], 'r+') as f:
  text = f.read()
  f.seek(0)
  f.write(text.replace(sys.argv[2], sys.argv[3]))
PYTHON

  # Copy webui into aw-server, will be later included as part of the python module
  mkdir --parents "$srcdir/$_aw_server/aw_server/static"
  cp --target-directory="$srcdir/$_aw_server/aw_server/static" --recursive "$srcdir/$_aw_webui/dist/."

  # Copy logo dir into aw-qt
  mkdir --parents "$srcdir/$_aw_qt/aw_qt/media/logo"
  cp --target-directory="$srcdir/$_aw_qt/aw_qt/media/logo" "$srcdir/$_aw_qt/media/logo/"*

  _find_submodules

  # Build python submodules
  for submodule in "${python_submodules[@]}"; do
      cd "$srcdir/$_name/$submodule" || exit 1
      poetry build --format=wheel
  done

  # Build aw-server-rust
  cd "$srcdir/$_aw_server_rust" || exit 1
  export RUSTUP_TOOLCHAIN='stable'
  export CARGO_ENCODED_RUSTFLAGS="$(_get_rustflags)"
  export AW_WEBUI_DIR="$srcdir/$_aw_webui/dist"
  cargo build --bins --frozen --release --target-dir='target' --target="$_triple"
}

package() {
  _find_submodules

  # install python packages
  find "${python_submodules[@]}" \
    -maxdepth 2                  \
    -type f                      \
    -path '*/dist/*.whl'         \
    -exec python -m installer --destdir="$pkgdir" '{}' ';'

  # install aw-server-rust
  install -D --mode=0755 --no-target-directory                   \
    "$srcdir/$_aw_server_rust/target/$_triple/release/aw-server" \
    "$pkgdir/usr/bin/aw-server-rust"

  # install other binaries distributed from aw-server-rust
  find "$srcdir/$_aw_server_rust/target/$_triple/release" \
    -maxdepth 1                                           \
    -type f                                               \
    -executable                                           \
    ! -name "aw-server"                                   \
    -exec install -D --mode=0755 --target-directory="$pkgdir/usr/bin" '{}' +

  # Install .desktop
  desktop-file-install --dir="$pkgdir/usr/share/applications" "$srcdir/$_aw_qt/resources/aw-qt.desktop"

  # Install icons
  for size in "32x32" "48x48"; do
    mkdir -p "$pkgdir/usr/share/icons/hicolor/$size/apps"
    convert "$srcdir/$_aw_qt/media/logo/logo.png" -colorspace RGB -resize "$size" \
      "$pkgdir/usr/share/icons/hicolor/$size/apps/activitywatch.png"
  done
  mkdir -p "$pkgdir/usr/share/icons/hicolor/512x512/apps"
  cp "$srcdir/$_aw_qt/media/logo/logo.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/activitywatch.png"
}
