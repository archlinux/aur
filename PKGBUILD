pkgname="lightgbm"
pkgver="4.6.0"
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
	"git+https://github.com/boostorg/compute.git#tag=boost-1.87.0"
	"git+https://gitlab.com/libeigen/eigen.git#tag=3.4.0"
	"git+https://github.com/lemire/fast_double_parser.git#tag=v0.8.0"
	"git+https://github.com/fmtlib/fmt.git#tag=11.1.3"
)
sha256sums=(
	"1e2c2e8ebe9acb8b730e7ca56efddee3ee6bf11d2674efccf4bb27673e1529c0"
	"3ad2e2cc208485aca79ae6b55ac7e654c5275633051e9f55f8528fb5ebe66fe7"
	"a378af54cb5befc28cdfe409c26ec65cc3d81ac6f160a4797a2fa846f338d217"
	"22b508276e8eb76bd663bb52ad567ba24e75f42862ccc953eba1040e90ad25f2"
	"04b26d65375cdfc64cf3948065ef47778ae5f8ccdb57f7be16c0cf5a8be29a93"
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
