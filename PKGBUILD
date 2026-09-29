# Maintainer: ElectricSteve <aur at electricsteve dot dev>

pkgname=discipulus
_pkgname=Discipulus
pkgver=0.2.8
pkgrel=1
pkgdesc="Alternative Openbare Magister App voor Android, iOS, iPadOS, WatchOS, WearOS, macOS, Linux en Windows"
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
_archivename="${_pkgname}-${pkgver}" # This matches the name of the top directory in the tar
source=(
  "${_archivename}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)
sha256sums=('6a5d9db0e405e39a6165c5069253b3845e7fe12ad312af9446df71181392157b')
install=discipulus.install

prepare() {
  cd "${srcdir}/${_archivename}"
  flutter --no-version-check config --no-analytics
  flutter --no-version-check config --enable-linux-desktop
  flutter --no-version-check pub get
}

build() {
  cd "${srcdir}/${_archivename}"
  flutter --no-version-check build linux --release
}

package() {
  cd "${srcdir}/${_archivename}/build/linux/x64/release/bundle/"
  
  install -dm755 "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
  
  cp -rdp --no-preserve=ownership . "${pkgdir}/opt/${pkgname}/" # Copy the whole bundle
  ln -s "/opt/${pkgname}/discipulus" "${pkgdir}/usr/bin/discipulus" # Make a symlink in /usr/bin/

  # Copy the desktop file and icon
  install -Dm644 "${srcdir}/${_archivename}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop" 
  install -Dm644 "${srcdir}/${_archivename}/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
}
