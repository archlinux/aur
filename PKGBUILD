# Maintainer: Olaf Wriggers <olaf@olwig.xyz>

_pkgname=cosmic-ext-applet-gh-notifications
pkgname="${_pkgname}-git"
pkgver=r7.04eee50
pkgrel=1
pkgdesc="A GitHub notifications applet for the COSMIC desktop"
arch=('x86_64')
url="https://github.com/cosmic-utils/cosmic-ext-gh-notifications"
license=('GPL-3.0-only')

depends=(
    'github-cli'
    'libxkbcommon'
)

makedepends=(
  'cargo'
  'just'
  'clang'
)

# upstream repo is named without "-applet", I add it for consistency
# and still provide the original name
_originalname=$(basename "${url}")

provides=(
  "${_pkgname}"
  "${_originalname}"
)
conflicts=(
  "${_pkgname}"
  "${_originalname}"
)

source=(
  "${_pkgname}::git+${url}.git"
  "wrapper.sh"
  "https://brand.github.com/GitHub_Logos.zip"
)

sha256sums=(
  'SKIP'
  'a55a1d603b7f5f728ba0c3cb6458fb28c9d085ae2c03d38b7f838e3096c29089'
  'e2a67d6cc51d990a52c46c1cf6bcab688db4830982174bca50e0be7a5c2f3194'
)

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"

  # fix app.desktop for cosmic applet detection
  desktop_file="resources/app.desktop"
  echo "NoDisplay=true" >> ${desktop_file}
  echo "X-CosmicApplet=true" >> ${desktop_file}
  echo "X-CosmicHoverPopup=Auto" >> ${desktop_file}

  # replace the binary with the wrapper script
  sed -i "s|Exec=git-work|Exec=git-work-with-token|g" resources/app.desktop

  # replace empty svg with github logo
  icon_file="resources/icons/hicolor/scalable/apps/icon.svg"
  cp "${srcdir}/GitHub Logos/SVG/GitHub_Invertocat_White.svg" "${icon_file}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$_pkgname"
  
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  # disable LTO regarding ring problems
  export CFLAGS="${CFLAGS//-flto[=a-zA-Z0-9]*/}"

  just build-release --frozen
}

package() {
  cd "$_pkgname"

  just rootdir="$pkgdir" install

  install -Dm755 "${srcdir}/wrapper.sh" "$pkgdir/usr/bin/git-work-with-token"
}
