# Maintainer: Amish <contact at via dot aur>
# Maintainer: Morbius <archlinux@seichter.de>
# shellcheck shell=bash disable=2034,2154
pkgname=python-fangfrisch
_name=${pkgname#python-}
pkgver=1.9.3
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
	"${_name}.conf"
	"${_name}.service"
	"${_name}.timer"
	"${_name}.tmpfiles"
	"fangfrisch-has-news.sh")
sha512sums=('cc7ac3a9a3510260f1b1eb759e40934147e1b5f2b28ec566cdf565c8f2fb7a7d7ac0c9a13de8b65d5c02e94893b1043dd4b02872386dd507a77d716b5a5870d2'
            'f269a25224ebc60bb0e63831ebd9aa8707af1bf48aaf680d7381d5c8674623b67cb86e5a9264e26fafacfd34d12dfa931d5cd949e6e9dd272646dbaa408a96ef'
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
