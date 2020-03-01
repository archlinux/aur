# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=pulseaudio-bluedio
pkgname=pulseaudio-bluedio
pkgdesc="Fixup Pulseaudio module for my Bluedio headset"
pkgver=13.0
pkgrel=3
arch=(x86_64)
url="https://www.freedesktop.org/wiki/Software/PulseAudio/"
license=(GPL)
makedepends=(libasyncns libcap attr libxtst libsm libsndfile rtkit libsoxr
             speexdsp tdb systemd dbus avahi bluez bluez-libs jack2 sbc
             lirc openssl fftw orc gtk3 webrtc-audio-processing check git meson
             xmltoman)
_commit=200618b32f0964a479d69c9b6e5073e6931c370a  # tags/v13.0^0
source=("git+https://gitlab.freedesktop.org/pulseaudio/pulseaudio.git#commit=$_commit"
        0001-bluetooth-new-module-bluedio-fixup.patch)
sha256sums=('SKIP'
            'bc83a8075decebf7b18efd165593ad0f658dd97881c21804dae3699c1df8bc2f')

pkgver() {
  cd pulseaudio
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd pulseaudio

  # Freeze version before patching
  ./git-version-gen doesnt-exist >.tarball-version

  git apply -3 ../0001-bluetooth-new-module-bluedio-fixup.patch
}

build() {
  arch-meson pulseaudio build \
    -D gcov=false \
    -D pulsedsp-location='/usr/\$LIB/pulseaudio' \
    -D udevrulesdir=/usr/lib/udev/rules.d
  ninja -C build src/modules/module-bluedio-fixup.so
}

package_pulseaudio-bluedio() {
  local pulsever=$(cd pulseaudio; ./git-version-gen .tarball-version)
  while [[ $pulsever = *.*.* ]]; do
    pulsever=${pulsever%.*}
  done
  pulsever=${pulsever%%-*}

  install -s -D -t "${pkgdir}/usr/lib/pulse-${pulsever}/modules" build/src/modules/module-bluedio-fixup.so

}

# vim:set sw=2 et:
