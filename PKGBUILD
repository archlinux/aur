# maintainer: Mehmet Akif Tasova <makiftasova@gmail.com>

pkgname=lampray
pkgver=1.3.2
pkgrel=4
pkgdesc='Linux Application Modding Platform. A native Linux mod manager.'
arch=('x86_64')
url='https://github.com/CHollingworth/Lampray'
license=('Unlicense')
depends=('curl' 'p7zip' 'sdl2' 'zenity')
makedepends=('cmake' 'ninja')
source=(
	"$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
	Lampray.desktop
	)
sha256sums=(
	'2e15a016cd332aec7acbec34fddee405f7a3d591a09f5eec9f40c8f0e4df437d'
	'd04bde0cafedecbd71fe506525c0738db68f0252fbe22c0b974401b2cc00e67f'
	)

build() {
  cd "${pkgname^}-${pkgver}"

 # Treating -Wformat-security as error prevents building
  export CFLAGS="${CFLAGS} -Wno-error=format-security"
  export CXXFLAGS="${CXXFLAGS} -Wno-error=format-security"

  cmake \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_MAKE_PROGRAM=ninja \
    -B ./build \
    -G Ninja \
    -S ./

  cd build

  ninja
}

package() {
  install -Dm 644 "${pkgname^}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 755 "${pkgname^}-${pkgver}/build/${pkgname^}" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm 644 Lampray.desktop "${pkgdir}/usr/share/applications/Lampray.desktop"
}
