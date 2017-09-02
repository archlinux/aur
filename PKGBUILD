# Maintainer: Yen Chi Hsuan

pkgname=pulse-secure
pkgver=5.3r1
pkgrel=1
pkgdesc='Pulse Connect Secure (PCS) Client'
arch=(i686 x86_64)
license=(custom)
url='https://www.pulsesecure.net/'
depends_i686=(gcc-libs libgnome-keyring)
depends_x86_64=(lib32-gcc-libs lib32-libgnome-keyring)
source=(https://trial.pulsesecure.net/clients/ps-pulse-linux-$pkgver.0-b587-centos-rhel-installer.rpm
        pulseUi.sh
        EULA.txt)
md5sums=('652f6e8f54ea5bdd05a123ba6fd475ba'
         'b00064e15969e230e979e26a491aaa96'
         '261848a28201e5386ec4bf587473a48b')
optdepends_i686=('webkitgtk: for pulseUi frontend')
optdepends_x86_64=('lib32-webkitgtk: for pulseUi frontend')

prepare() {
    mkdir -p pulse && pushd pulse
    tar -zxvf ../usr/local/pulse/pulse.tgz
    popd

    # HACK: patch binary
    # Idea from https://lists.archlinux.org/pipermail/aur-general/2017-August/033452.html
    for f in pulse/pulseUi_centos_7 pulse/pulseUi.desktop ; do
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
  install -Dm755 pulse/pulseUi_centos_7 "${pkgdir}"/opt/pulsesecure/pulseUi
  install -Dm755 pulse/libpulseui.so_centos_7 "${pkgdir}"/opt/pulsesecure/libpulseui.so
  install -Dm644 pulse/pulseUi.desktop "${pkgdir}"/usr/share/applications/

  # Wrappers & symlinks
  install -Dm755 pulseUi.sh "${pkgdir}"/usr/bin/pulseUi
  ln -s /opt/pulsesecure/pulsesvc "${pkgdir}"/usr/bin/pulsesvc

  cp -dr --no-preserve=ownership pulse/html "${pkgdir}"/opt/pulsesecure/html

  install -Dm644 EULA.txt "${pkgdir}"/usr/share/licenses/$pkgname/
}
