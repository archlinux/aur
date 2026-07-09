# Maintainer: kekmacska <kekmacska2@proton.me>
pkgname=linwood-butterfly-git
pkgbase=linwood-butterfly-git
pkgver=2.6.0_beta.2_188_gitd7af30e5d7
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
  svgo
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

  printf "${version}_git$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Butterfly"

  # Optimize images
  svgo . -r --multipass
  oxipng -o max -r -p -s -v -t 4 --timeout 150 ./app/{images,lib,linux,templates,test}

  # Build Flutter release
  cd app
  flutter clean
  rm -rf .dart_tool
  flutter pub get
  flutter build linux --release
}

package() {
  local _src="$srcdir/Butterfly"
  local _bundle="$_src/app/build/linux/x64/release/bundle"
  local _libdir="/usr/lib/butterfly"
  local _bindir="/usr/bin"

  # Strip debug symbols
  strip "${_bundle}/butterfly" || true
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

install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/butterfly.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Butterfly
Comment=Endless canvas note-taking app
Exec=butterfly
Icon=butterfly
Categories=Utility;
StartupNotify=true
EOF

chmod 644 "${pkgdir}/usr/share/applications/butterfly.desktop"
}
