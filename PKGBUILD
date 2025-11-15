# Maintainer:

_pkgname="flutter"
pkgname="$_pkgname-bin"
pkgver=3.38.1
pkgrel=1
pkgdesc="Cross platform widget toolkit for Dart (monolithic)"
arch=("x86_64")
url="https://github.com/flutter/flutter"
license=("BSD-3-Clause" "LicenseRef-Google-Patent-Grant")

provides=(
  dart
  flutter
  flutter-tool
  flutter-target-linux
  flutter-target-android
  flutter-target-web
)
conflicts=(
  dart
  flutter-engine

  flutter
  flutter-common
  flutter-devel
  flutter-engine-android-google-bin
  flutter-engine-common-google-bin
  flutter-engine-linux-google-bin
  flutter-engine-web-google-bin
  flutter-gradle
  flutter-gradle-google-bin
  flutter-intellij-patch
  flutter-material-fonts-google-bin
  flutter-sky-engine-google-bin
  flutter-target-android
  flutter-target-linux
  flutter-target-web
  flutter-tool

  flutter-engine-android
  flutter-engine-common
  flutter-engine-linux
  flutter-engine-web
  flutter-gradle
  flutter-material-fonts
  flutter-sky-engine
  flutter-tool-developer
)

install="$_pkgname.install"

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.xz"

options=("!emptydirs" "!strip" "!debug")
noextract=("$_pkgsrc.$_pkgext")

_url_dl="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux"
source=("$_pkgsrc.$_pkgext"::"$_url_dl/flutter_linux_$pkgver-stable.$_pkgext")
md5sums=('a59a742c1182f2ac01670f3be0234d92')

prepare() {
  _gen_scripts
}

package() {
  depends+=(
    clang
    cmake
    git
    lld
    llvm
    ninja
    unionfs-fuse # AUR
  )

  # main files
  install -dm755 "$pkgdir/opt"
  bsdtar -xf "$srcdir/$_pkgsrc.$_pkgext" -C "$pkgdir/opt"

  # scripts
  install -Dm755 "flutter.sh" "$pkgdir/opt/flutter/bin/aur_flutter"
  install -Dm755 "flutter_dart.sh" "$pkgdir/opt/flutter/bin/aur_dart"
  install -Dm644 "flutter_init.sh" "$pkgdir/opt/flutter/bin/aur_init.sh"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/flutter/bin/aur_flutter" "$pkgdir/usr/bin/flutter"
  ln -sf "/opt/flutter/bin/aur_dart" "$pkgdir/usr/bin/dart"

  # gitignore
  echo "dart_aur" >> "$pkgdir/opt/flutter/.git/info/exclude"
  echo "flutter_aur" >> "$pkgdir/opt/flutter/.git/info/exclude"
  echo "flutter_init.sh" >> "$pkgdir/opt/flutter/.git/info/exclude"

  # license
  install -Dm644 "$pkgdir/opt/flutter/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$pkgdir/opt/flutter/PATENT_GRANT" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}

_gen_scripts() {
  cat > flutter_dart.sh << 'END'
#!/usr/bin/env bash

source /opt/flutter/bin/aur_init.sh

if ! grep -q '/usr/bin' <<< "$(which dart)"; then
  exec dart "$@"
fi
END

  cat > flutter.sh << 'END'
#!/usr/bin/env bash

source /opt/flutter/bin/aur_init.sh

if ! grep -q '/usr/bin' <<< "$(which flutter)"; then
  exec flutter "$@"
fi
END

  cat > flutter_init.sh << 'END'
#!/usr/bin/env -S bash -c "echo 'Do no run this script directly.'"

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  echo "$0 should not be executed directly."
  exit 1
fi

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

APP_DIR="/opt/flutter"
SAVE_DIR="$XDG_CACHE_HOME/flutter_local"
MOUNT_DIR="$XDG_CACHE_HOME/flutter_sdk"

if [ ! -e "$APP_DIR" ]; then
  echo "/opt/flutter not found."
  return 1
fi

_unionfs() {
  if [ ! -e "$MOUNT_DIR/bin/flutter" ]; then
    mkdir -p "$SAVE_DIR"
    mkdir -p "$MOUNT_DIR"

    if ! unionfs -o cow -o umask=000 "$SAVE_DIR=RW:$APP_DIR=RO" "$MOUNT_DIR" > /dev/null 2>&1; then
      echo "unionfs failed"
      return 1
    fi
  fi
}

if whoami | grep -q -E 'builder|builduser|main-builder'; then
  export FLUTTER_ROOT="$APP_DIR"
elif grep -q flutter <<< $(groups); then
  export FLUTTER_ROOT="$APP_DIR"
elif _unionfs; then
  if [ -e "$MOUNT_DIR/bin" ]; then
    if ! grep -q "$MOUNT_DIR" <<< "$PATH"; then
      export FLUTTER_ROOT="$MOUNT_DIR"
    fi
  fi
fi

if ! grep -q "$FLUTTER_ROOT" <<< "$PATH"; then
  export PATH="$FLUTTER_ROOT/bin:$PATH"
fi
END
}
