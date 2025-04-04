
# Maintainer: Adam Wahab <awahab@adhoc.tools>

_name=NeuralRack
pkgname=${_name,,}-git
pkgver=r165.47ef5cf
pkgrel=1
pkgdesc="Neural model and impulse response file loader"
url="https://github.com/brummer10/$_name"
arch=(aarch64 x86_64)
license=(BSD-3-Clause)
depends=(glibc gcc-libs libx11)
makedepends=(cairo libsndfile lv2 xxd)
checkdepends=(lv2lint)
provides=($_pkgname)
groups=(lv2-plugins pro-audio)
source=("git+${url}.git")
sha256sums=('SKIP')
_plugin_uri="urn:brummer:${_name,,}"

pkgver() {
  cd $_name
  set -o pipefail
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_name
	git submodule update --init --recursive
	sed -i 's/egrep/grep/' makefile
	# https://github.com/brummer10/NeuralRack/issues/5
	sed -i 's/$(EXEC_NAME).desktop/$(NAME).desktop/' NeuralRack/makefile
	sed -i 's/$(EXEC_NAME).svg/$(NAME).svg/' NeuralRack/makefile
	make CXX=g++ STRIP=:
}

check() {
  cd $_name
  lv2lint -M pack -s '_Z*' -I bin/$_name.lv2 "$_plugin_uri"
}

package() {
	depends+=(libcairo.so libsndfile.so)
	cd $_name
	make DESTDIR=${pkgdir} install
	install -vDm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
	install -vDm 644 README.md NeuralRack.png -t "$pkgdir"/usr
}
