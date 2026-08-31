# Maintainer: Lukáš Lipinský <6032558+Mr-Tao@users.noreply.github.com>

pkgbase=soundtouch-pipewire
pkgname=(
  'soundtouch-pipewire'
  'soundtouch-pipewire-control'
)
pkgver=0.1.0
pkgrel=64
arch=('x86_64')
url='https://github.com/Mr-Tao/soundtouch-pipewire'
license=('MIT AND Unicode-3.0 AND LicenseRef-STPW-SoundTouch-Supplement-1')
_pipewire_ver=1.6.8
_pipewire_pkgver=1:1.6.8
_release_state='READY'

_daemon_depends=(
  'avahi'
  'glib2'
  'glibc'
  'json-glib'
  'libgcc'
  "libpipewire=${_pipewire_pkgver}"
  'libsoup3'
  'libxml2'
  'openssl'
  'opus'
  "pipewire=${_pipewire_pkgver}"
  "pipewire-audio=${_pipewire_pkgver}"
  'systemd'
  'wireplumber>=0.5.15'
)
makedepends=(
  'avahi'
  'gettext'
  'glib2'
  'glib2-devel'
  'gtk4'
  'json-glib'
  "libpipewire=${_pipewire_pkgver}"
  'libsoup3'
  'libxml2'
  'meson'
  'ninja'
  'openssl'
  'opus'
  'patchelf'
  "pipewire=${_pipewire_pkgver}"
  "pipewire-audio=${_pipewire_pkgver}"
  'pkgconf'
  'rust'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
  'libpulse'
  "pipewire-pulse=${_pipewire_pkgver}"
  'wireplumber>=0.5.15'
)
provides=()
conflicts=()
replaces=()

source=(
  "${pkgbase}-${pkgver}.tar.gz::https://github.com/Mr-Tao/${pkgbase}/releases/download/v${pkgver}/${pkgbase}-${pkgver}.tar.gz"
  "pipewire-${_pipewire_ver}.tar.gz::https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/${_pipewire_ver}/pipewire-${_pipewire_ver}.tar.gz"
  '0001-pipewire-raop-free-pending-messages.patch'
  '0002-pipewire-raop-safe-volume.patch'
  '0003-pipewire-raop-dacp-control.patch'
  '0004-pipewire-raop-safety-gate.patch'
  '0005-pipewire-soundtouch-zone-sink.patch'
  '0006-pipewire-raop-ownership-marker.patch'
  '0007-pipewire-raop-explicit-demand.patch'
  '0008-pipewire-raop-publish-marker-after-progress.patch'
  '0009-pipewire-raop-route-revision.patch'
  '0010-pipewire-raop-activation-reconnect.patch'
  '0011-pipewire-raop-contract2-props-normalizer.patch'
  'soundtouch-pipewire.service'
  'soundtouch-pipewire.conf.example'
)
sha256sums=('e83114cce8cf3289b20697b57282440f9cac24e09a460c034eee8765aa884289'
            '8181172a1d95131f6af8bbc0b98f90b2a33349b042b84c3ce57dd5d11348cc58'
            '4dd5fbf8ae0853866a9c88c8c86ae96b53347c998c9aa564bd92051cc3227120'
            '484fad982e6e8ae850cf69d19868739933d2662c51fd213b8552f2698d932c18'
            '47caca252ee62eda9e1c46481067c61bacb4c781f1d9ea45c77bcb288e2d6d2a'
            '834765be0f637e9124a88061d61d5be668f121093285e02a97c5667312a483a1'
            'd345f1457b46faed669436420e5265957112ca70b2f2549a1210cf47b3f95124'
            'debdabf30d010a53d571aae1678431687deb46bba88ca392f78224c12738788f'
            'b51040735ecb6d7405b08a6a275b2e0ce0c36b71bbb26bc1715da006e5c1e77d'
            '23d97eb02cd2513c5bf1c531430b15ef65d211316e8d334433a80cc623fb541f'
            'f6b4ed98f42fa648f6dbf4c80985c9dd5f6c838872b4b892341ffb58e0dc1694'
            'b5187b549e9bd810a98597f4c7d958fbb1d0076206bb3fc6dbcd2ccd34065329'
            '2fdd34736c103df49483fe00de7b75f14e312d58d4f159fb60e4c3a0a18a63ac'
            '0de0d89452bae790bd5f000d5bea5355ae84b17ab314f9465dcc4cc079a61307'
            '6a66f908199e8d9993e16d4a61e34600f1c3859b62cc34fcfbe318cead8585a7')

