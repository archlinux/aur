# Maintainer:  Thomas Baag <t.baag@keh-berlin.de>
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

_gitname="HauppaugeUSB"
_pkgname="hauppauge-usb"
pkgname="${_pkgname}-git"
epoch=1
pkgver=0.6.r42.20230628.eda9313
pkgrel=1
pkgdesc="A wrapper around the Hauppauge HDPVR2/Colossus2 Linux driver"
url="https://github.com/jpoet/HauppaugeUSB"
license=("GPL-3.0-or-later")
arch=('x86_64')
makedepends=('boost' 'git' 'xxd')
depends=('boost-libs' 'gcc-libs' 'glibc' 'libusb')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
backup=('etc/haupauge-usb/sample.conf')
source=(
 'git+https://github.com/jpoet/HauppaugeUSB.git'
 'https://s3.amazonaws.com/hauppauge/linux/hauppauge_hdpvr2_157321_patched_2016-09-26.tar.gz'
)
sha256sums=(
 'SKIP'
 'feba404e549a5dfcabd5fa7311419e4ecf4e0bec90b48ac21977fea9a0e73f5b'
)

prepare() {
  cd "${srcdir}/${_gitname}"
  if [ -e Hauppauge ]; then
    rm Hauppauge
  fi
  ln -s ../hauppauge_hdpvr2_157321_patched_2016-09-26 Hauppauge
  cd Hauppauge
  # Patch the Hauppauge source to get it working
  for patchfilename in \
    01-NewLine.patch \
    02-string.patch \
    03-EnableRegisteredParameters.patch \
    04-SplitLoggingLevels.patch \
    05-FirmwareLocation.patch \
    06-AVOutputCallback.patch \
    07-ThreadName.patch
  do
    patch -Np1 --follow-symlinks -i "${srcdir}/HauppaugeUSB/Patches/${patchfilename}"
  done
  # Rename Common/Rx/ADV7842/Wrapper.c to Wrapper.cpp so it can include c++ headers
  mv Common/Rx/ADV7842/Wrapper.c Common/Rx/ADV7842/Wrapper.cpp

  # Generate git log file to install it to the documentation
  cd "${srcdir}/${_gitname}"
  git log > "${srcdir}/git.log"
}

pkgver() {
  cd "${srcdir}/${_gitname}"

  _ver="$(grep -E 'VERSION[[:space:]]=' hauppauge2.cpp | awk -F= '{print $2}' | tr -d '[[:space:]]";')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_gitname}"

  # Add here stuff which may be needed to fix compilation errors because of warnings treated as error.
  _FIXWERROR=""
  # Silence compiler warnings
  _SILENCEWARNINGS="-Wno-unused-but-set-variable -Wno-unused-variable -Wno-reorder -Wno-unused-function -Wno-comment -Wno-stringop-truncation -Wno-array-bounds -Wno-misleading-indentation -Wno-sign-compare -Wno-unused-value -Wno-switch"
  _CFLAGSADDITIONS=" ${_FIXWERROR} ${_SILENCEWARNINGS}"
  CFLAGS+="${_CFLAGSADDITIONS}"
  CXXFLAGS+="${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS

  make
}

package() {
  cd "${srcdir}/${_gitname}"

  # Needs manual copying of files, since `make install` does not honour `DESTDIR` variable.
  install -Dvm755 -t "${pkgdir}/usr/bin" hauppauge2
  install -Dvm644 -t "${pkgdir}/usr/lib/firmware" Hauppauge/Common/EncoderDev/HAPIHost/bin/{llama_usb_vx_host_slave_t22_24.bin,mips_vx_host_slave.bin}
  install -Dvm644 -t "${pkgdir}/etc/haupauge-usb" etc/sample.conf
  install -dvm755    "${pkgdir}/etc/udev/rules.d"

  printf '%s\n' 'SUBSYSTEMS=="usb",ATTRS{idVendor}=="2040",ATTR{idProduct}=="e585",MODE="0660",GROUP="video",SYMLINK+="colossus2-1",TAG+="systemd",RUN="/bin/sh -c '\''echo -1 > /sys$devpath/power/autosuspend'\''"' > "${pkgdir}/etc/udev/rules.d/99-Hauppauge.rules"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}" README.md "${srcdir}/git.log"
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" COPYING
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
