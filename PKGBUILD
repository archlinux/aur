# Maintainer:

_pkgname="flutter"
pkgname="$_pkgname-bin"
pkgver=3.19.6
pkgrel=5
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

source=(
  "$_pkgsrc.$_pkgext"::"https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$pkgver-stable.$_pkgext"
)

sha256sums=(
  'db6742a20626d0d2a089eb41ad61b9b2138b996679911e9c8268c1f896191f97'
)

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

    # AUR
    unionfs-fuse
  )

  install -dm755 "$pkgdir/opt"
  bsdtar -xf "$srcdir/$_pkgsrc.$_pkgext" -C "$pkgdir/opt"

  install -Dm755 "flutter_init.sh" "$pkgdir/usr/bin/flutter_init"
  install -Dm755 "flutter_dart.sh" "$pkgdir/usr/bin/dart"
  install -Dm755 "flutter.sh" "$pkgdir/usr/bin/flutter"

  install -Dm644 "$pkgdir/opt/flutter/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$pkgdir/opt/flutter/PATENT_GRANT" -t "$pkgdir/usr/share/licenses/$pkgname/"

  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}

_gen_scripts() {
  cat > flutter_dart.sh << 'END'
#!/usr/bin/env bash

source /usr/bin/flutter_init

if ! grep -q '/usr/bin' <<< "$(which dart)"; then
  exec dart "$@"
fi
END

  cat > flutter.sh << 'END'
#!/usr/bin/env bash

source /usr/bin/flutter_init

if ! grep -q '/usr/bin' <<< "$(which flutter)"; then
  exec flutter "$@"
fi
END

  cat > flutter_init.sh << 'END'
#!/usr/bin/env bash

export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

APP_DIR="/opt/flutter"
SAVE_DIR="$XDG_CACHE_HOME/flutter_local"
MOUNT_DIR="$XDG_CACHE_HOME/flutter_sdk"

if [[ "${BASH_SOURCE[0]}" == "$0" ]]; then
  echo "$0 should not be executed directly."
  exit 1
fi

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

if whoami | grep -q -E 'builduser|main-builder'; then
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
