# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>
# Unofficial package of ArvanCloud S3 Client
# ArvanCloud all rights reserved ©

pkgname=arvanclouds3-bin
pkgver=1.2.5_24
_debver=2.0.0
pkgrel=1
pkgdesc="ArvanCloud Object Storage desktop explorer (unofficial package)"
arch=('x86_64')
url="https://www.arvancloud.ir"
# The app is proprietary ("SEE LICENSE IN LICENSE"); Electron is MIT.
license=('LicenseRef-arvancloud' 'MIT')
# Direct ELF dependencies of the main binary, plus fuse3 for mounting buckets.
depends=(
  'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'fuse3' 'glib2' 'glibc'
  'gtk3' 'libcups' 'libgcc' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage'
  'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'mesa' 'nspr' 'nss'
  'pango' 'systemd-libs'
)
optdepends=(
  'libappindicator-gtk3: tray icon'
  'xdg-utils: open links in the default browser'
)
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
# Prebuilt Electron app: nothing to strip, no debug info.
options=('!strip' '!debug')
# The vendor publishes under a fixed "2.0.0" file name and has replaced its
# contents in place (2026-07-26: build 1.2.5-24, new /opt layout). The real
# version is in the .deb's control file; the checksum pins the exact build.
source=("${pkgname}-${pkgver}.deb::https://arvanclouds3app-exe.s3.ir-thr-at1.arvanstorage.ir/ArvanCloudS3App-${_debver}_amd64.deb")
sha256sums=('2a6f3e41400579f0d0f5bb8d4db991dae86be331d7b9a15e10c6cfa17c86f8af')

package() {
  bsdtar -xf "${pkgname}-${pkgver}.deb" data.tar.xz
  bsdtar -xpf data.tar.xz -C "$pkgdir"

  local _app=/opt/ArvanCloudS3 _res=/opt/ArvanCloudS3/resources

  # The vendor's postinst makes its bundled fusermount3 setuid root. Use Arch's
  # fuse3 helper instead (already setuid, maintained). The bundled
  # libfuse3.so.3 stays: Arch's fuse3 is soname .so.4, and an unprivileged
  # library is not the risk a setuid binary is.
  ln -sf /usr/bin/fusermount3 "$pkgdir$_res/bin/linux/x64/fusermount3"
  # AppArmor profile for Debian/Ubuntu; not used on Arch.
  rm -f "$pkgdir$_res/apparmor-profile"

  find "$pkgdir" -type d -exec chmod 755 {} +

  install -dm755 "$pkgdir/usr/bin"
  ln -s "$_app/arvanclouds3" "$pkgdir/usr/bin/arvanclouds3"

  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "$_app/LICENSE.electron.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.electron.txt"
  ln -s "$_res/THIRD_PARTY_NOTICES.md" "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
}
