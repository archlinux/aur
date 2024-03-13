# Maintainer: Amish <contact at via dot aur>
pkgname=python-fangfrisch
_name=${pkgname#python-}
pkgver=1.9.0
pkgrel=3
pkgdesc="Freshclam like utility that allows downloading unofficial virus definition files"
arch=('any')
license=('GPL')
url="https://rseichter.github.io/fangfrisch/"
conflicts=('clamav-unofficial-sigs')
provides=('clamav-unofficial-sigs')
depends=('clamav' 'python-requests' 'python-sqlalchemy>=1.4.0')
makedepends=(python-setuptools python-build python-installer python-wheel)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rseichter/fangfrisch/archive/${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/f8/0e/9bc54127d0c3320dd10fc06db498761aaa345457e7b55fa99ce98fb9a091/fangfrisch-1.9.0.dev3.tar.gz"
	"${_name}.conf"
	"${_name}.service"
	"${_name}.timer"
	"${_name}.tmpfiles"
	"fangfrisch-has-news.sh")
sha512sums=('08cc36f20884fedb553de905b8faafce99fcef80e3bce7c0b264691b1a8d83b91a582c095b684f6f7a6af77fd4ed0405fa771a74bbeee3f1b255ff74a161d37e'
            '08cc36f20884fedb553de905b8faafce99fcef80e3bce7c0b264691b1a8d83b91a582c095b684f6f7a6af77fd4ed0405fa771a74bbeee3f1b255ff74a161d37e'
            'd36db5093a4a0187a7bbc8e6cbb4f5a029e369fbf3b129da0ebe6b5be5851b2b58df4e6986f303b3c6d37b921740e1d9707eabafa28dac01a028a61a420ce05a'
            '266df243ac0a23efc2797583b9c1e09855aa43b9decabd78bc1ca8a5158c5a71ceee9f77ededc374bd17be094595acd84bea729fc7459cc71337d1029911591f'
            '5f84e0009ae2f72387c1883e3cf35c1d62568863b37326de870d2320fd122a92f38d91ef3bdd9cf959e30571ed51ce1c092da589a19a2da16617ccebca58dd53'
            '9a875fc1ceeb29f5cc798123db845922ddb1b3c77dd03753f9daf39a2c3019d075ac86c82630386476ef828ebc67876842b8d3be22b90aba5b082540bfd024fd'
            'a38ceae123732602eb1206572052a7f548a8950a608e8c07c1e7ae61123eaabbd33caa8c3b548020a8f57d842ef230b2a90aab81edb2d5db74068ca925a73413')
backup=('etc/fangfrisch/fangfrisch.conf')
install=fangfrisch.install

build() {
	cd "$_name-$pkgver" || exit 1
	cat >>setup.cfg <<EOT
[options.packages.find]
exclude =
    tests
    tests.*
EOT
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
	sed -i -e "s,/tmp/fangfrisch/unittest,${tmp},g" tests/*
	sqlite3 "${tmp}"/db.sqlite <tests/tests.sql
	python -m unittest discover -v tests/
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
