# Maintainer:

# options
: ${CARGO_HOME:=${SRCDEST:-${startdir:?}}/cargo-home}

: ${_pkgtype:=git}

# basic info
_pkgname="mozillavpn"
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=2.19.0.r44.g54da75553
pkgrel=1
pkgdesc="Fast, secure, and easy to use VPN from the makers of Firefox"
url="https://github.com/mozilla-mobile/mozilla-vpn-client"
license=('MPL2')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    'dbus'
    'freetype2'
    'hicolor-icon-theme'
    'libtiff'
    'libxcb'
    'libxdmcp'
    'libxmu'
    'libxrender'
    'polkit'
    'qt6-5compat'
    'qt6-charts'
    'qt6-declarative'
    'qt6-imageformats'
    'qt6-networkauth'
    'qt6-shadertools'
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
    'python-glean-parser'
    'python-lxml'
    'python-yaml'
    'qt6-tools'
    'yamllint'
  )
  optdepends=(
    'openresolv: for resolv.conf management'
    'qt6-wayland: for Wayland support'
  )

  options=('!lto')

  if [ x"$pkgname" == x"$_pkgname" ] ; then
    _main_stable
  else
    _main_git
  fi

  _source_getsentry_sentry_native
  _source_mozillavpn
}

# stable package
_main_stable() {
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}")
  sha256sums+=('SKIP')

  _prepare() {
    cd "$_pkgsrc"
    local _tag=$(git tag | grep -Ev '^.*[A-Za-z]{2}.*$' | sort -V | tail -1)
    _pkgver="${_tag#v}"

    if [[ "$_tag" != "v${pkgver%%.r*}" ]] ; then
      git checkout -f "$_tag"
    fi
  }

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  # git package
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  _prepare() {
    :
  }

  pkgver() {
    cd "$_pkgsrc"
    local _tag=$(git tag | sort -V | tail -1)
    local _revision=$(git rev-list --count $_tag..HEAD)
    local _hash=$(git rev-parse --short HEAD)

    local _pkgver=$(
      printf '%s.r%s.g%s' \
        "${_tag#v}" \
        "$_revision" \
        "$_hash"
    )
    echo "${_pkgver:?}"
  }
}

# submodules
_source_mozillavpn() {
  source+=(
    #'kdab.android_openssl'::'git+https://github.com/KDAB/android_openssl.git'
    'adjust.android_sdk'::'git+https://github.com/adjust/android_sdk.git'
    'adjust.ios_sdk'::'git+https://github.com/adjust/ios_sdk.git'
    'getsentry.sentry-native'::'git+https://github.com/getsentry/sentry-native.git'
    'mozilla-l10n.mozilla-vpn-client-l10n'::'git+https://github.com/mozilla-l10n/mozilla-vpn-client-l10n.git'
    'mozilla.glean'::'git+https://github.com/mozilla/glean.git'
    'wireguard.wireguard-apple'::'git+https://github.com/WireGuard/wireguard-apple.git'
    'wireguard.wireguard-go'::'git+https://github.com/WireGuard/wireguard-go.git'
    'wireguard.wireguard-tools'::'git+https://github.com/WireGuard/wireguard-tools.git'
  )
  sha256sums+=(
    #'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_mozillavpn() (
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      #['kdab.android_openssl']='3rdparty/openSSL'
      ['adjust.android_sdk']='3rdparty/adjust-android-sdk'
      ['adjust.ios_sdk']='3rdparty/adjust-ios-sdk'
      ['getsentry.sentry-native']='3rdparty/sentry'
      ['mozilla-l10n.mozilla-vpn-client-l10n']='src/translations/i18n'
      ['mozilla.glean']='3rdparty/glean'
      ['wireguard.wireguard-apple']='3rdparty/wireguard-apple'
      ['wireguard.wireguard-go']='3rdparty/wireguard-go'
      ['wireguard.wireguard-tools']='3rdparty/wireguard-tools'
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
    cd "${srcdir:?}/$_pkgsrc"
    cd "3rdparty/sentry"
    local -A _submodules=(
      ['chromium.googlesource.com.linux-syscall-support']='external/third_party/lss'
      ['getsentry.breakpad']='external/breakpad'
      ['getsentry.crashpad']='external/crashpad'
      ['getsentry.libunwindstack-ndk']='external/libunwindstack-ndk'
    )
    _submodule_update
  )
}

# common functions
prepare() {
  _prepare

  _submodule_update() {
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_mozillavpn
  _prepare_getsentry_sentry_native
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}

# execute
_main_package
