#Maintainer: robertfoster

_pkg=seeed-voicecard
pkgbase="${_pkg}-dkms-git"
pkgname=("${_pkg}-dkms-git" "${_pkg}-2mic-dkms-git" "${_pkg}-4mic-dkms-git" "${_pkg}-8mic-dkms-git")
pkgver=r4.1.g8cce4e8
pkgrel=1
pkgdesc="DKMS module for Allwinner devices"
arch=('x86_64' 'armv7h')
url="https://github.com/respeaker/seeed-voicecard"
license=('GPL3')
depends=('dkms' 'i2c-tools')
makedepends=('git')
source=('git+https://github.com/respeaker/seeed-voicecard.git'
  'dkms.conf'
  "${_pkg}.conf")
_overlays="/boot/overlays/"

pkgver() {
  cd "$srcdir/${_pkg}"
  printf "r%s.%s" $(git tag | cut -c 2- | tail -1) $(git describe | cut -d "-" -f 3)
}

prepare() {
  cd "$srcdir/${_pkg}"
  cd ac108_plugin/ && make clean
}

package_seeed-voicecard-dkms-git() {
  cd "$srcdir/${_pkg}"

  msg2 "Install clean sources"
  mkdir -p "$pkgdir/usr/src/"
  cp -r "../${_pkg}" "$pkgdir/usr/src/${_pkg}-$pkgver"

  msg2 "Install configs"
  mkdir -p "$pkgdir/etc/voicecard" || true
  cp -v *.conf "$pkgdir/etc/voicecard"
  cp -v *.state "$pkgdir/etc/voicecard"

  msg2 "Install alsa plugin for ac108"
  cd ac108_plugin || exit
  make
  install -Dm644 libasound_module_pcm_ac108.so \
    "$pkgdir/usr/lib/alsa-lib/libasound_module_pcm_ac108.so"
  cd "$srcdir/${_pkg}" || exit

  msg2 "Install binaries and systemd resources"
  install -Dm755 "${_pkg}" "$pkgdir/usr/bin/${_pkg}"
  install -Dm644 "${_pkg}.service" \
    "$pkgdir/usr/lib/systemd/system/${_pkg}.service"
  install -Dt "$pkgdir/usr/src/${_pkg}-$pkgver" -m644 Makefile "$srcdir/dkms.conf"

  msg2 "Install udev rules"
  install -Dm644 pulseaudio/91-seeedvoicecard.rules \
    "$pkgdir"/usr/lib/udev/rules.d/91-seeedvoicecard.rules
  install -Dm644 "$srcdir/${_pkg}.conf" \
  "$pkgdir"/usr/lib/modules-load.d/${_pkg}.conf

  msg2 "Set name and version"
  sed -e "s/@_PKGBASE@/${_pkg}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkg}-${pkgver}/dkms.conf
}

package_seeed-voicecard-2mic-dkms-git() {
  depends=("${_pkg}-dkms-git")
  install="${_pkg}-2mic.install"

  cd "$srcdir/${_pkg}"

  install -Dt "$pkgdir/${_overlays}" -m644 seeed-2mic-voicecard.dtbo
}

package_seeed-voicecard-4mic-dkms-git() {
  depends=("${_pkg}-dkms-git")
  install="${_pkg}-4mic.install"

  cd "$srcdir/${_pkg}"

  install -Dt "$pkgdir/${_overlays}" -m644 seeed-4mic-voicecard.dtbo
  install -Dm644 pulseaudio/pulse_config_4mic/seeed-voicecard.conf \
    "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/seeed-voicecard-4mic.conf"
}

package_seeed-voicecard-8mic-dkms-git() {
  depends=("${_pkg}-dkms-git")
  install="${_pkg}-8mic.install"
 
  cd "$srcdir/${_pkg}"

  install -Dt "$pkgdir/${_overlays}" -m644 seeed-8mic-voicecard.dtbo
  install -Dm644 pulseaudio/pulse_config_6mic/seeed-voicecard.conf \
    "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/seeed-voicecard-8mic.conf"
}

md5sums=('SKIP'
         'bf335011fea6259d4119059e5913744e'
         '136d43780e54a3bb15c237ca594c90a7')
