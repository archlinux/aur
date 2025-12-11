# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ksc
pkgver=1.12
_commit=55708cfe23d814d894730c3d79024f5512611ca7
pkgrel=4
pkgdesc='A tool to check stablelist symbol usage in kernel module source code'
arch=(any)
url="https://github.com/RedHatOfficial/$pkgname"
license=(GPL-2.0-only)
depends=(python)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$_commit"
source=("$url/archive/$_commit/$_archive.tar.gz")
sha256sums=('294700e1dc294777940adef1fdcae2b6bbadf495f42d48400710da8b5da96957')
b2sums=('a5037186f2e2d04cc73504467c52ddff3f7e32dd92617663cfd90da9b2cb6341f44066ed4940f692707564caf210323775824a579b142da7d6bb0146755f0983')

prepare() {
	cd "$_archive"
	sed -i \
		-e "/('\//s#'/#'#" -e '/("\//s#"/#"#' \
		-e '/bugzilla/d' -e '35s/,$/])/' \
		setup.py
	sed -i \
		-e '/from bugzilla/d' -e '/bugzilla_enable/s/True/False/' \
		utils.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" -p / dist/*.whl
	mv "$pkgdir/lib" "$pkgdir/usr"
}
