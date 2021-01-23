#Maintainer: robertfoster

_pkg=seeed-voicecard
pkgbase="${_pkg}-dkms-git"
pkgname=("${_pkg}-dkms-git" "${_pkg}-4mic-dkms-git" "${_pkg}-8mic-dkms-git")
pkgver=r323.014b0b7
pkgrel=1
pkgdesc="The drivers of Seed Studio ReSpeaker Mic Hat and ReSpeaker Mic Arrays for Raspberry Pi."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/respeaker/seeed-voicecard"
license=('GPL3')
depends=('dkms' 'i2c-tools')
makedepends=('git')
source=('git+https://github.com/M0Rf30/seeed-voicecard.git'
  'dkms.conf'
  "${_pkg}.conf")
_overlays="/boot/overlays/"

pkgver() {
  cd "$srcdir/${_pkg}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_seeed-voicecard-dkms-git() {
  cd "$srcdir/${_pkg}"

  msg2 "Install clean sources"
  mkdir -p "$pkgdir/usr/src/"
  cp -r "../${_pkg}" "$pkgdir/usr/src/${_pkg}-$pkgver"

  msg2 "Install configs"
  mkdir -p "$pkgdir/etc/voicecard" || true
  cp -v ./asound*.conf "$pkgdir/etc/voicecard"
  cp -v ./*.state "$pkgdir/etc/voicecard"

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

  msg2 "Clean up"
  rm -rf "${pkgdir}"/usr/src/${_pkg}-${pkgver}/{.git,*.sh}

}

package_seeed-voicecard-4mic-dkms-git() {
  pkgdesc="DTB Overlay for Seed Studio ReSpeaker 4 Mic Array and 4-Mics Linear Array Kit for Raspberry Pi."
  depends=("${_pkg}-dkms-git")
  install="${_pkg}-4mic.install"

  cd "$srcdir/${_pkg}"

  install -Dt "$pkgdir/${_overlays}" -m644 seeed-4mic-voicecard.dtbo
  install -Dm644 pulseaudio/pulse_config_4mic/seeed-voicecard.conf \
    "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/seeed-voicecard-4mic.conf"
}

package_seeed-voicecard-8mic-dkms-git() {
  pkgdesc="DTB Overlay for Seed Studio ReSpeaker 6-Mics Circular Array Kit for Raspberry Pi."
  depends=("${_pkg}-dkms-git")
  install="${_pkg}-8mic.install"

  cd "$srcdir/${_pkg}"

  install -Dt "$pkgdir/${_overlays}" -m644 seeed-8mic-voicecard.dtbo
  install -Dm644 pulseaudio/pulse_config_6mic/seeed-voicecard.conf \
    "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/seeed-voicecard-8mic.conf"
}

md5sums=('SKIP'
         'af2a2b56702534a1b00cf6484cf56216'
         '6b65fdfe30dff9e0a6e8f4792d058e50')
