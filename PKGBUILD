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
sha256sums=(
	"25fd3c99ca6d7ba29fe3d4eec9f3a3a69c98240694743928ea7f36887a135e01"
	"0d2106df399cf2260c5982eaf218d9d7d135a665084ebd590fab33f7414b72d7"
	"a378af54cb5befc28cdfe409c26ec65cc3d81ac6f160a4797a2fa846f338d217"
	"22b508276e8eb76bd663bb52ad567ba24e75f42862ccc953eba1040e90ad25f2"
	"35604c27995f5c99f66fb54ac0571a889791880f1428b969dad602a0a13aeb90"
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
