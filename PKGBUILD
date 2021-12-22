# Maintainer: Alexander Epaneshnikov <alex19ep@archlinux.org>
# Maintainer: vantu5z <vantu5z@mail.ru>
# Contributor: der_fenix <derfenix@gmail.com>

pkgname=rhvoice-git
pkgver=1.6.0.r0.8cc907d7
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
          'git+https://github.com/rhvoice/yuriy-rus.git'
          'git+https://github.com/rhvoice/volodymyr-ukr.git'
          'git+https://github.com/rhvoice/tatiana-rus.git'
          'git+https://github.com/rhvoice/mikhail-rus.git'
          'git+https://github.com/rhvoice/marianna-ukr.git'
          'git+https://github.com/rhvoice/lyubov-eng.git'
          'git+https://github.com/rhvoice/vitaliy-rus.git')
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname%-git}"
	git submodule init
	git config submodule.data/voices/victoria.url "$srcdir/victoria-ru"
	git config submodule.data/voices/evgeniy-rus.url "$srcdir/evgeniy-rus"
	git config submodule.data/voices/evgeniy-eng.url "$srcdir/evgeniy-eng"
	git config submodule.data/voices/aleksandr-hq.url "$srcdir/aleksandr-hq-rus"
	git config submodule.data/voices/yuriy.url "$srcdir/yuriy-rus"
	git config submodule.data/voices/volodymyr.url "$srcdir/volodymyr-ukr"
	git config submodule.data/voices/tatiana.url "$srcdir/tatiana-rus"
	git config submodule.data/voices/mikhail.url "$srcdir/mikhail-rus"
	git config submodule.data/voices/marianna.url "$srcdir/marianna-ukr"
	git config submodule.data/voices/lyubov.url "$srcdir/lyubov-eng"
	git config submodule.data/voices/vitaliy.url "$srcdir/vitaliy-rus"
	git config submodule.external/libs/sonic.active false
	git config submodule.src/third-party/cldr.active false
	git config submodule.cmake/thirdparty/sanitizers.active false
	git submodule update
}

build() {
	cd "${pkgname%-git}"
	jobs=$(expr "$MAKEFLAGS" : '.*\(-j[0-9]*\).*') || true
	scons prefix="/usr" sysconfdir="/etc" CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" \
	      LINKFLAGS="$LDFLAGS" $jobs
}

package() {
	cd "${pkgname%-git}"
	jobs=$(expr "$MAKEFLAGS" : '.*\(-j[0-9]*\).*') || true
	scons install DESTDIR="${pkgdir}" prefix="/usr" sysconfdir="/etc" \
	      CPPFLAGS="$CPPFLAGS" CCFLAGS="$CFLAGS" LINKFLAGS="$LDFLAGS" $jobs
	install -vDm0644 licenses/gpl-3.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -vDm0644 licenses/by-nc-nd-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-nc-nd-4.0"
	install -vDm0644 licenses/by-sa-4.0.txt "${pkgdir}/usr/share/licenses/${pkgname}/by-sa-4.0"
}
