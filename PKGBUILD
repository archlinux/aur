# Maintainer: Janek Thomaschewski <janek@jbbr.net>

pkgname=signal-desktop-bin
pkgver=1.15.4
pkgrel=2
pkgdesc='Private messaging from your desktop'
arch=('x86_64')
url='https://github.com/signalapp/Signal-Desktop'
license=('GPL3')
provides=('signal-desktop')
conflicts=('signal')
options=('!strip' 'staticlibs')
noextract=("glibc-2.27-3-${CARCH}.pkg.tar.xz")
depends=('gconf' 'gtk3' 'libnotify' 'nss' 'xdg-utils' 'libxss')
makedepends=('patchelf')

sha512sums=('204b07c965704a7dcac6d6bc2e8769f9170217744742ecd73e80cc10d148ebde15ced069709fed60c5ed888d5b68a2213079ae60bc68c8a47300d979ed390945'
            'e2f230f2558f24d13f2fef8987c3d5d8dd440f65131809052b6f243309f8b43be17134ef9a6848dc3631ec1fb37bc5a056efe5dd19a52ea28cc338cd8775c99c'
            '7db7ee79a07fb86fec471e63c5189d61e8a2ca8fc2e659ea89ef22516e24e0a3c9f32c93f8ee520f56abc187b9b9304355e8aadb427c4920cda4f663ab1489fa')
source=("https://updates.signal.org/desktop/apt/pool/main/s/signal-desktop/signal-desktop_${pkgver}_amd64.deb"
        'https://archive.archlinux.org/packages/g/glibc/glibc-2.27-3-x86_64.pkg.tar.xz'
        'signal-desktop')

package() {
  # extract package data
  tar xf data.tar.xz -C "${pkgdir}"

  # fix permissions in 1.9.0+ (Some directories have now 775; changing them back to 755)
  find "${pkgdir}" -type d -not -perm 755 -exec chmod 755 {} \;

  # Patch Signal to use glibc 2.27
  _idir="/opt/Signal"
  _pdir="${pkgdir}/${_idir}"
  _pbin="${_pdir}/signal-desktop"
  mkdir -p "$_pdir/glibc"
  tar -xJf "glibc-2.27-3-x86_64.pkg.tar.xz" -C "$_pdir/glibc"
  rm "$_pdir/glibc/"{.BUILDINFO,.INSTALL,.MTREE,.PKGINFO}
  patchelf --set-interpreter "$_idir/glibc/usr/lib/ld-linux-x86-64.so.2" "$_pbin"
  patchelf --set-rpath "$_idir:$_idir/glibc/usr/lib" "$_pbin"
  patchelf --shrink-rpath "$_pbin"

  # install alias in /usr/bin
  mkdir "${pkgdir}/usr/bin"
  install -D -m755 signal-desktop "${pkgdir}/usr/bin/signal-desktop"
}
