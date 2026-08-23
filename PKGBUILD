# Maintainer: J. Simon Richard <jsimonrichard@gmail.com>
pkgname=hypr-taskspace
pkgver=0.1.0
pkgrel=1
pkgdesc="Task-centric Hyprland control plane with Omarchy and Waybar integration"
arch=('x86_64' 'aarch64')
url="https://github.com/jsimonrichard/hypr-taskspace"
license=('MIT')
depends=('gcc-libs' 'glibc' 'gtk3' 'hyprland')
makedepends=('cargo' 'pkgconf')
optdepends=(
  'waybar: CFFI taskspace/workspace module'
  'chromium: helper extension for tab restore'
)
options=(!strip !lto)
install="$pkgname.install"

# If this PKGBUILD sits next to install-share.sh (git checkout), build that tree
# instead of the GitHub tarball. Set TSK_AUR_PKGBUILD=1 to force the tarball.
_aur=1
if [[ -z ${TSK_AUR_PKGBUILD:-} && -f "$startdir/install-share.sh" ]]; then
  _aur=0
fi

# sha256 of the v$pkgver GitHub archive
_aur_sha256='6b98426b11c96d1631bf6dba554dc99577335374064d79982201aa28cf15c5e7'

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("$_aur_sha256")
if (( !_aur )); then
  source=()
  sha256sums=()
fi

_src_root() {
  if (( !_aur )); then
    ( cd "$startdir/../.." && pwd )
    return
  fi
  local d
  for d in "$srcdir/$pkgname-$pkgver" "$srcdir/$pkgname-v$pkgver"; do
    if [[ -d $d ]]; then
      printf '%s\n' "$d"
      return
    fi
  done
  echo "Cannot find extracted sources in $srcdir" >&2
  return 1
}

_cargo_env() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR="$startdir/target"
  # makepkg CFLAGS/LDFLAGS (-flto=auto, --as-needed) break bundled libsqlite3-sys linking
  unset CFLAGS CXXFLAGS LDFLAGS RUSTFLAGS
}

prepare() {
  cd "$(_src_root)"
  _cargo_env
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$(_src_root)"
  _cargo_env
  cargo build --frozen --release -p tsk-cli -p tsk-waybar
}

package() {
  local root
  root="$(_src_root)"
  _cargo_env

  install -Dm755 "$CARGO_TARGET_DIR/release/tsk" "$pkgdir/usr/bin/tsk"
  install -Dm755 "$CARGO_TARGET_DIR/release/libtsk_waybar.so" \
    "$pkgdir/usr/share/tsk/lib/libtsk_waybar.so"

  bash "$root/packaging/arch/install-share.sh" "$pkgdir" "$root"

  install -Dm644 "$root/packaging/arch/90-hypr-taskspace-reload.hook" \
    "$pkgdir/usr/share/libalpm/hooks/90-hypr-taskspace-reload.hook"
  install -Dm755 "$root/packaging/arch/reload-hyprland.sh" \
    "$pkgdir/usr/share/libalpm/scripts/hypr-taskspace-reload-hyprland"
  install -Dm644 "$root/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
