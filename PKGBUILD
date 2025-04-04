# Maintainer: Amish <contact at via dot aur>
# Maintainer: Morbius <archlinux@seichter.de>
# shellcheck shell=bash disable=2034,2154
pkgname=python-fangfrisch
_name=${pkgname#python-}
pkgver=1.9.2
pkgrel=1
pkgdesc="Freshclam like utility that allows downloading unofficial virus definition files"
arch=('any')
license=("GPL-3.0-or-later")
url="https://rseichter.github.io/fangfrisch/"
conflicts=('clamav-unofficial-sigs')
provides=('clamav-unofficial-sigs')
depends=('clamav' 'python-requests' 'python-sqlalchemy>=1.4.0')
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rseichter/fangfrisch/archive/${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/58/4d/e39db23273d4c2bc211d4802628c7f73412634022dbf06359271998ce439/fangfrisch-1.9.2.tar.gz"
	"${_name}.conf"
	"${_name}.service"
	"${_name}.timer"
	"${_name}.tmpfiles"
	"fangfrisch-has-news.sh")
sha512sums=('7af21c035a0d904ca619c72c67440fc1fd5c04a3a2b1ab846e98f3045889fab58394261fa0c5cf128d404747a821fcc4863b60c590fe909a89a48fa48296e7d4'
	'7af21c035a0d904ca619c72c67440fc1fd5c04a3a2b1ab846e98f3045889fab58394261fa0c5cf128d404747a821fcc4863b60c590fe909a89a48fa48296e7d4'
	'd36db5093a4a0187a7bbc8e6cbb4f5a029e369fbf3b129da0ebe6b5be5851b2b58df4e6986f303b3c6d37b921740e1d9707eabafa28dac01a028a61a420ce05a'
	'266df243ac0a23efc2797583b9c1e09855aa43b9decabd78bc1ca8a5158c5a71ceee9f77ededc374bd17be094595acd84bea729fc7459cc71337d1029911591f'
	'5f84e0009ae2f72387c1883e3cf35c1d62568863b37326de870d2320fd122a92f38d91ef3bdd9cf959e30571ed51ce1c092da589a19a2da16617ccebca58dd53'
	'9a875fc1ceeb29f5cc798123db845922ddb1b3c77dd03753f9daf39a2c3019d075ac86c82630386476ef828ebc67876842b8d3be22b90aba5b082540bfd024fd'
	'e0c57c8012035388434e1b8882582ace0fcfaf24fa21287760b9ac5fc0b9e022e8272d1d0bab491cce33fc32634cf5ad75b525041511e1029cc5f172cac925f8')
backup=('etc/fangfrisch/fangfrisch.conf')
install=fangfrisch.install

build() {
	cd "$_name-$pkgver" || exit 1
	python -m build --wheel --no-isolation
}

check() {
	local tmp
	pushd >/dev/null "$_name-$pkgver" || exit 1
	tmp="$(pwd -P)/unittest.tmp"
	rm >/dev/null -fr "${tmp}"
	mkdir "${tmp}" || exit 1
	# shellcheck disable=SC2064
	trap "rm -fr ${tmp}" EXIT
	sed -i -e "s,/tmp/fangfrisch/unittest,${tmp},g" tests/*.*
	sqlite3 "${tmp}"/db.sqlite <tests/tests.sql
	PYTHONPATH=.:src python -m unittest discover -v tests/
	popd >/dev/null || exit 1
}

package() {
	cd "$_name-$pkgver" || exit 1
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm0644 "${srcdir}/${_name}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"
	install -Dm0644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/${_name}".{service,timer}
	install -Dm0644 -t "${pkgdir}/etc/fangfrisch" "${srcdir}/${_name}.conf"
	install -Dm0750 -t "${pkgdir}/etc/fangfrisch" "${srcdir}/fangfrisch-has-news.sh"
}
