# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Maintainer: vantu5z <vantu5z@mail.ru>
# Contributor: der_fenix <derfenix@gmail.com>

pkgname=rhvoice-git
pkgver=1.2.4.r66.87e2514
pkgrel=1
pkgdesc="Free and open source speech synthesizer for Russian and other languages. (development version)"
arch=('x86_64')
url="https://github.com/RHVoice/RHVoice"
license=('GPL3' 'custom' 'custom:by-nc-nd-4.0' 'custom:by-sa-4.0')
depends=('libpulse')
makedepends=('git' 'scons' 'speech-dispatcher' 'portaudio' 'libao')
optdepends=('rhvoice-dictionary-git: extended russian dictionary'
            'speech-dispatcher: for speech-dispatcher module support'
            'portaudio: for portaudio backend'
            'libao: for ao backend')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
backup=('etc/RHVoice/RHVoice.conf')
source=(${pkgname%-git}::'git+https://github.com/RHVoice/RHVoice.git'
          'git+https://github.com/RHVoice/victoria-ru.git'
          'git+https://github.com/RHVoice/evgeniy-rus.git'
          'git+https://github.com/RHVoice/evgeniy-eng.git'
          'git+https://github.com/rhvoice/aleksandr-hq-rus.git'
          'git+https://github.com/rhvoice/yuriy-rus.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git config submodule.data/voices/victoria.url "$srcdir/victoria-ru"
	git config submodule.data/voices/evgeniy-rus.url "$srcdir/evgeniy-rus"
	git config submodule.data/voices/evgeniy-eng.url "$srcdir/evgeniy-eng"
	git config submodule.data/voices/aleksandr-hq.url "$srcdir/aleksandr-hq-rus"
	git config submodule.data/voices/yuriy.url "$srcdir/yuriy-rus"
	git config submodule.external/libs/sonic.active false
	git config submodule.src/third-party/cldr.active false
	git config submodule.cmake/thirdparty/sanitizers.active false
	git submodule update
}

build() {
	cd "$srcdir/${pkgname%-git}"
	export SCONSFLAGS="$MAKEFLAGS"
	scons prefix="/usr" sysconfdir="/etc" CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" \
	      LINKFLAGS="$LDFLAGS"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	export SCONSFLAGS="$MAKEFLAGS"
	scons install DESTDIR="${pkgdir}" prefix="/usr" sysconfdir="/etc" \
	      CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" LINKFLAGS="$LDFLAGS"
	install -vDm0644 licenses/gpl-3.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -vDm0644 licenses/by-nc-nd-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-nc-nd-4.0"
	install -vDm0644 licenses/by-sa-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-sa-4.0"
}
