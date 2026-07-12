# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=('far2l' 'far2l-ttyx' 'far2l-gui' 'far2l-python')
pkgver=2.8.0
pkgrel=2
pkgdesc='Linux port of FAR v2'
url='https://github.com/elfmz/far2l'
arch=('x86_64' 'aarch64')
license=('GPL2')
source=("far2l-${pkgver}.tar.gz::https://github.com/elfmz/far2l/archive/refs/tags/v_${pkgver}.tar.gz")
sha256sums=('b0fddad2e3985f245f9e691e23b90fb97f7d29d9a0b131fe686aa3cbb2e4ea01')
depends=('libxml2' 'uchardet')
options=('!lto')
makedepends=('cmake' 'wxwidgets-gtk3' 'python-cffi' 'python-markdown' 'libxi')
optdepends=(
  'openssl: FTPS support in NetRocks'
  'libssh: SFTP support in NetRocks'
  'smbclient: SMB support in NetRocks'
  'libnfs: NFS support in NetRocks'
  'neon: WebDAV support in NetRocks'
  'aws-sdk-cpp: AWS S3 support in NetRocks'
  'libarchive: more archive type support in multiarc'
)

build() {
  cmake                                    \
    -S "${srcdir}/far2l-v_${pkgver}"       \
    -B "${srcdir}/far2l-v_${pkgver}/build" \
    -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr \
    -DCMAKE_BUILD_TYPE=Release             \
    -DPYTHON=yes                           \
    -Wno-dev
}

package_far2l() {
  cmake --build "${srcdir}/far2l-v_${pkgver}/build" --target install

  rm "${pkgdir}"/usr/lib/far2l/far2l_gui.so
  rm "${pkgdir}"/usr/lib/far2l/far2l_ttyx.broker
  rm "${pkgdir}"/usr/share/applications/{far2l,far2ledit}.desktop
  rm -r "${pkgdir}"/usr/{lib,share}/far2l/Plugins/python
}

package_far2l-ttyx() {
  pkgdesc+=' (TTY backend with X11/Xi support)'
  depends=('far2l' 'libxi') 
  optdepends=()

  cd "${srcdir}/far2l-v_${pkgver}/build"
  install -Dm0755 "install/far2l_ttyx.broker" "${pkgdir}"/usr/lib/far2l/far2l_ttyx.broker
}

package_far2l-gui() {
  pkgdesc+=' (WX/GTK GUI backend)'
  depends=('far2l' 'wxwidgets-gtk3') 
  optdepends=()

  cd "${srcdir}/far2l-v_${pkgver}/build"
  install -Dm0755 install/far2l_gui.so       "${pkgdir}"/usr/lib/far2l/far2l_gui.so
  install -Dm0644 far2l/DE/far2l.desktop     "${pkgdir}"/usr/share/applications/far2l.desktop
  install -Dm0644 far2l/DE/far2ledit.desktop "${pkgdir}"/usr/share/applications/far2ledit.desktop
}

package_far2l-python() {
  pkgdesc+=' - Python Plugin' 
  depends=('far2l' 'python-cffi') 
  optdepends=()

  cd "${srcdir}/far2l-v_${pkgver}/build"
  install -Dm0755 install/Plugins/python/plug/python.far-plug-wide "${pkgdir}"/usr/lib/far2l/Plugins/python/plug/python.far-plug-wide
  install -Dm0644 install/Plugins/python/plug/pythonEng.hlf        "${pkgdir}"/usr/share/far2l/Plugins/python/plug/pythonEng.hlf

  env -C install/Plugins/python/plug/far2l find . -type f -exec install -Dm0644 "{}" "${pkgdir}/usr/lib/far2l/Plugins/python/plug/far2l/{}" \;
  env -C install/Plugins/python/plugins    find . -type f -exec install -Dm0644 "{}" "${pkgdir}/usr/share/far2l/Plugins/python/plugins/{}"  \;
}

