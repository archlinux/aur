# Maintainer: backspac

pkgname=gsfonts-emojiless
pkgver=20180524
pkgrel=1
pkgdesc='(URW)++ Core Font Set [Level 2] without characters listed as emoji, in order not to override color fonts'
url='https://github.com/ArtifexSoftware/urw-base35-fonts'
arch=('any')
license=('AGPL3')
makedepends=('git' 'fontforge')
provides=('gsfonts')
conflicts=('gsfonts')
_commit=b758567463df532414c520cf008e27d9448b55a4 # master
_emoji_commit=b9924d171ef2ca818bc601ac5da3e793338dab2a # latest
source=("git+https://github.com/ArtifexSoftware/urw-base35-fonts#commit=${_commit}"
        "https://github.com/iamcal/emoji-data/raw/${_emoji_commit}/emoji.json"
        'cleaner.py')
sha256sums=('SKIP'
            'SKIP'
            '6a22224c8984befe02ef48a8e194059856c0384f136f7890e72d5e3e31fa81c4')

pkgver() {
	cd urw-base35-fonts
	TZ=UTC git show -s --pretty=%cd --date=format-local:%Y%m%d HEAD
}

prepare() {
  otfdir="${srcdir}/urw-base35-fonts/fonts"
  for ttf in "${otfdir}"/*.otf; do
    fontforge -script cleaner.py $ttf
  done
}

package() {
	cd urw-base35-fonts
	install -Dt "${pkgdir}/usr/share/fonts/gsfonts" -m644 fonts/*.otf
	install -Dt "${pkgdir}/usr/share/metainfo" -m644 appstream/*.xml

	install -d "${pkgdir}"/etc/fonts/conf.{avail,d}
	for _f in fontconfig/*.conf; do
		_fn="${pkgdir}/etc/fonts/conf.avail/69-${_f##*/}"
		install -m644 ${_f} "${_fn}"
		ln -srt "${pkgdir}/etc/fonts/conf.d" "${_fn}"
	done
}
