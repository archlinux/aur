# Maintainer:

: ${CARGO_HOME:=$SRCDEST/cargo-home}
: ${CARGO_TARGET_DIR:=target}
: ${RUSTUP_TOOLCHAIN:=stable}

export CARGO_HOME CARGO_TARGET_DIR RUSTUP_TOOLCHAIN

_pkgname="mozillavpn"
pkgname="$_pkgname-git"
pkgver=2.24.3.r263.g304d0ff
pkgrel=1
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox"
url="https://github.com/mozilla-mobile/mozilla-vpn-client"
license=('MPL-2.0')
arch=('x86_64')

depends=(
  'hicolor-icon-theme'
  'libsecret'
  'qt6-5compat'
  'qt6-declarative'
  'qt6-networkauth'
  'qt6-svg'
  'qt6-websockets'
  'wireguard-tools'
)
makedepends=(
  'cargo'
  'clang'
  'cmake'
  'git'
  'go'
  'ninja'
  'python-glean-parser' # AUR
  'python-lxml'
  'python-yaml'
  'qt6-tools'
  'yamllint'
)
optdepends=(
  'qt6-wayland: for Wayland support'
)

options=('!lto')

install="$_pkgname.install"

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_source_main() {
  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')
}

_source_mozillavpn() {
  source+=(
    #'adjust.android_sdk'::'git+https://github.com/adjust/android_sdk.git'
    #'adjust.ios_sdk'::'git+https://github.com/adjust/ios_sdk.git'
    'getsentry.sentry-native'::'git+https://github.com/getsentry/sentry-native.git'
    #'kdab.android_openssl'::'git+https://github.com/KDAB/android_openssl.git'
    'mozilla-l10n.mozilla-vpn-client-l10n'::'git+https://github.com/mozilla-l10n/mozilla-vpn-client-l10n.git'
    'mozilla.glean'::'git+https://github.com/mozilla/glean.git'
    #'mozilla.wireguard-apple'::'git+https://github.com/mozilla/wireguard-apple.git'
    'wireguard.wireguard-go'::'git+https://github.com/WireGuard/wireguard-go.git'
    'wireguard.wireguard-tools'::'git+https://github.com/WireGuard/wireguard-tools.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_mozillavpn() (
    cd "$srcdir/$_pkgsrc"
    local _submodules=(
      #'adjust.android_sdk'::'3rdparty/adjust-android-sdk'
      #'adjust.ios_sdk'::'3rdparty/adjust-ios-sdk'
      'getsentry.sentry-native'::'3rdparty/sentry'
      #'kdab.android_openssl'::'3rdparty/openSSL'
      'mozilla-l10n.mozilla-vpn-client-l10n'::'3rdparty/i18n'
      'mozilla.glean'::'3rdparty/glean'
      #'mozilla.wireguard-apple'::'3rdparty/wireguard-apple'
      'wireguard.wireguard-go'::'3rdparty/wireguard-go'
      'wireguard.wireguard-tools'::'3rdparty/wireguard-tools'
    )
    _submodule_update
  )
}

_source_getsentry_sentry_native() {
  source+=(
    'chromium.googlesource.com.linux-syscall-support'::'git+https://chromium.googlesource.com/linux-syscall-support.git'
    'getsentry.breakpad'::'git+https://github.com/getsentry/breakpad.git'
    'getsentry.crashpad'::'git+https://github.com/getsentry/crashpad.git'
    'getsentry.libunwindstack-ndk'::'git+https://github.com/getsentry/libunwindstack-ndk.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_getsentry_sentry_native() (
    cd "$srcdir/$_pkgsrc"
    cd "3rdparty/sentry"
    local _submodules=(
      'chromium.googlesource.com.linux-syscall-support'::'external/third_party/lss'
      'getsentry.breakpad'::'external/breakpad'
      'getsentry.crashpad'::'external/crashpad'
      'getsentry.libunwindstack-ndk'::'external/libunwindstack-ndk'
    )

    git checkout master
    _submodule_update
  )
}

_source_main
_source_mozillavpn
_source_getsentry_sentry_native

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
      echo
    done
  }

  _prepare_mozillavpn
  _prepare_getsentry_sentry_native

  cd "$_pkgsrc"
  cargo update
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "$_pkgsrc"
  local _tag=$(git tag | sort -rV | head -1)
  local _revision=$(git rev-list --count --cherry-pick $_tag...HEAD)
  local _hash=$(git rev-parse --short=7 HEAD)

  printf '%s.r%s.g%s' \
    "${_tag#v}" \
    "$_revision" \
    "$_hash"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
