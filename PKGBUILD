# Maintainer: Mahmut Dikcizgi <boogiepop a~t gmx com>

pkgname=mpp-git
pkgver="r3181.93b1cd14"
pkgrel=2
pkgdesc='Rockchip VPU Media Process Platform (MPP) for hardware video decode latest revision from git'
arch=('aarch64' 'arm7h')
url='https://github.com/rockchip-linux/mpp/'
license=('Apache')
depends=('gcc-libs' 'coreutils' 'systemd')
makedepends=('cmake')
options=(!lto debug strip)
install=install
source=(git+https://github.com/rockchip-linux/mpp.git#branch=develop
		'mpp.rules'
		'install')
sha256sums=('SKIP'
            'd27661a0c143fee2cb3d31b04be2503f1bd2291a2a0565ce391a663cd414ebb2'
            'e41004dc18f77d37b23f84464c4367c7ccf94d8e86b6f751437b685322e153d2')

build() {
    cmake -B build -S "mpp" \
        -DCMAKE_BUILD_TYPE=Release \
        -DHAVE_DRM=ON \
        -DCMAKE_INSTALL_LIBDIR:PATH='lib' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -G "Unix Makefiles"
    make -j$(nproc) -C build
}

pkgver() {
  cd mpp
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  	provides=($pkgname)
  	replaces=(rockchip-mpp)
  	conflicts=(rockchip-mpp)
    make -C build DESTDIR="$pkgdir" install
    
    # mpp needs to access /dev/mpp_service /dev/rga /dev/dma_heap/ ad so on
    # access to those devices are +rw'ed to video groups with those rules
    install -m644 -Dt "$pkgdir/etc/udev/rules.d/" mpp.rules
}