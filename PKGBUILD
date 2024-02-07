# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)

_pkgname='rtl-433'
_pkgvariantsuffix=''
_vcssuffix='-git'
pkgname="${_pkgname}${_pkgvariantsuffix}${_vcssuffix}"
pkgver=nightly+18.r3433.20240205.06b03b7a
pkgrel=1
pkgdesc="A generic software defined radio data receiver, mainly for the 433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915 MHz ISM bands."
arch=(
  'i686'
  'x86_64'
)
url="https://github.com/merbanan/rtl_433"
license=('GPL-2.0-or-later')
depends=(
  'glibc'
  'libusb'
  'openssl'
  'soapysdr'
  'rtl-sdr'
)
makedepends=(
  'cmake'
  # 'doxygen' # Would only be needed to build source code documentation.
  'git'
)
conflicts=(
  "${_pkgname}"
  'rtl_433'  # The upstream name is with underscore, not hyphen.
  "rtl-443-git=nightly+18.r3433.20240205.06b03b7a" # Initially, this package was uploaded under the wrong name.
)
provides=(
  "${_pkgname}=${pkgver}"
  "rtl_433=${pkgver}"               # The upstream name is with underscore, not hyphen.
  "rtl_433${_vcssuffix}=${pkgver}"  # The upstream name is with underscore, not hyphen.
)
replaces=(
)
backup=(
  'usr/etc/rtl_433/adlm_fprf.conf'
  'usr/etc/rtl_433/atc-technology_lmt-430.conf'
  'usr/etc/rtl_433/CAME-TOP432.conf'
  'usr/etc/rtl_433/car_fob.conf'
  'usr/etc/rtl_433/chungear_bcf-0019x2.conf'
  'usr/etc/rtl_433/ContinentalRemote.conf'
  'usr/etc/rtl_433/dooya_curtain.conf'
  'usr/etc/rtl_433/DrivewayAlarm_I8-W1901.conf'
  'usr/etc/rtl_433/DrivewayAlert.conf'
  'usr/etc/rtl_433/elro_ab440r.conf'
  'usr/etc/rtl_433/energy_count_3000.conf'
  'usr/etc/rtl_433/EV1527-4Button-Universal-Remote.conf'
  'usr/etc/rtl_433/EV1527-DDS-Sgooway.conf'
  'usr/etc/rtl_433/EV1527-PIR-Sgooway.conf'
  'usr/etc/rtl_433/fan-11t.conf'
  'usr/etc/rtl_433/FAN-53T.conf'
  'usr/etc/rtl_433/friedlandevo.conf'
  'usr/etc/rtl_433/ge_smartremote_plus.conf'
  'usr/etc/rtl_433/GhostControls.conf'
  'usr/etc/rtl_433/heatilator.conf'
  'usr/etc/rtl_433/HeatmiserPRT-W.conf'
  'usr/etc/rtl_433/honeywell-fan.conf'
  'usr/etc/rtl_433/LeakDetector.conf'
  'usr/etc/rtl_433/led-light-remote.conf'
  'usr/etc/rtl_433/MightyMule-FM231.conf'
  'usr/etc/rtl_433/MondeoRemote.conf'
  'usr/etc/rtl_433/PHOX.conf'
  'usr/etc/rtl_433/pir-ef4.conf'
  'usr/etc/rtl_433/Reolink-doorbell.conf'
  'usr/etc/rtl_433/rtl_433.example.conf'
  'usr/etc/rtl_433/SalusRT300RF.conf'
  'usr/etc/rtl_433/silverline_doorbell.conf'
  'usr/etc/rtl_433/Skylink_HA-434TL.conf'
  'usr/etc/rtl_433/SMC5326-Remote.conf'
  'usr/etc/rtl_433/sonoff_rm433.conf'
  'usr/etc/rtl_433/steffen_switch.conf'
  'usr/etc/rtl_433/SWETUP-garage-opener.conf'
  'usr/etc/rtl_433/tesla_charge-port-opener.conf'
  'usr/etc/rtl_433/tyreguard400.conf'
  'usr/etc/rtl_433/valeo_car_key.conf'
  'usr/etc/rtl_433/verisure_alarm.conf'
  'usr/etc/rtl_433/xmas-tree-remote-2APJZ-CW002.conf'
)
source=(
  "${_pkgname}::git+${url}.git"     # Official upstream source
  'doxygen-no-warn-as-error.patch'  # Otherwise build fails with `devices/srsmith_pool_srs_2c_tx.c:1: error: explicit link request to 'SRS' could not be resolved (warning treated as error, aborting now)` (as of 2024-02-07).
)
sha256sums=(
  'SKIP'                                                              # Official upstream source
  '225b8927c6a9eab7daffa7fbd8b3e74e916d324b741e97eb3d1797091c452568'  # doxygen-no-warn-as-error.patch
)


prepare() {
  mkdir -p "${srcdir}/build"

  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}/doxygen-no-warn-as-error.patch"; do
    printf '%s\n' "      > Applying patch '${_patch}' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done

  git log > git.log
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed 's|^[vV]||' | sed 's|-g[0-9a-fA-F]*$||' | tr '-' '+')"
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
  cd "${srcdir}"

  # -DBUILD_DOCUMENTATION=ON builds only source code documentation.
  cmake -S "${_pkgname}" -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_BINDIR=/usr/bin \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_SYSCONFDIR=etc \
    -DBUILD_DOCUMENTATION=OFF \
    -DBUILD_TESTING=ON \
    -DBUILD_TESTING_ANALYZER=OFF \
    -DENABLE_IPV6=ON \
    -DENABLE_OPENSSL=ON \
    -DENABLE_RTLSDR=ON \
    -DENABLE_SOAPYSDR=ON \
    -DENABLE_THREADS=ON

  make -C build
}

check() {
  cd "${srcdir}"

  make -C build test
}

package() {
  cd "${srcdir}"

  make -C build DESTDIR="${pkgdir}" install

  ### Only if -DBUILD_DOCUMENTATION=ON.
  # install -Dvm755 "${pkgdir}/usr/share/doc/${_pkgname}/dev"
  # cp -av 'doc/html' "${pkgdir}/usr/share/doc/${_pkgname}/dev"/

  cd "${srcdir}/${_pkgname}"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/${_pkgname}"      'git.log' 'AUTHORS' 'CHANGELOG.md' 'README.md'
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"  'COPYING'
  ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"     "${pkgdir}/usr/share/doc/${_pkgname}/COPYING"
}
