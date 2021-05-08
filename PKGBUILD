# Maintainer: David Barri <japgolly@gmail.com>
pkgname=sennheiser-gsp670-pulseaudio-profile
pkgver=1.2
pkgrel=1
pkgdesc="PulseAudio profile for the Sennheiser GSP 670 wireless gaming headset"
arch=('any')
url="https://github.com/szszoke/sennheiser-gsp670-pulseaudio-profile"
license=('MIT')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d69b1f3cb05f70fdc0115930623407a228e8bb9d4ed9fc3cdff69aab502092ae')

package() {
  set -eu

  cd sennheiser-gsp670-pulseaudio-profile-$pkgver

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  rules=91-pulseaudio-sennheiser-gsp670.rules
  rules2=$rules.2
  perl -pe 's/(, *ENV\{PULSE_PROFILE_SET}(=".+?"))/$1, ENV{ACP_PROFILE_SET}$2/' <$rules >$rules2
  install -Dm644 $rules2 "$pkgdir/etc/udev/rules.d/$rules"

  function install_into {
    path="$1"
    mkdir -p "$pkgdir/$path/"{profile-sets,paths}
    install -m644 sennheiser-gsp670-usb-audio.conf   "$pkgdir/$path/profile-sets/"
    install -m644 sennheiser-gsp670-output-main.conf "$pkgdir/$path/paths/"
    install -m644 sennheiser-gsp670-output-comm.conf "$pkgdir/$path/paths/"
    install -m644 sennheiser-gsp670-input-comm.conf  "$pkgdir/$path/paths/"
  }

  install_into /usr/share/alsa-card-profile/mixer
  install_into /usr/share/pulseaudio/alsa-mixer

  # tree $pkgdir
}
