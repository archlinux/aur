# Maintainer: Jan Holthuis <holthuis.jan@googlemail.com>

pkgname=jasper-voice-control-git
pkgver=0.0.0
pkgrel=2
pkgdesc="Jasper is an open source platform for developing always-on, voice-controlled applications."
arch=('any')
url="https://jasperproject.github.io"
license=('MIT')
depends=('python2'
         'python2-apscheduler'
         'python2-argparse'
         'python2-mock'
         'python2-pip'
         'python2-pyaudio'
         'python2-requests'
         'python2-yaml')
makedepends=('git')
optdepends=('jasper-plugins: Jasper standard plugins'
            'jasper-stt-pocketsphinx: Pocketsphinx STT engine for Jasper'
            'jasper-tts-espeak: espeak TTS engine for Jasper'
            'jasper-tts-google: Google TTS engine for Jasper'
            'jasper-tts-festival: Festival TTS engine for Jasper'
            'jasper-tts-pico: Pico TTS engine for Jasper')
conflicts=('jasper-voice-control')
provides=('jasper-voice-control')
source=('git+https://github.com/jasperproject/jasper-client.git'
        'jasper-voice-control.service'
        'profile.yml')
sha256sums=('SKIP'
            'dd0b0170aad21e7ed94bd8e46287473bfaa1939a7361bc21b63637235b019bc6'
            '13616f4a72a618a8e3a9206bd7dfeefcd443af968191193709c25eaf13d6eed8')
install='jasper-voice-control.install'

pkgver() {
  cd "${srcdir}/jasper-client"
  # Use the tag of the last commit
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"

  # Patch broken audio engine
  sed -i "s/'-D', 'hw:1,0', //" jasper-client/client/tts.py

  # create wrappers
  printf '#!/bin/sh\npython2 /usr/share/jasper-voice-control/jasper.py $@\n' > "jasper-voice-control.sh"
  printf '#!/bin/sh\npython2 /usr/share/jasper-voice-control/client/populate.py $@\n' > "jasper-voice-control-populate.sh"
}

build() {
  python2 -O -m compileall "${srcdir}/jasper-client"
}

package() {
  # install shell wrappers
  install -m 755 -d "${pkgdir}/usr/bin/" || return 1
  install -D -m 755 "${srcdir}/jasper-voice-control.sh" "${pkgdir}/usr/bin/jasper-voice-control"
  install -D -m 755 "${srcdir}/jasper-voice-control-populate.sh" "${pkgdir}/usr/bin/jasper-voice-control-populate"

  # install jasper
  install -m755 -d "${pkgdir}/usr/share/" || return 1
  cp -dr --no-preserve=owner "${srcdir}/jasper-client" "${pkgdir}/usr/share/jasper-voice-control" || return 1

  # install readme
  install -m 755 -d "${pkgdir}/usr/share/doc/jasper-voice-control" || return 1
  install -D -m 644 "${srcdir}/jasper-client/README.md" "${srcdir}/jasper-client/CONTRIBUTING.md" "${pkgdir}/usr/share/doc/jasper-voice-control/"

  # install service file
  install -m 755 -d "${pkgdir}/usr/lib/systemd/system" || return 1
  install -D -m 644 "${srcdir}/jasper-voice-control.service" "${pkgdir}/usr/lib/systemd/system/jasper-voice-control.service"

  # create config dir and add default config
  install -m 755 -d "${pkgdir}/var/lib/jasper/.jasper" || return 1
  install -D -m 644 "${srcdir}/profile.yml" "${pkgdir}/var/lib/jasper/.jasper/profile.yml"
}
