# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: Ali Molaei <ali dot molaei at protonmail dot com>
# Maintainer: Ben Westover <me at benthetechguy dot net>
# Contributor: Lenovsky <lenovsky at pm dot me>
# Contributor: aimileus <me at aimileus dot nl>

pkgname=protonmail-bridge
_name=proton-bridge
pkgver=3.6.1
pkgrel=3
pkgdesc="Integrate ProtonMail paid account with any program that supports IMAP and SMTP"
arch=(x86_64)
url="https://github.com/ProtonMail/proton-bridge"
license=(GPL3)
depends=(
  abseil-cpp
  gcc-libs
  glib2
  glibc
  grpc
  hicolor-icon-theme
  libsecret
  protobuf
  qt6-base
  qt6-declarative
  qt6-svg
  sentry-native
)
makedepends=(
  cmake
  go
)
optdepends=(
  'gnome-keyring: gnome-keyring support'
  'org.freedesktop.secrets: Applications that support Freedesktop secrets api'
  'pass: pass support'
  'qt6-wayland: Wayland support'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "protonmail-bridge.desktop"
  "remove-vcpkg-dependency.patch"
)
sha256sums=(
  '2dd18b5460fff9c84edaf3eb7401357e8d311c3e63564db8c5adcb63e54877af'
  '404db600803b9be875365d84e0726c3f7aedceaf122a795ca2248ee9f005753b'
  '436a9a293424fb7d48a8fd61fff7d63985dec56d6170cd2fbae24fe03ef98136'
)

_archive="$_name-$pkgver"

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

  (
    cd ./utils/
    ./credits.sh bridge
  )

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

  _ld_flags=" \
    -X github.com/ProtonMail/proton-bridge/v3/internal/constants.Version=$pkgver \
    -X github.com/ProtonMail/proton-bridge/v3/internal/constants.Revision=NOGIT \
    -X github.com/ProtonMail/proton-bridge/v3/internal/constants.Tag=$pkgver \
    -X github.com/ProtonMail/proton-bridge/v3/internal/constants.BuildTime= \
    -X 'github.com/ProtonMail/proton-bridge/v3/internal/constants.FullAppName=Proton Mail Bridge' \
    -X 'github.com/ProtonMail/proton-bridge/v3/internal/constants.BuildEnv=Arch Linux' \
  "

  go build -v \
    -ldflags "$_ld_flags" \
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

check() {
  cd "$_archive"

  cmake --build build --target bridgepp-test
  ./build/bridgepp/bridgepp-test

  # Skip long-running tests or tests interacting with the keyring
  _unit_tests=$(
    go list ./internal/... ./pkg/... \
      | grep -v 'github.com/ProtonMail/proton-bridge/v3/internal/app' \
      | grep -v 'github.com/ProtonMail/proton-bridge/v3/internal/bridge' \
      | grep -v 'github.com/ProtonMail/proton-bridge/v3/internal/dialer' \
      | grep -v 'github.com/ProtonMail/proton-bridge/v3/internal/services' \
      | grep -v 'github.com/ProtonMail/proton-bridge/v3/internal/user' \
      | grep -v 'github.com/ProtonMail/proton-bridge/v3/internal/usertypes' \
      | grep -v 'github.com/ProtonMail/proton-bridge/v3/internal/vault' \
      | grep -v 'github.com/ProtonMail/proton-bridge/v3/pkg/keychain' \
      | sort
  )

  # shellcheck disable=SC2086
  go test -count=1 $_unit_tests
}

package() {
  cd "$_archive"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/applications/" "$srcdir/protonmail-bridge.desktop"
  install -Dm644 -t "$pkgdir/usr/share/doc/protonmail/bridge/" ./*.md
  install -Dm644 dist/bridge.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/protonmail-bridge.svg"

  install -Dm755 bridge "$pkgdir/usr/lib/protonmail/bridge/bridge"
  install -Dm755 build/bridge-gui "$pkgdir/usr/lib/protonmail/bridge/bridge-gui"

  install -dm755 "$pkgdir/usr/bin/"
  ln -s /usr/lib/protonmail/bridge/bridge-gui "$pkgdir/usr/bin/protonmail-bridge"
}
