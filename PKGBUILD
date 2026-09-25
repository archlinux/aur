# Maintainer: ElectricSteve <aur at electricsteve dot dev>

pkgname=discipulus-git
_pkgname=discipulus
pkgver=0.2.7.r0.gc7cddeb
pkgrel=1
pkgdesc="GIT - Alternative Openbare Magister App voor Android, iOS, iPadOS, WatchOS, WearOS, macOS, Linux en Windows"
arch=('x86_64')
url="https://github.com/DiscipulusApp/Discipulus"
license=('GPL-3.0-only')
conflicts=('discipulus')
provides=('discipulus')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'glibc'
  'desktop-file-utils'
)
makedepends=(
  'git'
  'flutter'
  'cmake'
  'ninja'
  'clang'
  'pkgconf'
  'xz'
)
options=('!strip' '!debug')
source=(
  "git+${url}"
  "${_pkgname}.desktop"
)
sha256sums=('SKIP'
            '0ed077aabc79c5f452032f2c8c3ce17bb6705111ba2fe8119182d69ddf0b51eb')
install=discipulus.install

pkgver() {
  cd "${srcdir}/Discipulus"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Discipulus"
  flutter --no-version-check config --no-analytics
  flutter --no-version-check config --enable-linux-desktop
  flutter --no-version-check pub get
}

build() {
  cd "${srcdir}/Discipulus"
  flutter --no-version-check build linux --release
}

package() {
  cd "${srcdir}/Discipulus/build/linux/x64/release/bundle/"
  
  install -dm755 "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  
  cp -rdp --no-preserve=ownership . "${pkgdir}/opt/${pkgname}/" # Copy the whole bundle
  ln -s "/opt/${pkgname}/discipulus" "${pkgdir}/usr/bin/discipulus" # Make a symlink in /usr/bin/

  # Copy the desktop file and icon
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop" 
  install -Dm644 "${srcdir}/Discipulus/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg"
}
