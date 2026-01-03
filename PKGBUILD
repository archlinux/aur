# Maintainer: Nithish <nithishgowda0608@gmail.com>
pkgname=youtube-music-desktop-v2-git
_pkgname=ytmdesktop
pkgver=2.0.10.r3.gc64bbf7
pkgrel=1
pkgdesc="YouTube Music Desktop App - V2 (Git Version)"
arch=('x86_64')
options=('!debug')
url="https://github.com/ytmdesktop/ytmdesktop"
license=('GPL3')
depends=('nss' 'libxss' 'alsa-lib' 'libsecret' 'gtk3' 'libnotify')
makedepends=('git' 'nodejs' 'yarn')
provides=("youtube-music-desktop-app")
conflicts=("youtube-music-desktop-app")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  # This generates a proper Arch version string from git tags/commits
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_pkgname}"
  # Use npx to ensure corepack runs even if not in system PATH
  npx corepack enable
  yarn install
}

build() {
  cd "${_pkgname}"
  # Build the linux binaries using 'package' instead of 'make'
  # This avoids needing rpmbuild or dpkg on Arch.
  yarn package
}

package() {
  cd "${_pkgname}"
  
  # Note the exact folder name created by Forge
  local _out="out/YouTube Music Desktop App-linux-x64"
  
  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  # Use quotes around the path to handle spaces
  cp -r "${_out}/"* "${pkgdir}/usr/lib/${pkgname}/"
  
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/youtube-music-desktop-app" "${pkgdir}/usr/bin/${pkgname}"
}
