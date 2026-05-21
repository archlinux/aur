# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="81a46c2ea50ef7699a338795352ee8addece19fe"
_solarxr_commit="5d572629c94f895574162225ec69443705ce35af"
_pkgname="slimevr-server"
pkgbase="${_pkgname}"
pkgname=(
  "slimevr-server"
  "slimevr-gui"
)
pkgver="20.1.0"
pkgrel="1"
pkgdesc="Server for SlimeVR Full Body Tracking System"
arch=("x86_64")
url="https://github.com/SlimeVR/SlimeVR-Server"
license=("MIT" "Apache-2.0")
makedepends=(
  "git"
  "pnpm"
  "npm"
  "libgit2"
  "asar"
  "electron"
  "java-runtime-headless-openjdk=17"
)
depends=()
source=(
  "slimevr-server::git+${url}.git#commit=${_commit}"
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
)
options+=(!lto)

prepare() {
  cd "${srcdir}/slimevr-server"
  git config submodule.solarxr-protocol.url "${srcdir}/solarxr-protocol"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/slimevr-server"

  (
    # export LIBGIT2_NO_VENDOR=1
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
