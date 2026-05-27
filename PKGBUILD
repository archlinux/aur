# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="81a46c2ea50ef7699a338795352ee8addece19fe"
_solarxr_commit="5d572629c94f895574162225ec69443705ce35af"
_flatbuffers_commit="203241ed3275625c8a25c4a1e7b86e3c0289c488"
_openvr_commit="91825305130f446f82054c1ec3d416321ace0072"
_pkgname="slimevr-server"
pkgbase="${_pkgname}"
pkgname=(
  "slimevr-server"
  "slimevr-gui"
  "slimevr-bindings-provider"
)
pkgver="20.1.0"
pkgrel="1"
pkgdesc="Server for SlimeVR Full Body Tracking System"
arch=("x86_64")
url="https://github.com/SlimeVR/SlimeVR-Server"
license=("MIT" "Apache-2.0")
makedepends=(
  "git"
  "java-runtime-headless-openjdk=17"
  "pnpm"
  "npm"
  "asar"
  "electron"
  "cmake"
  "ninja"
)
depends=()
source=(
  "slimevr-server::git+${url}.git#commit=${_commit}"
  "flatbuffers::git+https://github.com/google/flatbuffers.git#commit=${_flatbuffers_commit}"
  "openvr::git+https://github.com/ValveSoftware/openvr.git#commit=${_openvr_commit}"
  "solarxr-protocol::git+https://github.com/SlimeVR/SolarXR-Protocol.git#commit=${_solarxr_commit}"
  "slimevr-gui-bin"
  "slimevr-server-bin"
  "slimevr-server.service"
  "slimevr.desktop"
  "argv-patch.js"
)
sha512sums=(
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
  "SKIP"
)
options+=(!lto)

prepare() {
  (
    cd "${srcdir}/slimevr-server"
    git config submodule.solarxr-protocol.url "${srcdir}/solarxr-protocol"
    git config submodule.svr-bindings-provider/openvr.url "${srcdir}/openvr"
    git -c protocol.allow=never -c protocol.file.allow=always submodule update --recursive
    git -C solarxr-protocol config submodule.flatbuffers.url "${srcdir}/flatbuffers"
    git -c protocol.allow=never -c protocol.file.allow=always submodule update --recursive
  )
}

build() {
  cd "${srcdir}/slimevr-server"

  (
    pnpm install
    cd gui
    pnpm build
    pnpm package --dir \
      -c.electronDist="/usr/lib/electron" \
      -c.electronVersion="$(cat /usr/lib/electron/version)"
  )

  (
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
    ./gradlew shadowJar
  )

  (
    cd bindings-provider
    cmake . -B build -G Ninja -DCMAKE_BUILD_TYPE=RelWithDebInfo
    cmake --build build
  )
}

package_slimevr-gui() {
  depends+=(
    "electron"
    "nodejs"
  )
  pkgdesc="GUI for SlimeVR Full Body Tracking System"

  install -Dm755 \
    "${srcdir}/slimevr-gui-bin" \
    "${pkgdir}/usr/bin/slimevr"

  install -Dm644 \
    "${srcdir}/slimevr-server/gui/electron/resources/icons/icon.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/slimevr.svg"

  install -Dm644 \
    "${srcdir}/slimevr.desktop" \
    -t "${pkgdir}/usr/share/applications"

  install -Dm644 \
    "${srcdir}/argv-patch.js" \
    -t "${pkgdir}/usr/lib/slimevr"

  install -dm755 "${pkgdir}/usr/lib/slimevr"
  asar extract \
    "${srcdir}/slimevr-server/gui/dist/artifacts/linux/linux-unpacked/resources/app.asar" \
    "${pkgdir}/usr/lib/slimevr"
}

package_slimevr-server() {
  depends+=(
    "java-runtime-headless-openjdk=17"
  )
  pkgdesc="Server for SlimeVR Full Body Tracking System"

  install -Dm755 \
    "${srcdir}/slimevr-server-bin" \
    "${pkgdir}/usr/bin/slimevr-server"

  install -Dm644 \
    "${srcdir}/slimevr-server.service" \
    -t "${pkgdir}/usr/lib/systemd/user"

  install -Dm644 \
    "${srcdir}/slimevr-server/LICENSE-MIT" \
    "${srcdir}/slimevr-server/LICENSE-APACHE" \
    -t "${pkgdir}/usr/share/licenses/${_pkgname}"

  install -Dm644 \
    "${srcdir}/slimevr-server/gui/electron/resources/69-slimevr-devices.rules" \
    -t "${pkgdir}/usr/lib/udev/rules.d"

  install -Dm644 \
    "${srcdir}/slimevr-server/server/desktop/build/libs/slimevr.jar" \
    -t "${pkgdir}/usr/share/slimevr"
}

package_slimevr-bindings-provider() {
  depends+=(
    "gcc-libs"
    "glibc"
    "openvr"
  )
  pkgdesc="Utility application for binding common SlimeVR calibration actions to SteamVR controller actions"

  install -Dm755 \
    "${srcdir}/slimevr-server/bindings-provider/build/slimevr-bindings-provider" \
    -t "${pkgdir}/usr/bin"
}
