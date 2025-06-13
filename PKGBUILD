# Maintainer: Archisman Panigrahi <apandada1ATgmail.com>

_packagename=readest
_Packagename=Readest
pkgname=$_packagename-git
pkgver=0.9.35
pkgrel=1
pkgdesc="Modern, feature-rich ebook reader designed for avid readers offering seamless cross-platform access, powerful tools, and an intuitive interface"
arch=('x86_64' 'aarch64' 'i686')
url='https://github.com/readest/readest'
license=('AGPL-3.0-or-later')
depends=(
  'cairo'
  'desktop-file-utils'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libsoup3'
  'openssl'
  'pango'
  'webkit2gtk-4.1'
  'gst-plugins-good'
)
makedepends=('git' 'openssl' 'librsvg' 'pnpm' 'npm' 'nodejs' 'rust')
provides=('readest')
conflicts=('readest' 'readest-bin')
source=("git+${url}.git")
sha256sums=('SKIP')
options=(!lto)  # Disable Link Time Optimization. Otherwise build fails with some 'cc' linking error.

pkgver() {
  cd $_packagename
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  cd $_packagename
  git submodule update --init --recursive
  pnpm install
  pnpm --filter @readest/readest-app setup-pdfjs
  # Disable updater artifacts in tauri.conf.json 
  # Otherwise it will try to sign the built package with developer's GPG key which is unnecessary, 
  # and then it causes build failure because the GPG key is not available in the build environment.
  # Also the updater artifacts are not needed for the AUR package.
  # For more details, see https://github.com/tauri-apps/tauri/issues/13259
  sed -i 's/"createUpdaterArtifacts": true/"createUpdaterArtifacts": false/' \
    apps/$_packagename-app/src-tauri/tauri.conf.json
}

build() {
  cd $_packagename
  pnpm tauri build -b deb
}

package() {
  cp -a $_packagename/target/release/bundle/deb/$_Packagename_*/data/* "${pkgdir}"
}
