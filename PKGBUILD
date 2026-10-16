# Maintainer: Samuel Bernard <samuel.bernard@gmail.com>

pkgname=novabench
pkgver=6.2.1
pkgrel=1
pkgdesc="Cross-platform benchmark for CPU, GPU, memory, storage, and NPU"
arch=('x86_64' 'aarch64')
url="https://novabench.com/"
license=('LicenseRef-Novabench-EULA')
depends=(
  'cairo'
  'curl'
  'dbus'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libdecor'
  'libgcc'
  'libsoup3'
  'libstdc++'
  'openssl'
  'pango'
  'vulkan-icd-loader'
  'wayland'
  'webkit2gtk-4.1'
  'zlib'
)
optdepends=(
  'vulkan-driver: Vulkan driver for GPU benchmarks'
)
install=novabench.install
# The privileged service authorizes the core executable by SHA-256.
# Keep upstream binaries byte-for-byte intact.
options=('!strip')
source=(
  "Novabench-EULA.html::https://novabench.com/legal/eula"
)
source_x86_64=(
  "novabench-${pkgver}-x86_64.deb::https://cdn.novabench.net/novabench-x64.deb"
)
source_aarch64=(
  "novabench-${pkgver}-aarch64.deb::https://cdn.novabench.net/novabench-arm64.deb"
)

sha256sums=(
  'SKIP'
)
sha256sums_x86_64=(
  '90239399f07355eee78e5a7990347e62e145b1d4bc605db09556b531c809ce8c'
)
sha256sums_aarch64=(
  '9e807052b7632cfc8a1795d046b3f5b1e5b387d0c74b8d9edafdc6d1878f57ff'
)

package() {
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  install -Dm644 \
    "${srcdir}/Novabench-EULA.html" \
    "${pkgdir}/usr/share/licenses/${pkgname}/EULA.html"

  # The privileged sensor service uses an authorization manifest containing
  # the Novabench core executable path and SHA-256 hash. Generate it from the
  # exact executable included in this package.
  local _exec="/usr/lib/Novabench/resources/novabench"
  local _exec_hash
  _exec_hash="$(sha256sum "${pkgdir}${_exec}" | cut -d ' ' -f1)"

  printf 'version 1\ncore-executable %s sha256:%s\n' "$_exec" "$_exec_hash" \
    > "${pkgdir}/usr/lib/novabench/novabench-service.manifest"

  chmod 0644 "${pkgdir}/usr/lib/novabench/novabench-service.manifest"
}
