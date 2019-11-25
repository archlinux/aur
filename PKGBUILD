# Maintainer: CrocoDuck <crocoduck dot oducks at gmail dot com>

pkgname=dpf-plugins-git
pkgver=r113.86084a9
pkgrel=1
pkgdesc="Collection of DPF-based plugins by DISTRHO. LV2, LADSPA, dssi and VST."
arch=('i686' 'x86_64')
url="http://distrho.sourceforge.net/"
license=('custom')
depends=('jack' 'liblo' 'projectm')
makedepends=('git' 'wget')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}"::'git+https://github.com/DISTRHO/DPF-Plugins.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-*}"
    make all && make all -C plugins/ProM
}

package() {
    cd "${pkgname%-*}"
    pwd
    # Avoid errors while installing binaries
    sed -i -- 's/cp \-r bin\/ProM/\#cp \-r bin\/ProM/' Makefile
    sed -i -- 's/cp \-r bin\/glBars/\#cp \-r bin\/glBars/' Makefile
    # Install the custom license:
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    # Install the package files:
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
