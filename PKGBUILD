# vim:ts=2:sw=2:expandtab
# Maintainer: peelz <peelz.dev+arch@gmail.com>

_commit="0236a05f265f3fbeeb1c71083acbb486878da064"
_solarxr_commit="fa2895b19a53d9b1686de8c2a6efe2b3e9ca4fc6"
_pkgname="slimevr-server"
pkgbase="${_pkgname}"
pkgname=(
  "slimevr-server"
  "slimevr-gui"
)
pkgver="18.2.0"
pkgrel="1"
pkgdesc="Server for SlimeVR Full Body Tracking System"
arch=("x86_64")
url="https://github.com/SlimeVR/SlimeVR-Server"
license=("MIT" "Apache-2.0")
makedepends=(
  "git"
  "pnpm"
  "npm"
  "rust"
  "libgit2"
  "gtk3"
  "webkit2gtk-4.1"
  "java-runtime-headless-openjdk=17"
)
depends=()
source=(
  "slimevr-server::git+${url}.git#commit=${_commit}"
  "solarxr-protocol::git+https://github.com/SlimeVR/SolarXR-Protocol.git#commit=${_solarxr_commit}"
  "slimevr-server-bin"
  "slimevr-server.service"
)
sha512sums=(
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
    pnpm run skipbundler --config "$(./gui/scripts/gitversion.mjs)"
  )

  (
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
    ./gradlew shadowJar
  )
}

package_slimevr-gui() {
  depends+=(
    "gtk3"
    "webkit2gtk-4.1"
    "java-runtime-headless-openjdk=17"
  )
  pkgdesc="GUI for SlimeVR Full Body Tracking System"

  install -Dm 755 \
    "${srcdir}/slimevr-server/target/release/slimevr" \
    "${pkgdir}/usr/bin/slimevr"

  install -Dm 644 \
    "${srcdir}/slimevr-server/gui/src-tauri/icons/icon.svg" \
    "${pkgdir}/usr/share/icons/slimevr.svg"

  install -Dm 644 \
    "${srcdir}/slimevr-server/gui/src-tauri/dev.slimevr.SlimeVR.desktop" \
    -t "${pkgdir}/usr/share/applications"

  sed -i '
    s~{{exec}}~/usr/bin/slimevr~g;
    s~{{icon}}~slimevr~g;
  ' "${pkgdir}/usr/share/applications/dev.slimevr.SlimeVR.desktop"
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
    "${srcdir}/slimevr-server/gui/src-tauri/69-slimevr-devices.rules" \
    -t "${pkgdir}/usr/lib/udev/rules.d"

  install -Dm644 \
    "${srcdir}/slimevr-server/server/desktop/build/libs/slimevr.jar" \
    -t "${pkgdir}/usr/share/slimevr"
}
