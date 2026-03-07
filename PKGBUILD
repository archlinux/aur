# Maintainer: ozzy <ozzy1202 at gmail.com>

pkgname=rizomuv
pkgver=2025.0.92
_build=g46f68ce6
_date=2025-09-14
pkgrel=1
pkgdesc="Professional-grade 3D model UV unwrapping tool."
arch=('x86_64')
url='https://www.rizomuv.com/'
license=('custom')
depends=('glibc' 'libgomp' 'ncurses' 'libdrm' 'gnutls' 'gdbm' 'bash' 'libtirpc' 'util-linux-libs' 'python' 'python-docutils' 'openssl' 'openssl-1.1' 'fontconfig' 'libglvnd' 'libffi' 'gvfs' 'libxcrypt-compat')
options=('!strip') # PNG assets here should be left untouched!

source=("https://www.rizomuv.com/setups/LINUX_SETUP/RizomUV.${pkgver}.${_build}.master.${_date}.AppImage"
        'RizomUV.desktop'
        'rizomuv')
noextract=('RizomUV.${pkgver}.${_build}.master.${_date}.AppImage')
sha256sums=('b3e63171438cd332b7d1ee77f0930469d03d91f102e04849c1615e6212a47925'
            '8284524722421aa5561c76dfa8031fdcffff5e06621a6a0fa619b528d3b10dd0'
            '9ac5dfdafe738519a9bf5b4e45e32e9a50935f11277965cde831e050a4270020')

validpgpkeys=()

prepare() {
  chmod +x RizomUV.${pkgver}.${_build}.master.${_date}.AppImage
  ./RizomUV.${pkgver}.${_build}.master.${_date}.AppImage --appimage-extract
  rm "${srcdir}/squashfs-root/lib64/libGLdispatch.so.0"
  rm "${srcdir}/squashfs-root/lib64/libfontconfig.so.1"
  rm -r "${srcdir}/squashfs-root/usr/lib64/gio"
  cp "${srcdir}/squashfs-root/logo512x512.png" "${srcdir}/squashfs-root/rizomuv_logo512x512.png"
  ln -s /usr/lib/libffi.so "${srcdir}/squashfs-root/lib64/libffi.so.6"
  chmod +x rizomuv
  cp "${srcdir}/rizomuv" "${srcdir}/squashfs-root/"
  mv "${srcdir}/squashfs-root" "${srcdir}/RizomUV"
}

package() {
  mkdir -p "${pkgdir}/opt"
  mkdir -p "${pkgdir}/usr/bin"

  install -Dm644 -t "${pkgdir}/usr/share/applications" "${srcdir}/RizomUV.desktop"
  install -Dm644 -t "${pkgdir}/usr/share/icons" "${srcdir}/RizomUV/rizomuv_logo512x512.png"

  mv "${srcdir}/RizomUV" "${pkgdir}/opt"
  cp "${pkgdir}/opt/RizomUV/rizomuv" "${pkgdir}/usr/bin/rizomuv"
}