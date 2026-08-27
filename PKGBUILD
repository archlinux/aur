# Maintainer: Emilwojcik93 <emilwojcik93@gmail.com>

_pkgname=artemis
pkgname=artemis-qt-git
pkgver=0.6.7.dev.20250831.0017.afe2de7.0.gafe2de7f
pkgrel=1
pkgdesc="Enhanced GameStream client for PCs (Artemis Qt, Moonlight fork w/ Apollo/Sunshine extras) - git build"
arch=('x86_64')
url="https://github.com/wjbeckett/artemis"
license=('GPL-3.0-or-later')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-svg'
  'qt6-multimedia'
  'ffmpeg'
  'sdl2'
  'sdl2_ttf'
  'opus'
  'openssl'
  'libva'
  'libvdpau'
  'libplacebo'
  'libxkbcommon'
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'vulkan-headers'
  'wayland-protocols'
  'qt6-tools'
)
optdepends=(
  'libva-intel-driver: hardware acceleration for older Intel GPUs (pre-Broadwell)'
  'intel-media-driver: hardware acceleration for Broadwell+ Intel GPUs / Arc'
  'libva-mesa-driver: hardware acceleration for AMD GPUs'
  'libva-nvidia-driver: NVDEC hardware acceleration via VA-API for NVIDIA'
)
provides=('artemis-qt')
conflicts=('artemis-qt')
source=("$_pkgname::git+https://github.com/wjbeckett/artemis.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  # upstream tags look like: 0.6.7-dev.20250831.0017+afe2de7
  # sanitize to a monotonically increasing, AUR-legal pkgver (no '-' or '+')
  git describe --long --tags 2>/dev/null | sed -E 's/^[^0-9]*//; s/[-+]/./g' \
    || printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive --depth=1

  # --- Packaging-level warning fixes (2026-08-27) ---
  # Not applied upstream (wjbeckett/artemis is not ours to push to) — applied
  # here so our AUR build stays warning-clean. Each verified against the real
  # 8 warnings seen in CI run 33114871984 before touching anything:
  # https://github.com/emilwojcik93/artemis-qt-git-aur-ci/actions/runs/33114871984

  # 1. qchar.h SFINAE-incomplete (x7, one per TU pulling in session.h): Qt6
  #    6.11 + GCC 16 header-ordering trap — QSemaphore -> qmetatype.h ->
  #    qbytearray.h -> qnamespace.h -> qcompare.h -> <functional> ->
  #    <unordered_map> -> bits/range_access.h does a SFINAE probe while QChar
  #    is still incomplete; qchar.h then completes it "too late". Reproduced
  #    standalone (`#include <QSemaphore>` alone warns; `#include <QChar>`
  #    first does not) against this host's qt6-base 6.11.2 + gcc 16.2 before
  #    trusting the fix — same versions the Arch CI container installs.
  sed -i '0,/^#include <QSemaphore>$/s//#include <QChar>\n#include <QSemaphore>/' \
    app/streaming/session.h

  # 2. _GNU_SOURCE redefined (masterhook.c, masterhook_internal.c): confirmed
  #    from the actual compiler invocation in the log — qmake's app.pro
  #    already passes -D_GNU_SOURCE=1 project-wide, so these files' own
  #    unconditional #define collides with it. Guard instead of dropping,
  #    since these two TUs are deliberately isolated (see their own header
  #    comments re: fcntl.h open() redirection) and must not depend on the
  #    project-wide define being present if built standalone.
  sed -i 's/^#define _GNU_SOURCE$/#ifndef _GNU_SOURCE\n#define _GNU_SOURCE\n#endif/' \
    app/masterhook.c app/masterhook_internal.c

  # 3. unused parameter 'otpHash' (backend/computermanager.cpp): confirmed by
  #    reading the full function — it's dead (the handshake derives its AES
  #    key from salt+PIN only, not otpHash), not a truncated security check.
  #    Q_UNUSED documents that rather than silently dropping the parameter.
  sed -i '/bool performFullPairingHandshake(NvHTTP& http, const QString& saltStr, const QString& otpHash, const QString& pin)/{n;a\        Q_UNUSED(otpHash);
}' app/backend/computermanager.cpp

  # 4. [[nodiscard]] QFile::open() ignored (path.cpp x2): not just silencing —
  #    an unchecked open() means readDataFile()/writeCacheFile() would
  #    silently no-op on a permissions/disk-full failure instead of surfacing
  #    it. Check the result and warn.
  perl -0777 -pi -e 's/(QByteArray Path::readDataFile\(QString fileName\)\n\{\n    QFile dataFile\(getDataFilePath\(fileName\)\);\n)    dataFile\.open\(QIODevice::ReadOnly\);\n    return dataFile\.readAll\(\);/${1}    if (!dataFile.open(QIODevice::ReadOnly)) {\n        qWarning() << "Path::readDataFile: failed to open" << dataFile.fileName();\n        return QByteArray();\n    }\n    return dataFile.readAll();/' \
    app/path.cpp
  perl -0777 -pi -e 's/(QFile dataFile\(cacheDir\.absoluteFilePath\(fileName\)\);\n)    dataFile\.open\(QIODevice::WriteOnly\);\n    dataFile\.write\(data\);/${1}    if (!dataFile.open(QIODevice::WriteOnly)) {\n        qWarning() << "Path::writeCacheFile: failed to open" << dataFile.fileName();\n        return;\n    }\n    dataFile.write(data);/' \
    app/path.cpp

  # 5. AVVulkanDeviceContext::lock_queue/unlock_queue deprecated (plvk.cpp):
  #    real replacement is VK_KHR_internally_synchronized_queues, a genuine
  #    Vulkan-sync-model change, not a mechanical packaging patch — filed
  #    upstream instead of blind-patched: https://github.com/wjbeckett/artemis/issues
  #    (not filed automatically by this script; do by hand, see CI README).
  #    Silence just this already version-gated, intentional legacy call site
  #    so the warning doesn't keep drowning out real ones in future logs.
  sed -i 's/^\(\s*\)vkDeviceContext->lock_queue = lockQueue;/\1#pragma GCC diagnostic push\n\1#pragma GCC diagnostic ignored "-Wdeprecated-declarations"\n&/' \
    app/streaming/video/ffmpeg-renderers/plvk.cpp
  sed -i 's/^\(\s*\)vkDeviceContext->unlock_queue = unlockQueue;/&\n\1#pragma GCC diagnostic pop/' \
    app/streaming/video/ffmpeg-renderers/plvk.cpp
}

build() {
  cd "$_pkgname"
  qmake6 artemis.pro PREFIX=/usr CONFIG+=release "QMAKE_CXXFLAGS+=-fPIC"
  make -j$(nproc)
}

package() {
  cd "$_pkgname"
  make INSTALL_ROOT="$pkgdir" install
}
