# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Tomas Ostasevicius (aquarix) <t dot ostasevicius at gmail dot com>

_pkgname=gitter
pkgname=gitter-bin
pkgver=5.0.1
pkgrel=2
pkgdesc='Where developers come to talk'
url='https://gitlab.com/gitlab-org/gitter/desktop/'
license=('MIT')
arch=('x86_64' 'i686')
provides=('gitter')
conflicts=('gitter')
depends=('libsystemd' 'desktop-file-utils' 'gtk2' 'alsa-lib' 'nss'
'libnotify' 'libxtst')
makedepends=('tar' 'binutils')
source_x86_64=("https://update.gitter.im/linux64/${_pkgname}_${pkgver}_amd64.deb"
        gitter_x86_64.sh)
source_i686=("https://update.gitter.im/linux32/${_pkgname}_${pkgver}_i386.deb"
        gitter_i686.sh)
noextract=("${_pkgname}_${pkgver}_amd64.deb" "${_pkgname}_${pkgver}_i386.deb")
install='gitter.install'
sha256sums_x86_64=('01be9f6df9bdac1c98f1391495795910d47c2b8815650112a131674cfd5449df'
                   'f791f6685771517b2e7ab03513fc49f625cb9feab4949b607b444e303f31fab5')
sha256sums_i686=('9a89739cf256fe2a2f4821feab6aebdf80b99f53c27211ccccf3210827c3318c'
                 'c29fbff9e3ad766c49407cb29aa5ba7131f4de9f48c71928ffcf8b3bcd2a2cde')
options=(!strip)

prepare() {
  cd "$srcdir"
  if [ "$CARCH" == "x86_64" ]; then
    ar x "${_pkgname}_${pkgver}_amd64.deb"
  else
    ar x "${_pkgname}_${pkgver}_i386.deb"
  fi
}

package() {
  cd "$srcdir"
  tar -C "$pkgdir" -xf data.tar.gz
  mkdir -p "$pkgdir/opt/Gitter/lib"
  ln -sf /usr/lib/libudev.so.1 "$pkgdir/opt/Gitter/lib/libudev.so.0"
  if [ "$CARCH" == "x86_64" ]; then
	  install -Dm755 "$srcdir/${_pkgname}_x86_64.sh" "$pkgdir/usr/bin/$_pkgname"
	  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "$pkgdir/opt/Gitter/linux64/gitter.desktop"
	  sed -e 's#/opt/Gitter/linux64/Gitter#/usr/bin/gitter#' -i "$pkgdir/usr/share/applications/gitter.desktop"
  else
	  install -Dm755 "$srcdir/${_pkgname}_i686.sh" "$pkgdir/usr/bin/$_pkgname"
	  RPM_BUILD_ROOT="$pkgdir" desktop-file-install "$pkgdir/opt/Gitter/linux32/gitter.desktop"
	  sed -e 's#/opt/Gitter/linux32/Gitter#/usr/bin/gitter#' -i "$pkgdir/usr/share/applications/gitter.desktop"
  fi
}
