# Maintainer:

_pkgname="flutter"
pkgname="$_pkgname-bin"
pkgver=3.50.1
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
source=(
  "$_pkgsrc.$_pkgext"::"$_url_dl/flutter_linux_$pkgver-stable.$_pkgext"
  'flutter_init.sh'
)
md5sums=(
  'fbbd15d55c7b160f375f35fefd69d615' # upstream uses md5
  '75c0438c0f4e07993ab1f0e3e5e54c72'
)

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

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/opt/flutter/bin/aur_flutter" "$pkgdir/usr/bin/flutter"
  ln -sf "/opt/flutter/bin/aur_dart" "$pkgdir/usr/bin/dart"

  # license
  install -Dm644 "$pkgdir/opt/flutter/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 "$pkgdir/opt/flutter/PATENT_GRANT" -t "$pkgdir/usr/share/licenses/$pkgname/"

  # gitignore
  cat >> "$pkgdir/opt/flutter/.git/info/exclude" << END
dart_aur
flutter_aur
flutter_init.sh
version_cache
END

  # scripts
  install -Dm644 "flutter_init.sh" "$pkgdir/opt/flutter/bin/aur_init.sh"

  install -Dm755 /dev/stdin "$pkgdir/opt/flutter/bin/aur_flutter" << 'END'
#!/usr/bin/env bash

source /opt/flutter/bin/aur_init.sh

if ! grep -q '/usr/bin' <<< "$(which flutter)"; then
  exec flutter "$@"
fi
END

  install -Dm755 /dev/stdin "$pkgdir/opt/flutter/bin/aur_dart" << 'END'
#!/usr/bin/env bash

source /opt/flutter/bin/aur_init.sh

if ! grep -q '/usr/bin' <<< "$(which dart)"; then
  exec dart "$@"
fi
END

  # permissions
  chmod -R u+rwX,go+rX,go-w "$pkgdir"
}
