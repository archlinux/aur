# Maintainer: Devesh Kumar <vrshu112@gmail.com>
#
# srelens-bin — repackages the upstream .deb for Arch.
#
# Why a -bin package rather than an AppImage: an AppImage vendors its own copies
# of platform libraries (GTK, and — via linuxdeploy — libwayland-*), which then
# get loaded ahead of the system's. On a rolling distro with a much newer Mesa,
# the host's EGL resolves against those stale bundled Wayland libs, eglGetDisplay()
# fails, and the app opens a blank window with no error (#111; affected releases
# up to 0.2.1 — later AppImages exclude those libs). Linking against the system's
# own webkit2gtk/gtk3/wayland/mesa makes that whole class of failure impossible,
# which is exactly what this package does.
#
# CI renders pkgver and the checksums on each stable release; see packaging/aur/README.md.

pkgname=srelens-bin
_pkgname=srelens
pkgver=0.5.0
pkgrel=1
pkgdesc="Kubernetes IDE — an MCP-native desktop workspace for operating clusters"
arch=('x86_64')
url="https://github.com/srelens/srelens"
license=('MIT')

# Verified against the shipped binary's DT_NEEDED, not guessed:
#   libwebkit2gtk-4.1.so.0, libjavascriptcoregtk-4.1.so.0, libsoup-3.0.so.0  -> webkit2gtk-4.1
#   libgtk-3.so.0 (+ cairo, gdk-pixbuf, glib, gobject, gio, dbus)            -> gtk3
# Note the binary does NOT link libwayland directly — it comes in transitively
# via GTK/Mesa, which is precisely why bundling it (as the AppImage does) is both
# unnecessary and harmful.
depends=('webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')

# srelens deliberately does not bundle a toolchain — it drives the kubectl/helm
# already installed on your machine (including kubeconfig exec-auth plugins), so
# these are genuinely optional rather than hard requirements.
optdepends=(
  'kubectl: cluster access and kubeconfig exec-auth plugins (e.g. kubectl-oidc_login)'
  'helm: Helm release management (install/upgrade/rollback/uninstall)'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

# The upstream binary is already built for release; don't let makepkg re-process it.
options=('!strip' '!debug' '!lto')

source=(
  "$_pkgname-$pkgver.deb::$url/releases/download/$_pkgname-v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
  "LICENSE-$pkgver::https://raw.githubusercontent.com/srelens/srelens/$_pkgname-v$pkgver/LICENSE"
)
# Replaced with real hashes by `updpkgsums` in CI on every release.
sha256sums=('94e5e79de3e99cff6490a61ebb77b2802e7a489eec10b04a191b79c6650671b8'
            'be310626d05ec2f34b6ad0e0b533134d0ece9eba938d7af30e82480102481cf4')

package() {
  # The .deb payload is exactly usr/bin/srelens + a .desktop entry + hicolor icons.
  bsdtar -O -xf "$_pkgname-$pkgver.deb" data.tar.gz | bsdtar -xf - -C "$pkgdir"

  # Upstream's generated .desktop ships an empty `Categories=`, which can hide the
  # app from desktop menus. Give it one until that's fixed upstream.
  sed -i 's/^Categories=$/Categories=Development;/' \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
