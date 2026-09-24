# Maintainer: Noah Vogt <noah@noahvogt.com>
# Based on the AUR fluffychat package by aur.chaotic.cx and
# The one with the braid <info@braid.business>

# Flutter's linux engine ignores fontconfig and only falls back to the font
# families named by the app. Its default fallback list lacks a color emoji
# font but contains DejaVu Sans, so emojis render as monochrome DejaVu glyphs.
# 0001-color-emoji-fallback.patch puts Noto Color Emoji in front of it.

: ${FVM_CACHE_PATH:=$SRCDEST/fvm-cache}
export FVM_CACHE_PATH

_pkgname="fluffychat"
pkgname="$_pkgname-color-emoji"
pkgver=2.9.5
pkgrel=1
pkgdesc="The cutest instant messenger in the [matrix] (with color emoji fallback)"
url="https://github.com/krille-chan/fluffychat"
license=('AGPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'gtk3'
  'libsecret' # flutter_secure_storage
  'noto-fonts-emoji'
  'openssl'   # sqlite encryption
  'webkit2gtk-4.1'
  'xdg-user-dirs' # path_provider
)
makedepends=(
  'clang'
  'cmake'
  'fvm'
  'git'
  'lld'
  'llvm'
  'ninja'
  'patchelf'
  'rust'
)
optdepends=(
  'zenity: for flutter_file_picker'
  'kdialog: for flutter_file_picker'
)
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")

options=('!lto' '!strip' '!debug')

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext"
  '0000-fix-wayland-gtk-csd.patch'
  '0001-color-emoji-fallback.patch'
)
sha256sums=('d09fb5b37ea5e6c9427167d6ca139fb0b80a91c1cc7fdf28e8347fb0e07f30a4'
  '04a373c2c25a9be1617ab1ccb19da48ae379ff392bb59a3938bcdec00ab82230'
  'b35ccd4fdf32109ecbfd4979828a4b21ee66d38b67c1175c7ebe7ca90f2ecd1f')

prepare() (
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    if [[ $src == *.patch ]]; then
      printf '\n\nApplying patch: %s\n' "$src"
      patch -d "$_pkgsrc" -Np1 -F100 -i "${srcdir:?}/$src"
    fi
  done
)

build() {
  local _units=$(OMP_NUM_THREADS=16 nproc --all)
  export CARGO_PROFILE_RELEASE_LTO=false
  export CARGO_PROFILE_RELEASE_CODEGEN_UNITS=$_units

  export CFLAGS CXXFLAGS
  CFLAGS+=" -Wno-error=deprecated-literal-operator"
  CXXFLAGS+=" -Wno-error=deprecated-literal-operator"

  # fix missing include
  export CXXFLAGS+=" -include cstdint"

  # fix incompatible flags on ARM
  if [ "${CARCH::1}" != "x" ]; then
    local _unwanted=(
      -fstack-protector-strong
      -fstack-clash-protection
    )

    for i in "${_unwanted[@]}"; do
      CFLAGS=$(sed -E -e "s&${i}&&g" -e 's&\s+& &g' <<< "$CFLAGS")
      CXXFLAGS=$(sed -E -e "s&${i}&&g" -e 's&\s+& &g' <<< "$CXXFLAGS")
    done
  fi

  # cargokit (flutter_vodozemac) insists on rustup; give it a stand-in that
  # uses the system rust toolchain
  mkdir -p "$srcdir/rustup-shim"
  cat > "$srcdir/rustup-shim/rustup" << 'EOF'
#!/bin/sh
case "$1 $2" in
  "toolchain list") echo "stable-$(rustc -vV | sed -n 's/^host: //p') (default)" ;;
  "target list") rustc -vV | sed -n 's/^host: //p' ;;
  "run "*) shift 2; exec "$@" ;;
  *) exit 0 ;;
esac
EOF
  chmod +x "$srcdir/rustup-shim/rustup"
  export PATH="$srcdir/rustup-shim:$PATH"

  cd "$_pkgsrc"

  : ${_fvm_version=$(grep -Pom1 'flutter: \K[0-9\.]+' ".tool_versions.yaml")}

  fvm install "$_fvm_version"
  fvm use "$_fvm_version" --force

  fvm flutter --disable-analytics
  fvm flutter pub get
  fvm flutter build linux --no-pub --release
}

package() {
  pushd "$_pkgsrc"/build/linux/*/release
  cmake -DCMAKE_INSTALL_PREFIX="/usr/lib/$_pkgname" .
  DESTDIR="$pkgdir" cmake -P cmake_install.cmake
  popd

  # rpath
  patchelf --set-rpath '$ORIGIN' "$pkgdir/usr/lib/$_pkgname/lib"/*.so

  # symlink
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/usr/lib/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  # license
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # icon
  install -Dm644 "$_pkgsrc/assets/logo/vector/logo_standalone.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.svg"

  # launcher
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Type=Application
Name=FluffyChat
Comment=$pkgdesc
Exec=$_pkgname
Icon=$_pkgname
SingleMainWindow=true
StartupWMClass=chat.fluffy.fluffychat
Terminal=false
StartupNotify=false
Categories=Network;InstantMessaging;Chat;MatrixClient
X-Purism-FormFactor=Workstation;Mobile;
END
}
