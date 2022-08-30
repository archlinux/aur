# Maintainer: Gerasimos Chourdakis <chourdak at in dot tum dot de>
# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
pkgname=calculix-precice
pkgver=2.19.0
pkgrel=3
pkgdesc="preCICE-adapter for the CSM code CalculiX"
url="https://github.com/${pkgname/calculix-/}/${pkgname/precice/adapter}"
license=(GPL3)
arch=('x86_64')
depends=(calculix-ccx precice yaml-cpp) # pastix
makedepends=(gcc-fortran pandoc)        # mono
optdepends=('man-db: manual pages for ccx_preCICE')
source=(${url}/archive/v${pkgver}.tar.gz http://dhondt.de/ccx_${pkgver::4}.src.tar.bz2)
sha512sums=('b9e7a34fa6db9822c8a73312513bc8f465f9137f4c3984fab4ec346c0b9a389732167028ad7d226654e3b5076a976b0793a6329ba9de15b222feef522c15f221' 'd4bcc99c75cafea05d9c4179cd241861c94f31dcb8c6097afc1df6dc0462e0d708e55a5116cc7a3fcaf55cbb8e55974d795bafd63d34f6195d4b810ca32a4037')

prepare() {
  # https://github.com/precice/precice.github.io/blob/master/pages/docs/adapters/calculix/adapter-calculix-get-adapter.md?plain=1#L86
  sed -i 's/^FFLAGS = -Wall -O3 -fopenmp $(INCLUDES)/FFLAGS = -Wall -O3 -fopenmp -fallow-argument-mismatch $(INCLUDES)/' ${pkgname/precice/adapter}-${pkgver}/Makefile
  cd ${pkgname/precice/adapter}-${pkgver}/packaging
  pandoc manpage.md -s -t man -o ccx_preCICE.1
}

build() {
  cd ${pkgname/precice/adapter}-${pkgver}
  make CCX="${srcdir}/CalculiX/ccx_${pkgver::4}/src"
}

check() {
  cd ${pkgname/precice/adapter}-${pkgver}
  ./bin/ccx_preCICE -v || true
}

package() {
  cd ${pkgname/precice/adapter}-${pkgver}
  install -Dvm755 bin/ccx_preCICE -t ${pkgdir}/usr/bin
  install -Dm 644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}
  install -Dm 644 packaging/ccx_preCICE.1 -t ${pkgdir}/usr/share/man/man1/
  install -Dm 644 README.md -t ${pkgdir}/usr/share/doc/${pkgname}
}