_assert_release_gate() {
  if [[ $_release_state == 'READY' ]]; then
    return 0
  fi

  if [[ ${SOUNDTOUCH_PIPEWIRE_ALLOW_DRAFT_BUILD:-0} == 1 ]]; then
    printf 'warning: building a local release candidate (%s)\n' \
      "${_release_state}" >&2
    return 0
  fi

  printf 'error: public build blocked: %s\n' "${_release_state}" >&2
  printf '%s\n' \
    'error: for a local candidate build, set SOUNDTOUCH_PIPEWIRE_ALLOW_DRAFT_BUILD=1' \
    >&2
  return 1
}

_assert_pipewire_abi() {
  local installed_version

  installed_version=$(pkg-config --modversion libpipewire-0.3) || {
    printf 'error: cannot determine the installed libpipewire version\n' >&2
    return 1
  }
  if [[ ${installed_version} != "${_pipewire_ver}" ]]; then
    printf 'error: private PipeWire module source is %s, but installed libpipewire is %s\n' \
      "${_pipewire_ver}" "${installed_version}" >&2
    printf 'error: rebuild and revalidate the private modules for the new PipeWire version\n' >&2
    return 1
  fi
}

prepare() {
  _assert_release_gate

  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0001-pipewire-raop-free-pending-messages.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0002-pipewire-raop-safe-volume.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0003-pipewire-raop-dacp-control.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0004-pipewire-raop-safety-gate.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0005-pipewire-soundtouch-zone-sink.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0006-pipewire-raop-ownership-marker.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0007-pipewire-raop-explicit-demand.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0008-pipewire-raop-publish-marker-after-progress.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0009-pipewire-raop-route-revision.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0010-pipewire-raop-activation-reconnect.patch"
  patch --no-backup-if-mismatch -d "pipewire-${_pipewire_ver}" -Np1 \
    < "${srcdir}/0011-pipewire-raop-contract2-props-normalizer.patch"

  cargo fetch --locked \
    --target "${CARCH}-unknown-linux-gnu" \
    --manifest-path "${srcdir}/${pkgbase}-${pkgver}/control/Cargo.toml"
}

build() {
  _assert_release_gate
  _assert_pipewire_abi
  export CARGO_NET_OFFLINE=true
  export CARGO_PROFILE_RELEASE_DEBUG=2

  arch-meson "${pkgbase}-${pkgver}" build-companion \
    -Dcontrol_app=enabled \
    -Dprivate_module_test_path="${srcdir}/build-pipewire/src/modules/libpipewire-module-raop-sink.so" \
    -Dservice_unit_test_path="${srcdir}/soundtouch-pipewire.service"
  meson compile -C build-companion

  meson setup \
    --prefix=/usr \
    --libdir=lib \
    --libexecdir=lib \
    --sbindir=bin \
    --buildtype=plain \
    --auto-features=disabled \
    --wrap-mode=nodownload \
    -Db_pie=true \
    -Ddocs=disabled \
    -Dman=disabled \
    -Dexamples=disabled \
    -Dtests=enabled \
    -Dinstalled_tests=disabled \
    '-Dsession-managers=[]' \
    -Davahi=enabled \
    -Draop=enabled \
    -Dopus=enabled \
    -Dsystemd-system-service=disabled \
    -Dsystemd-user-service=disabled \
    "pipewire-${_pipewire_ver}" build-pipewire
  meson compile -C build-pipewire \
    pipewire-module-raop-sink \
    pipewire-module-soundtouch-zone-sink \
    pw-test-raop-dacp \
    pw-test-raop-demand \
    pw-test-raop-reconnect \
    pw-test-raop-safety-gate \
    pw-test-raop-source-marker \
    pw-test-raop-volume \
    pw-test-soundtouch-zone-volume
}

check() {
  export CARGO_NET_OFFLINE=true
  local clean_meson_test="${srcdir}/${pkgbase}-${pkgver}/tools/run-meson-tests-clean-env.sh"

  "${clean_meson_test}" build-companion
  "${clean_meson_test}" build-pipewire \
    pw-test-raop-dacp \
    pw-test-raop-demand \
    pw-test-raop-reconnect \
    pw-test-raop-safety-gate \
    pw-test-raop-source-marker \
    pw-test-raop-volume \
    pw-test-soundtouch-zone-volume

  export CARGO_TARGET_DIR="${srcdir}/build-companion/control/cargo-target"
  export SOUNDTOUCH_PIPEWIRE_LOCALEDIR='/usr/share/locale'
  cargo test --frozen \
    --manifest-path "${srcdir}/${pkgbase}-${pkgver}/control/Cargo.toml"
  cargo fmt --all \
    --manifest-path "${srcdir}/${pkgbase}-${pkgver}/control/Cargo.toml" \
    -- --check
  cargo clippy --frozen --all-targets \
    --manifest-path "${srcdir}/${pkgbase}-${pkgver}/control/Cargo.toml" \
    -- -D warnings

  desktop-file-validate \
    build-companion/control/io.github.Mr_Tao.SoundTouchPipeWire.Control.desktop
  appstreamcli validate --no-net \
    build-companion/control/io.github.Mr_Tao.SoundTouchPipeWire.Control.metainfo.xml
}

