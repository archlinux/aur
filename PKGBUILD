# Maintainer: Yen Chi Hsuan

pkgname=pulse-connect-secure
pkgver=8.2R5
pkgrel=2
pkgdesc='Pulse Connect Secure (PCS) Client'
arch=(i686 x86_64)
license=(custom)
url='https://www.pulsesecure.net/'
depends_i686=(gcc-libs)
depends_x86_64=(lib32-gcc-libs)
source=(https://secure.nis.vt.edu/resources/downloads/pulse-8.2R5.i386.rpm
        pulseUi.sh
        EULA.txt)
sha256sums=('40d2d8dbafff4b2689ace8ecaa1d1275a5c252c266cc5b90c5d426983ccd690d'
            '1d34fe84a6eb8ad1967b48893911f104b62a00df60f063d6daa662a66d2e2007'
            '823b298db462d9963148888287ebde2eb013c9b7d0635f3893d18a35776fa8c3')
optdepends_i686=('webkitgtk: for pulseUi frontend')
optdepends_x86_64=('lib32-webkitgtk: for pulseUi frontend')

prepare() {
    mkdir -p pulse && pushd pulse
    tar -zxvf ../usr/local/pulse/pulse.tgz
    popd

    # HACK: patch binary
    # Idea from https://lists.archlinux.org/pipermail/aur-general/2017-August/033452.html
    sed -i 's#/usr/local/pulse#/opt/pulsesecure#' pulse/pulseUi_centos_7
}

package() {
  install -Ddm755 "${pkgdir}"/usr/bin
  install -Ddm755 "${pkgdir}"/opt/pulsesecure
  install -Ddm755 "${pkgdir}"/usr/share/applications
  install -Ddm755 "${pkgdir}"/usr/share/licenses/$pkgname

  # Skip PulseClient.sh - seems it's not useful here
  install -Dm755 pulse/pulsediag "${pkgdir}"/opt/pulsesecure/
  install -Dm4755 pulse/pulsesvc "${pkgdir}"/opt/pulsesecure/
  install -Dm755 pulse/pulseUi_centos_7 "${pkgdir}"/opt/pulsesecure/pulseUi
  install -Dm755 pulse/libpulseui.so_centos_7 "${pkgdir}"/opt/pulsesecure/libpulseui.so
  install -Dm644 pulse/pulseUi.desktop "${pkgdir}"/usr/share/applications/
  install -Dm755 pulseUi.sh "${pkgdir}"/usr/bin/pulseUi

  cp -dr --no-preserve=ownership pulse/html "${pkgdir}"/opt/pulsesecure/html

  install -Dm644 EULA.txt "${pkgdir}"/usr/share/licenses/$pkgname/
}
