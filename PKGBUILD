# maintainer: Steve Holmes <steve.holmes88@gmail.com>
# Contributor: Alexander Jenisch <nt@divzero.at>
# Contributor: Chris Brannon <cmbrannon@cox.net>
# Contributor: Andreas Messer <andi@bupfen.de>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=speech-dispatcher-git
pkgver=0.8.r3.g9f40cd2
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="High-level device independent layer for speech synthesis interface (development version)."
license=('GPL2' 'FDL')
depends=('glib2' 'libao' 'python')
optdepends=('festival-freebsoft-utils: Speech output using Festival.'
            'flite: Speech output using Festival Lite.'
            'espeak: Speech output using ESpeak.'
            'svox-pico-git: Speech output using Android pico voice.')
makedepends=('pkgconfig' 'espeak' 'dotconf' 'automake' 'intltool')
provides=("speech-dispatcher")
conflicts=('speech-dispatcher')
options=('!libtool') 
url="http://www.freebsoft.org/speechd"
_gitname="speechd"
source=(${_gitname}::'git://git.freebsoft.org/git/speechd.git'
        'speech-dispatcherd.service'
	"speech-dispatcher-git.install")
#source=("speechd.run" "speechd.sh" "speechd.logrotate")
install="speech-dispatcher-git.install"

backup=('etc/speech-dispatcher/clients/gnome-speech.conf'
	'etc/speech-dispatcher/clients/emacs.conf'
	'etc/speech-dispatcher/modules/ibmtts.conf'
	'etc/speech-dispatcher/modules/espeak-generic.conf'
	'etc/speech-dispatcher/modules/espeak.conf'
	'etc/speech-dispatcher/modules/swift-generic.conf'
	'etc/speech-dispatcher/modules/festival.conf'
	'etc/speech-dispatcher/modules/cicero.conf'
	'etc/speech-dispatcher/modules/espeak-mbrola-generic.conf'
	'etc/speech-dispatcher/modules/dtk-generic.conf'
	'etc/speech-dispatcher/modules/llia_phon-generic.conf'
	'etc/speech-dispatcher/modules/ivona.conf'
	'etc/speech-dispatcher/modules/epos-generic.conf'
	'etc/speech-dispatcher/modules/flite.conf'
	'etc/speech-dispatcher/speechd.conf'
	'etc/logrotate.d/speechd')

#_gitroot="git://git.freebsoft.org/git/speechd"
#_gitname="speechd"

pkgver() {
  cd ${_gitname}
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/[-]/./g'
}

build() {
  cd ${srcdir}/${_gitname}
  autoreconf -i
  PYTHON=python ./configure --prefix=/usr --sysconfdir=/etc --with-alsa --with-libao
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir} install

  # Remove info dir and compress info pages
  rm -f ${pkgdir}/usr/share/info/dir
  #gzip -9nf ${pkgdir}/usr/share/info/*

  # Install startup, profile and logrotate files
  install -Dm644 "${srcdir}"/speech-dispatcherd.service "${pkgdir}/usr/lib/systemd/system/speech-dispatcherd.service"
  #install -D -m644 ${srcdir}/speechd.logrotate ${pkgdir}/etc/logrotate.d/speechd
  install -d "${pkgdir}/var/log/speech-dispatcher"

  # Modify speechd.conf to accomodate running as a system wide service
  #cd "${pkgdir}/etc/speech-dispatcher"
  #sed -i -e 's|LogDir  "default"|#LogDir  "default"|' speechd.conf
  #sed -i -e 's|#LogDir  "/var/log/speech-dispatcher/"|LogDir  "/var/log/speech-dispatcher/"|' speechd.conf
  #sed -i -e 's|# AudioOutputMethod "pulse"|AudioOutputMethod "alsa"|' speechd.conf
  #sed -i -e 's|# DisableAutoSpawn|DisableAutoSpawn|' speechd.conf
}

md5sums=('SKIP'
         'd26f52e2e95a30eaa83560f0e63faca5'
         '25a5d4002bf7949c0966b6a51242f81b')
md5sums=('SKIP'
         'd26f52e2e95a30eaa83560f0e63faca5'
         '34841e928d2c7997d13e808887acb201')
