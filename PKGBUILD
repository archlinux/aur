# Maintainer: Leonardo Santana Vieira <leosanvieira at gmail dot com>
# Contributor: https://gist.github.com/progandy/ce857358c4f3b8eb09887a085e4bea30

_lang=pt-BR
_langname='Portuguese (Brazil)'
_tbmin=60.0
_tbmax=70.0

pkgname="thunderbird-cal-i18n-pt-br-hg"
pkgdesc="Portuguese (Brazil) language files for Thunderbird Calendar"
pkgver=20180927171435+60.0+70.0
pkgrel=1
url="https://hg.mozilla.org/l10n-central/"
license=("MPL" "GPL")
depends=("thunderbird" "thunderbird-i18n-pt-br" "mercurial")
source=("manifest.json" "thunderbird-cal-$_lang::hg+https://hg.mozilla.org/l10n-central/$_lang")
sha256sums=('3b371e65e7ae66acda298590c214c1429266f129457164657e263cbed4af1121'
            'SKIP')
arch=(x86_64)

pkgver() {
  cd "thunderbird-cal-$_lang"
	printf "%s+%s+%s" $(date -u -d "$(hg log -l1 -T "{date|isodatesec}")" +"%Y%m%d%H%M%S") $_tbmin $_tbmax
}

build() {
	_src="thunderbird-cal-$_lang"
	langpath="chrome/$_lang/locale/$_lang"
	mkdir -p build/"$langpath"
	sed -e "s/VERSION/${pkgver}/g" \
  	-e "s/MINVER/$_tbmin/g" \
  	-e "s/MAXVER/$_tbmax/g"  \
  	-e "s/LANGUAGE/$_langname/g" \
  	-e "s/LANG/$_lang/g" \
  	-e "s\$PACKAGER\$$PACKAGER\$g" \
	  manifest.json > build/manifest.json
	mkdir -p build/defaults/preferences
	sed -n "/@AB_CD@/d;/^pref/p" $_src/calendar/lightning-l10n.js >build/defaults/preferences/lightning-l10n.js
	cp -a $_src/calendar/chrome/* build/"$langpath"
	cd build
	mv "$langpath"/calendar/providers/gdata "$langpath"/gdata
	mv "$langpath"/calendar/providers/wcap/* "$langpath"/calendar/
	rm -r "$langpath"/calendar/providers
	bsdtar --format zip -c -f ../langpack-cal-$_lang\@archlinux.org.community.xpi.xpi *

}

package() {
	install -Dm644 -t $pkgdir/usr/lib/thunderbird/extensions/ langpack-cal-$_lang\@archlinux.org.community.xpi.xpi 
}

