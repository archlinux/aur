# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Maintainer: Ben Westover <me at benthetechguy dot net>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>

pkgbase=protonmail-bridge
_basename=proton-bridge
pkgname=(
  protonmail-bridge-core
  protonmail-bridge
)
pkgver=3.10.0
pkgrel=1
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=(x86_64)
url="https://github.com/ProtonMail/proton-bridge"
license=(GPL-3.0-only)
makedepends=(
  abseil-cpp
  cmake
  gcc-libs
  glib2
  glibc
  go
  grpc
  libsecret
  protobuf
  qt6-base
  qt6-declarative
  qt6-svg
  sentry-native
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "protonmail-bridge.desktop"
  "protonmail-bridge.service"
  "remove-vcpkg-dependency.patch"
)
sha256sums=(
  'fe2b048eb3a442a571e469ed376697a7c038189a29f824ffefc00d6fc36ba766'
  '404db600803b9be875365d84e0726c3f7aedceaf122a795ca2248ee9f005753b'
  'd51fb6efde22354d84b894b979a685d06fcc9cf3040d999d1cd6ebf5242a5043'
  '436a9a293424fb7d48a8fd61fff7d63985dec56d6170cd2fbae24fe03ef98136'
)

_archive="$_basename-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip 1 --input "$srcdir/remove-vcpkg-dependency.patch"

  # Use system Qt rather than bundling it
  rm internal/frontend/bridge-gui/bridge-gui/DeployLinux.cmake
  touch internal/frontend/bridge-gui/bridge-gui/DeployLinux.cmake

  # Avoid downloading Go dependencies in build() by doing it here instead
  go mod download -x
}

build() {
  cd "$_archive"

  pushd utils/
  ./credits.sh bridge
  popd

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  local ld_flags=" \
    -X github.com/ProtonMail/proton-bridge/v3/internal/constants.Version=$pkgver \
    -X github.com/ProtonMail/proton-bridge/v3/internal/constants.Revision=NOGIT \
    -X github.com/ProtonMail/proton-bridge/v3/internal/constants.Tag=$pkgver \
    -X github.com/ProtonMail/proton-bridge/v3/internal/constants.BuildTime= \
    -X 'github.com/ProtonMail/proton-bridge/v3/internal/constants.FullAppName=Proton Mail Bridge' \
    -X 'github.com/ProtonMail/proton-bridge/v3/internal/constants.BuildEnv=Arch Linux' \
  "
  go build -v -buildvcs=false \
    -ldflags "$ld_flags" \
    -o bridge \
    ./cmd/Desktop-Bridge/

  cmake \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=YES \
    -Wno-dev \
    -DBRIDGE_APP_FULL_NAME='Proton Mail Bridge' \
    -DBRIDGE_VENDOR='Proton AG' \
    -DBRIDGE_REVISION=NOGIT \
    -DBRIDGE_TAG=$pkgver \
    -DBRIDGE_DSN_SENTRY= \
    -DBRIDGE_BUILD_ENV='Arch Linux' \
    -DBRIDGE_APP_VERSION=$pkgver \
    -S internal/frontend/bridge-gui/bridge-gui \
    -B build
  cmake --build build
}

package_protonmail-bridge-core() {
  pkgdesc="$pkgdesc (core executable and daemon)"
  depends=(
    glib2
    glibc
    libsecret
  )
  optdepends=(
    'gnome-keyring: gnome-keyring support'
    'org.freedesktop.secrets: Applications that support Freedesktop secrets api'
    'pass: pass support'
  )

  cd "$_archive"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/protonmail/bridge" ./*.md

  install -Dm644 -t "$pkgdir/usr/lib/systemd/user" "$srcdir/protonmail-bridge.service"

  install -Dm755 bridge "$pkgdir/usr/lib/protonmail/bridge/bridge"

  install -dm755 "$pkgdir/usr/bin/"
  ln -s /usr/lib/protonmail/bridge/bridge "$pkgdir/usr/bin/protonmail-bridge-core"
}

package_protonmail-bridge() {
  pkgdesc="$pkgdesc (Qt desktop application)"
  depends=(
    protonmail-bridge-core

    abseil-cpp
    gcc-libs
    glibc
    grpc
    hicolor-icon-theme
    protobuf
    qt6-base
    qt6-declarative
    qt6-svg
    sentry-native
  )
  optdepends=(
    'qt6-wayland: Wayland support'
  )

  cd "$_archive"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/protonmail-bridge.desktop"
  install -Dm644 dist/bridge.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/protonmail-bridge.svg"

  install -Dm755 build/bridge-gui "$pkgdir/usr/lib/protonmail/bridge/bridge-gui"

  install -dm755 "$pkgdir/usr/bin/"
  ln -s /usr/lib/protonmail/bridge/bridge-gui "$pkgdir/usr/bin/protonmail-bridge"
}