package_soundtouch-pipewire() {
  pkgdesc='Direct SoundTouch hardware-volume outputs for PipeWire'
  license=('MIT AND LicenseRef-STPW-SoundTouch-Supplement-1')
  install='soundtouch-pipewire.install'
  depends=("${_daemon_depends[@]}")
  optdepends=(
    'soundtouch-pipewire-control: frozen v1 GTK controller (not used by service-v2)'
  )

  _assert_release_gate
  _assert_pipewire_abi

  meson install -C build-companion \
    --destdir "${pkgdir}" \
    --no-rebuild \
    --tags soundtouch-pipewire

  install -Dm755 \
    build-pipewire/src/modules/libpipewire-module-raop-sink.so \
    "${pkgdir}/usr/lib/${pkgbase}/pipewire-0.3/libpipewire-module-soundtouch-raop-sink.so"
  patchelf --remove-rpath \
    "${pkgdir}/usr/lib/${pkgbase}/pipewire-0.3/libpipewire-module-soundtouch-raop-sink.so"

  install -Dm755 \
    build-pipewire/src/modules/libpipewire-module-soundtouch-zone-sink.so \
    "${pkgdir}/usr/lib/${pkgbase}/pipewire-0.3/libpipewire-module-soundtouch-zone-sink.so"
  patchelf --remove-rpath \
    "${pkgdir}/usr/lib/${pkgbase}/pipewire-0.3/libpipewire-module-soundtouch-zone-sink.so"

  install -Dm644 soundtouch-pipewire.service \
    "${pkgdir}/usr/lib/systemd/user/soundtouch-pipewire.service"
  install -Dm644 soundtouch-pipewire.conf.example \
    "${pkgdir}/usr/share/doc/${pkgbase}/soundtouch-pipewire.conf.example"

  install -Dm644 "${pkgbase}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
  install -Dm644 "${pkgbase}-${pkgver}/licenses/EULA.txt" \
    "${pkgdir}/usr/share/licenses/${pkgbase}/EULA.txt"
  install -Dm644 "${pkgbase}-${pkgver}/licenses/PIPEWIRE-MIT.txt" \
    "${pkgdir}/usr/share/licenses/${pkgbase}/PIPEWIRE-MIT.txt"
  install -Dm644 "${pkgbase}-${pkgver}/licenses/THIRD-PARTY-NOTICES.txt" \
    "${pkgdir}/usr/share/licenses/${pkgbase}/THIRD-PARTY-NOTICES.txt"
}

package_soundtouch-pipewire-control() {
  pkgdesc='Frozen v1 GTK controller for SoundTouch receiver and zone operations'
  license=('MIT AND Unicode-3.0 AND LicenseRef-STPW-SoundTouch-Supplement-1')
  depends=(
    "soundtouch-pipewire=${pkgver}-${pkgrel}"
    'glib2'
    'glibc'
    'gtk4'
    'hicolor-icon-theme'
    'libgcc'
  )
  optdepends=(
    'pwvucontrol: native PipeWire mixer'
    'pavucontrol: graphical PulseAudio-compatible mixer'
    'wiremix: terminal PipeWire mixer (requires a supported terminal emulator)'
  )

  _assert_release_gate

  meson install -C build-companion \
    --destdir "${pkgdir}" \
    --no-rebuild \
    --tags soundtouch-pipewire-control,i18n

  install -Dm644 "${pkgbase}-${pkgver}/LICENSE" \
    "${pkgdir}/usr/share/licenses/soundtouch-pipewire-control/LICENSE"
  install -Dm644 "${pkgbase}-${pkgver}/licenses/EULA.txt" \
    "${pkgdir}/usr/share/licenses/soundtouch-pipewire-control/EULA.txt"
  install -Dm644 "${pkgbase}-${pkgver}/licenses/RUST-DEPENDENCIES.html" \
    "${pkgdir}/usr/share/licenses/soundtouch-pipewire-control/RUST-DEPENDENCIES.html"
  install -Dm644 "${pkgbase}-${pkgver}/licenses/THIRD-PARTY-NOTICES.txt" \
    "${pkgdir}/usr/share/licenses/soundtouch-pipewire-control/THIRD-PARTY-NOTICES.txt"
}
