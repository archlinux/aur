# Maintainer: nathawat <nathawat at noreply dot codeberg dot org>
# Contributor: vheeze <vheeze at yandex dot com>

pkgname=hunspell-th
pkgver=20260628
pkgrel=1
pkgdesc='Thai Hunspell dictionary'
arch=('any')
url='https://github.com/SyafiqHadzir/Hunspell-TH'
license=('GPL-3.0-only')
provides=('hunspell-dictionary' 'hunspell-th_TH')
checkdepends=('hunspell')
optdepends=('hunspell: the spell checking libraries and apps')

_commit='a23b0521438f2735dc73efaee61391c6106ae196'
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/${_commit}.tar.gz"
)
b2sums=('4b7d0dc263b06d9110a0fcf657feaf9823158b94cff22e58e3b163bc43edb3fc6a2da3a59f67c47842960dd426fc86a6f2ebfcb06711c20dd304c2852800c376')

check() {
	cd "$srcdir/hunspell-th-$_commit"

	test -s th_TH.aff
	test -s th_TH.dic

	test -z "$(
		DICPATH="$PWD" hunspell -d th_TH -i UTF-8 -l <<<'สวัสดี'
	)"

	test "$(
		DICPATH="$PWD" hunspell -d th_TH -i UTF-8 -l <<<'สวัดดี'
	)" = 'สวัดดี'

	DICPATH="$PWD" hunspell -d th_TH -i UTF-8 <<<'สวัดดี' |
		grep -Fq 'สวัสดี'
}

package() {
	cd "$srcdir/hunspell-th-$_commit"

	install -Dm644 th_TH.aff \
		"$pkgdir/usr/share/hunspell/th_TH.aff"
	install -Dm644 th_TH.dic \
		"$pkgdir/usr/share/hunspell/th_TH.dic"
}
