# Maintainer: Medvedinca <TODO: replace with your AUR account e-mail>
#
# VCS package (file dist/PKGBUILD-git): builds from the main branch of the
# Crabber repository. The AUR version is updated by .github/workflows/aur.yml
# (job git-package), which substitutes pkgver with the value computed by pkgver().

_gitname='crabber'
_giturl="https://github.com/auf-gg/${_gitname}"

pkgname=crabber-git
pkgver=0.2.0.r2.g57b7936
pkgrel=1
pkgdesc='XMPP messenger built on GPUI (git version)'
arch=('x86_64')
url="$_giturl"
license=('Apache-2.0')
makedepends=(
  'rust>=1.97'  # pinned in rust-toolchain.toml; gpui-pre needs >=1.93 (std::hint::cold_path)
  'clang'       # bindgen (gpui/blade)
  'pkgconf'
  'vulkan-headers'
)
depends=(
  'libxkbcommon'
  'wayland'
  'libx11'
  'libxcb'
  'fontconfig'
  'freetype2'
  'alsa-lib'           # cpal
  'vulkan-icd-loader'  # gpui/blade
  'dbus'               # ksni, notify-rust
)
provides=('crabber')
conflicts=('crabber' 'crabber-bin')
source=("git+${_giturl}.git")
sha256sums=('SKIP')
options=('!lto')  # LTO is managed by the cargo release profile

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  ) || printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_gitname}"
  cargo build --release --locked
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm755 target/release/crabber "${pkgdir}/usr/bin/crabber"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/crabber.png"
  install -Dm644 icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/crabber.svg"

  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/crabber.desktop"
  cat > "${pkgdir}/usr/share/applications/crabber.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Crabber
Comment=XMPP messenger
Exec=crabber
Icon=crabber
Terminal=false
Categories=Network;InstantMessaging;Chat;
EOF
}
