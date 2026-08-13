# Maintainer: Fahim Montasir Misbah <fahimscirex@tutanota.com>
pkgname=bullet-bin
_pkgname=bullet
pkgver=1.3.26
pkgrel=1
pkgdesc="The fastest coding agent — desktop app and terminal edition"
arch=('x86_64')
url="https://github.com/trybullet/bullet-releases"
license=('custom')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'expat'
  'gcc-libs'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libnotify'
  'libsecret'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxrandr'
  'libxss'
  'libxtst'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'util-linux-libs'
  'xdg-utils'
)
optdepends=(
  'libappindicator-gtk3: StatusNotifierItem support'
)
options=('!strip')
source=("https://github.com/trybullet/bullet-releases/releases/download/v${pkgver}/bullet_${pkgver}_amd64.deb")
sha256sums=('5d0d1f524e6ce1dbaa6030c781bc0ec3170be0758ea20b89b65f67947dd4a454')
noextract=("bullet_${pkgver}_amd64.deb")

package() {
  # Extract data archive from the .deb (an ar archive) into pkgdir
  bsdtar -xf "${srcdir}/bullet_${pkgver}_amd64.deb" -C "${srcdir}" data.tar.xz
  bsdtar -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

  # Create symlink to binary in /usr/bin
  install -d "${pkgdir}/usr/bin"
  ln -s /opt/Bullet/bullet "${pkgdir}/usr/bin/bullet"

  # Ensure correct permissions for chrome-sandbox
  if [[ -f "${pkgdir}/opt/Bullet/chrome-sandbox" ]]; then
    chmod 4755 "${pkgdir}/opt/Bullet/chrome-sandbox"
  fi

  # Install license
  install -Dm644 "${pkgdir}/opt/Bullet/LICENSE.electron.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
}
