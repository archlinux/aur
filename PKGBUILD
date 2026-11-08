# Maintainer: Dimariqe <dimariqe at gmail dot com>
#
# VCS package (file dist/PKGBUILD-git): builds from the main branch of the
# Cratty repository. The AUR version is updated by .github/workflows/aur.yml
# (job git-package), which substitutes pkgver with the value computed by pkgver().

_gitname='cratty'
_giturl="https://github.com/auf-gg/${_gitname}"

pkgname=cratty-git
pkgver=0.0.0.r8.g2c49678
pkgrel=1
pkgdesc='Native GPU-rendered SSH client with an encrypted host vault (git version)'
arch=('x86_64' 'aarch64')
url="$_giturl"
license=('MIT')
makedepends=(
  'git'
  'cargo'
  'pkgconf'
)
depends=(
  'gcc-libs'
  'glibc'
  'libxkbcommon'
  'libxkbcommon-x11'
  'wayland'
  'libx11'
  'libxcb'
  'fontconfig'
  'freetype2'
  'vulkan-icd-loader'
)
optdepends=(
  'gnome-keyring: passwordless vault unlock via Secret Service'
  'kwallet: passwordless vault unlock via Secret Service'
)
provides=('cratty')
conflicts=('cratty' 'cratty-bin')
source=("git+${_giturl}.git")
sha256sums=('SKIP')
options=('!lto')  # LTO is managed by the cargo release profile

pkgver() {
  cd "${srcdir}/${_gitname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
  ) || printf '0.0.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_gitname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen --bin cratty
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm755 target/release/cratty "${pkgdir}/usr/bin/cratty"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 cratty-brand/icons/cratty-icon-1024.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/cratty.png"
  install -Dm644 cratty-brand/icons/cratty-icon.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cratty.svg"

  install -Dm644 /dev/null "${pkgdir}/usr/share/applications/cratty.desktop"
  cat > "${pkgdir}/usr/share/applications/cratty.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Cratty
Comment=SSH client
Exec=cratty
Icon=cratty
Terminal=false
StartupWMClass=cratty
Categories=Network;RemoteAccess;System;TerminalEmulator;
Keywords=ssh;sftp;terminal;
EOF
}
