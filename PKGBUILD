#Maintainer: robertfoster

pkgbase=seeed-voicecard
pkgname=("${pkgbase}-dkms-git" "${pkgbase}-2mic-dkms-git" "${pkgbase}-4mic-dkms-git" "${pkgbase}-8mic-dkms-git")
pkgver=r4.1.g8cce4e8
pkgrel=1
pkgdesc="DKMS module for Allwinner devices"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://github.com/respeaker/seeed-voicecard"
license=('GPL3')
depends=('dkms' 'i2c-tools')
makedepends=('git')
source=('git+https://github.com/respeaker/seeed-voicecard.git'
  'dkms.conf'
  "${pkgbase}.conf")
_overlays="/boot/overlays/"

pkgver() {
  cd "$srcdir/${pkgbase}"
  printf "r%s.%s" $(git tag | cut -c 2- | tail -1) $(git describe | cut -d "-" -f 3)
}

prepare() {
  cd "$srcdir/${pkgbase}"
  cd ac108_plugin/ && make clean
}

package_seeed-voicecard-dkms-git() {
  cd "$srcdir/${pkgbase}"

  msg2 "Install clean sources"
  mkdir -p "$pkgdir/usr/src/"
  cp -r "../${pkgbase}" "$pkgdir/usr/src/${pkgbase}-$pkgver"

  msg2 "Install configs"
  mkdir -p "$pkgdir/etc/voicecard" || true
  cp -v *.conf "$pkgdir/etc/voicecard"
  cp -v *.state "$pkgdir/etc/voicecard"

  msg2 "Install alsa plugin for ac108"
  cd ac108_plugin || exit
  make
  install -Dm644 libasound_module_pcm_ac108.so \
    "$pkgdir/usr/lib/alsa-lib/libasound_module_pcm_ac108.so"
  cd "$srcdir/${pkgbase}" || exit

  msg2 "Install binaries and systemd resources"
  install -Dm755 "${pkgbase}" "$pkgdir/usr/bin/${pkgbase}"
  install -Dm644 "${pkgbase}.service" \
    "$pkgdir/usr/lib/systemd/system/${pkgbase}.service"
  install -Dt "$pkgdir/usr/src/${pkgbase}-$pkgver" -m644 Makefile "$srcdir/dkms.conf"

  msg2 "Install udev rules"
  install -Dm644 pulseaudio/91-seeedvoicecard.rules \
    "$pkgdir"/usr/lib/udev/rules.d/91-seeedvoicecard.rules
  install -Dm644 "$srcdir/${pkgbase}.conf" \
    "$pkgdir"/usr/lib/modules-load.d/${pkgbase}.conf

  msg2 "Set name and version"
  sed -e "s/@_PKGBASE@/${pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${pkgbase}-${pkgver}/dkms.conf
}

package_seeed-voicecard-2mic-dkms-git() {
  depends=("${pkgbase}-dkms-git")
  install="${pkgbase}-2mic.install"

  cd "$srcdir/${pkgbase}"

  install -Dt "$pkgdir/${_overlays}" -m644 seeed-2mic-voicecard.dtbo
}

package_seeed-voicecard-4mic-dkms-git() {
  depends=("${pkgbase}-dkms-git")
  install="${pkgbase}-4mic.install"

  cd "$srcdir/${pkgbase}"

  install -Dt "$pkgdir/${_overlays}" -m644 seeed-4mic-voicecard.dtbo
  install -Dm644 pulseaudio/pulse_config_4mic/seeed-voicecard.conf \
    "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/seeed-voicecard-4mic.conf"
}

package_seeed-voicecard-8mic-dkms-git() {
  depends=("${pkgbase}-dkms-git")
  install="${pkgbase}-8mic.install"

  cd "$srcdir/${pkgbase}"

  install -Dt "$pkgdir/${_overlays}" -m644 seeed-8mic-voicecard.dtbo
  install -Dm644 pulseaudio/pulse_config_6mic/seeed-voicecard.conf \
    "$pkgdir/usr/share/pulseaudio/alsa-mixer/profile-sets/seeed-voicecard-8mic.conf"
}

md5sums=('SKIP'
  'bf335011fea6259d4119059e5913744e'
  '136d43780e54a3bb15c237ca594c90a7')
