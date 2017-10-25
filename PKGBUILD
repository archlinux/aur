# Maintainer: Yen Chi Hsuan

pkgname=pulse-secure
pkgver=5.3r3.0
pkgrel=3
pkgdesc='Pulse Connect Secure (PCS) Client'
arch=(x86_64)
license=(custom)
url='https://www.pulsesecure.net/'
depends=(gcc-libs libgnome-keyring)
source=("https://trial.pulsesecure.net/clients/ps-pulse-linux-$pkgver-b1021-centos-rhel-64-bit-installer.rpm"
        pulseUi.sh
        EULA.txt)
md5sums=('4cbe64953952d9ffdeaa4ffe2fc92a20'
         'd81155461e2666c2b9d669c1b76f85fe'
         '261848a28201e5386ec4bf587473a48b')
optdepends=('webkitgtk: for pulseUi frontend'
            'psmisc: for pulsesvc -K')
conflicts=(pulse-connect-secure)

prepare() {
    mkdir -p pulse && pushd pulse
    tar -zxvf ../usr/local/pulse/pulse.tgz
    popd
}

package() {
  install -Ddm755 "${pkgdir}"/usr/bin
  install -Ddm755 "${pkgdir}"/usr/local/pulse
  install -Ddm755 "${pkgdir}"/usr/share/applications
  install -Ddm755 "${pkgdir}"/usr/share/licenses/$pkgname

  # Skip PulseClient.sh - seems it's not useful here
  install -Dm755 pulse/{pulsediag,pulseutil} "${pkgdir}"/usr/local/pulse/
  install -Dm4755 pulse/pulsesvc "${pkgdir}"/usr/local/pulse/
  install -Dm755 pulse/pulseUi_centos_7_x86_64 "${pkgdir}"/usr/local/pulse/pulseUi
  install -Dm755 pulse/libpulseui.so_centos_7_x86_64 "${pkgdir}"/usr/local/pulse/libpulseui.so
  install -Dm644 pulse/pulseUi.desktop "${pkgdir}"/usr/share/applications/

  # Wrappers & symlinks
  install -Dm755 pulseUi.sh "${pkgdir}"/usr/bin/pulseUi
  ln -s /usr/local/pulse/pulsesvc "${pkgdir}"/usr/bin/pulsesvc

  cp -dr --no-preserve=ownership pulse/html "${pkgdir}"/usr/local/pulse/html

  install -Dm644 EULA.txt "${pkgdir}"/usr/share/licenses/$pkgname/
}
