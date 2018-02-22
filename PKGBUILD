# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
# Source: https://github.com/nicoulaj/archlinux-packages
pkgname=hda-jack-retask-bzr
_pkgname=hda-jack-retask
pkgver=10
pkgrel=2
pkgdesc="Retask your jack plugs (eg. turn your microphone jack plug into a headphone one) - DEPRECATED: use community/alsa-tools instead"
arch=(i686 x86_64)
url="https://code.launchpad.net/~diwic/+junk/hda-jack-retask"
license=(GPL2)
depends=(gtk3 desktop-file-utils)
makedepends=(bzr gcc)
install=${pkgname}.install

_bzrtrunk="https://code.launchpad.net/~diwic/+junk/hda-jack-retask"
_bzrmod="hda-jack-retask"

build() {
  msg1 "This package is deprecated. Use community/alsa-tools instead."
  exit 1

  cd "${srcdir}"
  
  msg2 "Connecting to Bazaar server and checking out..."
  if [ -d ${_bzrmod} ] ; then
  	cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -q -r ${pkgver}
  	msg2 "Local files are up to date."
  else
  	bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi
  msg2 "Bazaar checkout done or server timeout."

  msg2 "Building..."
  cd "${srcdir}/${_bzrmod}"
  make || return 1

  msg2 "Generate desktop application entry..."
  cat > "${srcdir}"/${_pkgname}.desktop << EOF
[Desktop Entry]
Name=HDA jack retask
Comment=${pkgdesc}
Exec=/usr/bin/hda-jack-retask
Terminal=false
Icon=applications-system
Type=Application
Categories=Settings;HardwareSettings;
EOF
}

package() {
  msg2 "Installing..."
  cd "${srcdir}/${_bzrmod}"
  make install DESTDIR="${pkgdir}"

  msg2 "Install desktop application entry in /usr/share/applications..."
  install -Dm644 "${srcdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications/${_pkgname}.desktop
}