# Maintainer: Rafael Reggiani Manzo <rr.manzo#protonmail.com>

pkgname=mycroft-core
# _pkgcommit=eb0a37c # Used only when the latest tag is not working
# pkgver=0.7.20.${_pkgcommit}
pkgver=0.8.5
pkgrel=1
pkgdesc="Mycroft Core, the Mycroft Artificial Intelligence platform. Contribute to this package at: https://gitlab.com/rafamanzo/aur-mycroft-core"
arch=('i686' 'x86_64')
url='https://github.com/MycroftAI/mycroft-core'
license=('GPLv3')
depends=('git'
         'python2'
         'python2-virtualenv'
         'python2-setuptools'
         'python2-gobject2'
         'python-virtualenvwrapper'
         'libtool'
         'libffi'
         'openssh'
         'autoconf'
         'bison'
         'swig'
         'glib2'
         's3cmd'
         'portaudio'
         'mpg123'
         'flac'
         'curl'
         'mimic'
         'alsa-utils')
makedepends=('sudo')
optdepends=()
conflicts=()
install=mycroft-core.install
# changelog=ChangeLog
source=("https://codeload.github.com/MycroftAI/mycroft-core/tar.gz/release/v${pkgver}"
#source=("git://github.com/MycroftAI/mycroft-core.git#commit=${_pkgcommit}" # Used only when the latest tag is not working
        "mycroft.target"
        "mycroft-service.service"
        "mycroft-skills.service"
        "mycroft-voice.service")
sha512sums=(76d807feecfd48620a66781fb5d1409e84e2f3e2076b224c111f6d17205ac4ff7a4adef08218b4ef364b5894bd42ae3453c2268a62ed423d1059bbbf78e8b235
# sha512sums=(SKIP  # Git already ensures data consistency # Used only when the latest tag is not working
            a5989c9ff2b0f7338b4a6f9342c980413d71da375355abb416dce3a79e298fea7872e39b6a1505437aab860ed66755a6f344821f4f7cb31aed46792b2cef3f96
            74e9451dc38560e6efd4baf8c77cb81bdf9c0b821c1935eb2dac060614c0f14458101151583c3f444da59d9f065a744a7ad6f8daaeceec8f4e37f67d33199b6b
            cb8a5c2245ecd52e66acedebf7ce6ce8db32a84b3495d34cc3749e03aa7d12c958b5f71fa01aa79b36906401e655dd6442e979d60d53d64160d9f956551a92df
            7266494bf416a6f969bcbe9e854753e2a7e498ff9b43d6ca0ba37d94736bca9bf35f5825f24e19138428728189814222f2592fdea4c7e1d0d0ad18e7d3606a0b)

# Valid only when using a tarball
prepare(){
  tar xzfv v${pkgver}
}

# build() {}

package() {
  mkdir -p ${pkgdir}/usr/share/
  # cp -R mycroft-core ${pkgdir}/usr/share/ # Used only when the latest tag is not working
  cp -R mycroft-core-release-v${pkgver} ${pkgdir}/usr/share/mycroft-core

  # Place a link to mimic where mycroft is expecting it
  mkdir -p ${pkgdir}/usr/share/mycroft-core/mimic/bin
  ln -s /usr/bin/mimic ${pkgdir}/usr/share/mycroft-core/mimic/bin/mimic

  # Set permissions
  chmod g+w ${pkgdir}/usr/share/mycroft-core

  # Symtemd units
  install -D -m644 "${srcdir}/mycroft.target" "${pkgdir}/usr/lib/systemd/user/mycroft.target"
  install -D -m644 "${srcdir}/mycroft-service.service" "${pkgdir}/usr/lib/systemd/user/mycroft-service.service"
  install -D -m644 "${srcdir}/mycroft-skills.service" "${pkgdir}/usr/lib/systemd/user/mycroft-skills.service"
  install -D -m644 "${srcdir}/mycroft-voice.service" "${pkgdir}/usr/lib/systemd/user/mycroft-voice.service"
}
