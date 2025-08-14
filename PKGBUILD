# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=linwood-butterfly-git
pkgbase=linwood-butterfly-git
pkgver=2.4.0_beta.3_144_git2cba4ce410
pkgrel=1
pkgdesc="Development build of Linwood Butterfly, a Flutter-based endless canvas note-taking app"
arch=('x86_64')
url="https://github.com/LinwoodDev/Butterfly"
license=('AGPL-3.0')
provides=('butterfly')
conflicts=('butterfly-bin')
options=('strip')

depends=(
  glibc
  gtk3
  at-spi2-core
  libsecret
)

makedepends=(
  git
  flutter
  nodejs
  svgo
  minify
)

source=('git+https://github.com/LinwoodDev/Butterfly.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Butterfly"
  local version
  version=$(grep '^version:' app/pubspec.yaml | cut -d ' ' -f2)

  # Escape illegal characters for pkgver
  version="${version//-/_}"
  version="${version//+/_}"

  echo "${version}_git$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Butterfly"

  # Optimize SVGs
  svgo . -r --multipass

  # Minify web assets
  find . -type f \( -iname '*.js' -o -iname '*.css' \
    -o -iname '*.html' -o -iname '*.json' -o -iname '*.xml' \) \
    -exec minify -o '{}' '{}' \;

  # Build Flutter release
  cd app
  flutter pub get
  flutter build linux --release
}

package() {
  local _src="$srcdir/Butterfly"
  local _bundle="$_src/app/build/linux/x64/release/bundle"
  local _libdir="/usr/lib/butterfly"
  local _bindir="/usr/bin"

  # Strip debug symbols
  strip "${_bundle}/butterfly"
  strip "${_bundle}/lib/"* || true

  # Create target directories
  install -dm755 "${pkgdir}${_libdir}"
  install -dm755 "${pkgdir}${_bindir}"

  # Copy entire bundle to libdir
  cp -a "${_bundle}/." "${pkgdir}${_libdir}/"

  # Symlink binary into /usr/bin
  ln -s "../lib/butterfly/butterfly" "${pkgdir}${_bindir}/butterfly"

  # Install icon
  install -Dm644 \
    "${_src}/app/build/flutter_assets/images/logo.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/butterfly.svg"

  # Install .desktop file
  install -Dm644 /dev/stdin \
    "${pkgdir}/usr/share/applications/butterfly.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Butterfly
Comment=Endless canvas note-taking app
Exec=butterfly
Icon=butterfly
Categories=Utility;
StartupNotify=true
EOF
}
