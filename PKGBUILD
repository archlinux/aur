# Maintainer: Edoardo Signorini <contact at edoars dot me>

pkgname=libpractrand
pkgver=pre0.95
pkgrel=1
pkgdesc="C++ library of pseudo-random number generators and statistical tests for RNGs"
url=https://pracrand.sourceforge.net/
license=(custom)
arch=(x86_64)
source=("https://downloads.sourceforge.net/project/pracrand/PractRand-$pkgver.zip"
	"https://pracrand.sourceforge.net/license.txt")
sha256sums=('5738c322ccb983b63fbe693f305afa2a7c73e64a80b303c9139278c453ce27b4'
	'32f7a58d75eb3b6720653823c8493ccb5cdeb93d342780a66779a98a2621b6e9')

build() {
	g++ -c src/*.cpp src/RNGs/*.cpp src/RNGs/other/*.cpp -O3 -Iinclude -pthread -std=gnu++11
	ar rcs libPractRand.a *.o
	g++ -o RNG_test tools/RNG_test.cpp libPractRand.a -O3 -Iinclude -pthread -std=gnu++11
	g++ -o RNG_benchmark tools/RNG_benchmark.cpp libPractRand.a -O3 -Iinclude -pthread -std=gnu++11
	g++ -o RNG_output tools/RNG_output.cpp libPractRand.a -O3 -Iinclude -pthread -std=gnu++11
}

package() {
	install -Dt "${pkgdir}"/usr/bin -m755 RNG_{test,benchmark,output}
	install -Dt "${pkgdir}"/usr/lib -m644 libPractRand.a

	install -Dt "${pkgdir}"/usr/include -m644 include/PractRand.h
	install -Dt "${pkgdir}"/usr/include -m644 include/PractRand_full.h
	for file in $(find include/PractRand -type f -name "*.h"); do
		install -Dt "${pkgdir}"/usr/${file%/*} -m644 ${file}
	done

	install -D -m644 license.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
