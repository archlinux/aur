# Maintainer: Alexander Jacocks <alexander@redhat.com>
# Contributor: Lu Xu <oliver_lew@outlook.com>
# Contributor: LIN Ruohshoei <lin dot ruohshoei plus archlinux at gmail dot com>
# Contributor: Eric DeStefano <eric at ericdestefano dot com>
# Contributor: Iñigo Alvarez <alvarezviu@gmail.com>
# Contributor: William Termini <aur@termini.me>

pkgname=minivmac
pkgver=36.04
pkgrel=2
pkgdesc="A miniature early Macintosh emulator"
arch=('x86_64' 'i686' 'aarch64')
url="https://www.gryphel.com/c/minivmac/"
_url_d="https://www.gryphel.com/d/minivmac"
license=('GPL2')
depends=('bash' 'libx11')
source=(${pkgname}-${pkgver}.tgz::"${_url_d}/${pkgname}-${pkgver}/$pkgname-$pkgver.src.tgz")
sha256sums=('9b7343cec87723177a203e69ad3baf20f49b4e8f03619e366c4bf2705167dfa4')

build() {
    cd ${pkgname}
    mkdir -p bin
    gcc setup/tool.c -o setup_t
    # build all supported models
    for _model in 128K 512Ke Plus SE Classic SEFDHD II; do
        model_lower=$(echo $_model | tr '[:upper:]' '[:lower:]')
        # In common 1080p monitors, the magnify options work well
        [ $_model = II ] && option_mf=2 || option_mf=3
        echo Architecture is $CARCH.
        if [ "${CARCH}" = "x86_64" ]; then
          ./setup_t -t lx64 -m ${_model} -mf "${option_mf}" -magnify 1 | bash
        elif [ "${CARCH}" = "i686" ]; then
          ./setup_t -t lx86 -m ${_model} -mf "${option_mf}" -magnify 1 | bash
        elif [ "${CARCH}" = "aarch64" ]; then
          ./setup_t -t larm -m ${_model} -mf "${option_mf}" -magnify 1 | bash
        else
          echo "Architecture $CARCH is not supported by this PKGBUILD."
          exit 1
        fi
        make
        mv minivmac bin/"minivmac-$model_lower"
    done
}

package() {
    cd ${pkgname}
    # install docs
    install -dm755 "$pkgdir"/usr/share/doc/$pkgname
    install -m0644 COPYING.txt "$pkgdir"/usr/share/doc/$pkgname/COPYING.txt
    install -m0644 README.txt "$pkgdir"/usr/share/doc/$pkgname/README.txt
    # install all model-specific executables
    install -dm755 "$pkgdir"/usr/bin/
    install -Dm755 bin/"${pkgname}"* "$pkgdir"/usr/bin/
    # set minimac to default to Macintosh Plus emulation
    ln -s /usr/bin/$pkgname-plus "$pkgdir"/usr/bin/$pkgname
}
