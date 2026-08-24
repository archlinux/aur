# Maintainer: Hugo González <ing.hugogh@gmail.com>

pkgname=leviathan-bin
_appname=leviathan
pkgver=0.7.0
pkgrel=1
pkgdesc="Fast, privacy-first Git GUI client built with Tauri, Lit and Rust"
arch=('x86_64')
url="https://github.com/hegsie/Leviathan"
license=('MIT')

# webkit2gtk-4.1 already pulls in gtk3, cairo, glib2, gdk-pixbuf2, libsoup3,
# zlib, gcc-libs, glibc and dbus, which the binary links directly; not repeated.
depends=(
  'webkit2gtk-4.1'
  'git'                # bisect, worktree, LFS, submodules, sparse-checkout,
                       # shallow clone, push --force-with-lease and GPG signing
                       # are delegated to system git; libgit2 only covers the basics
  'ca-certificates'    # the binary embeds no CA bundle: it probes /etc/ssl/certs
  'hicolor-icon-theme' # base index.theme for the icons shipped here
)

optdepends=(
  'openssh: clone and authenticate over SSH, and manage keys from the app'
  'gnupg: sign and verify commits and tags'
  'xdg-utils: open files, folders and links with the default applications'
  'which: detect the configured external diff and merge tools'
  'libayatana-appindicator: system tray icon'
  'xdg-desktop-portal-gtk: follow the desktop light/dark theme'
  'pciutils: GPU detection to recommend a local AI model'
  'nvidia-utils: VRAM detection (nvidia-smi) for local AI on NVIDIA GPUs'
)

provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")

# Ship the binary exactly as upstream publishes it, unstripped.
options=('!strip' '!debug')

_deb="Leviathan_${pkgver}_amd64.deb"
source=("https://github.com/hegsie/Leviathan/releases/download/v${pkgver}/${_deb}"
        "LICENSE-${pkgver}::https://raw.githubusercontent.com/hegsie/Leviathan/v${pkgver}/LICENSE")
noextract=("${_deb}")
sha256sums=('2275dda674131c68f3a1b5656507ceea64ad3e6229c3a2ffee912664be230729'
            'a363ba4cc1a17c9a5c3a6206d866769447f6dd9ea996910e400262b981fb2163')

package() {
  bsdtar -xf "${srcdir}/${_deb}" -C "${srcdir}"
  bsdtar -xf "${srcdir}"/data.tar.* -C "${pkgdir}"

  install -Dm644 "${srcdir}/LICENSE-${pkgver}" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# The binary statically links OpenSSL 3.5.5, libgit2 1.9.4, libssh2 1.11.1,
# SQLite 3.53.2 and llama.cpp: those copies do not receive Arch security
# updates and only change when upstream ships a new release.
