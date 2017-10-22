# Maintainer: Yen Chi Hsuan

pkgname=pulse-secure
pkgver=5.3r3.0
pkgrel=1
pkgdesc='Pulse Connect Secure (PCS) Client'
arch=(x86_64)
license=(custom)
url='https://www.pulsesecure.net/'
depends=(gcc-libs libgnome-keyring)
source=("https://trial.pulsesecure.net/clients/ps-pulse-linux-$pkgver-b1021-centos-rhel-64-bit-installer.rpm"
        pulseUi.sh
        EULA.txt)
md5sums=('4cbe64953952d9ffdeaa4ffe2fc92a20'
         'b00064e15969e230e979e26a491aaa96'
         '261848a28201e5386ec4bf587473a48b')
optdepends=('webkitgtk: for pulseUi frontend')
conflicts=(pulse-connect-secure)

prepare() {
    mkdir -p pulse && pushd pulse
    tar -zxvf ../usr/local/pulse/pulse.tgz
    popd

    # HACK: patch binary
    # Idea from https://lists.archlinux.org/pipermail/aur-general/2017-August/033452.html
    for f in pulse/pulseUi_centos_7_x86_64 pulse/pulseUi.desktop ; do
        sed -i 's#/usr/local/pulse#/opt/pulsesecure#g' $f
    done
}

package() {
  install -Ddm755 "${pkgdir}"/usr/bin
  install -Ddm755 "${pkgdir}"/opt/pulsesecure
  install -Ddm755 "${pkgdir}"/usr/share/applications
  install -Ddm755 "${pkgdir}"/usr/share/licenses/$pkgname

  # Skip PulseClient.sh - seems it's not useful here
  install -Dm755 pulse/{pulsediag,pulseutil} "${pkgdir}"/opt/pulsesecure/
  install -Dm4755 pulse/pulsesvc "${pkgdir}"/opt/pulsesecure/
  install -Dm755 pulse/pulseUi_centos_7_x86_64 "${pkgdir}"/opt/pulsesecure/pulseUi
  install -Dm755 pulse/libpulseui.so_centos_7_x86_64 "${pkgdir}"/opt/pulsesecure/libpulseui.so
  install -Dm644 pulse/pulseUi.desktop "${pkgdir}"/usr/share/applications/

  # Wrappers & symlinks
  install -Dm755 pulseUi.sh "${pkgdir}"/usr/bin/pulseUi
  ln -s /opt/pulsesecure/pulsesvc "${pkgdir}"/usr/bin/pulsesvc

  cp -dr --no-preserve=ownership pulse/html "${pkgdir}"/opt/pulsesecure/html

  install -Dm644 EULA.txt "${pkgdir}"/usr/share/licenses/$pkgname/
}
