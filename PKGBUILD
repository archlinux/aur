pkgname="lightgbm"
pkgver="4.5.0"
pkgrel="1"
pkgdesc="A fast, distributed, high performance gradient boosting (GBT, GBDT, GBRT, GBM or MART) framework based on decision tree algorithms, used for ranking, classification and many other machine learning tasks."
arch=("aarch64" "x86_64")
url="https://github.com/microsoft/LightGBM"
license=("MIT")
options=("!debug")

optdepends=()
depends=()
makedepends=("cmake")
source=(
	"git+${url}.git#tag=v${pkgver}"
	"git+https://github.com/boostorg/compute.git#tag=boost-1.86.0"
	"git+https://gitlab.com/libeigen/eigen.git#tag=3.4.0"
	"git+https://github.com/lemire/fast_double_parser.git#tag=v0.8.0"
	"git+https://github.com/fmtlib/fmt.git#tag=11.0.2"
)
sha1sums=(
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
	"SKIP"
)

prepare()
{
	cd ${srcdir}/LightGBM/

	cp -r ../compute/ external_libs/
	cp -r ../eigen/ external_libs/
	cp -r ../fast_double_parser/ external_libs/
	cp -r ../fmt/ external_libs/

	cmake -S . -B build
}

build()
{
	cd ${srcdir}/LightGBM/

	cmake --build build -j $(nproc) -- DESTDIR=${srcdir}/LightGBM/build/output install
}

package()
{
	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
	cp ${srcdir}/LightGBM/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/

	cp -r ${srcdir}/LightGBM/build/output/* ${pkgdir}/
}
