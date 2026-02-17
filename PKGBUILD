# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=('far2l' 'far2l-ttyx' 'far2l-gui' 'far2l-python')
pkgver=2.7.0
pkgrel=2
pkgdesc='Linux port of FAR v2'
url='https://github.com/elfmz/far2l'
arch=('x86_64' 'aarch64')
license=('GPL2')
source=("far2l-${pkgver}.tar.gz::https://github.com/elfmz/far2l/archive/refs/tags/v_${pkgver}.tar.gz")
sha256sums=('712ab8e5b40482ddd68e33f870e4c3d7e8f8c44b90fb9fe91288a00cb27dff48')
depends=('libxml2' 'uchardet')
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
  cd "${srcdir}/far2l-v_${pkgver}"
  cmake . -DCMAKE_INSTALL_PREFIX="${pkgdir}"/usr -DCMAKE_BUILD_TYPE=Release -DPYTHON=yes -Wno-dev
}

package_far2l() {
  cd "${srcdir}/far2l-v_${pkgver}"
  cmake --build . --target install

  rm "${pkgdir}"/usr/lib/far2l/far2l_gui.so
  rm "${pkgdir}"/usr/lib/far2l/far2l_ttyx.broker
  rm "${pkgdir}"/usr/share/applications/{far2l,far2ledit}.desktop
  rm -r "${pkgdir}"/usr/{lib,share}/far2l/Plugins/python
}

package_far2l-ttyx() {
  pkgdesc+=' (TTY backend with X11/Xi support)'
  depends=('far2l' 'libxi') 
  optdepends=()

  cd "${srcdir}/far2l-v_${pkgver}"
  install -Dm0755 "install/far2l_ttyx.broker" "${pkgdir}"/usr/lib/far2l/far2l_ttyx.broker
}

package_far2l-gui() {
  pkgdesc+=' (WX/GTK GUI backend)'
  depends=('far2l' 'wxwidgets-gtk3') 
  optdepends=()

  cd "${srcdir}/far2l-v_${pkgver}"
  install -Dm0755 install/far2l_gui.so       "${pkgdir}"/usr/lib/far2l/far2l_gui.so
  install -Dm0644 far2l/DE/far2l.desktop     "${pkgdir}"/usr/share/applications/far2l.desktop
  install -Dm0644 far2l/DE/far2ledit.desktop "${pkgdir}"/usr/share/applications/far2ledit.desktop
}

package_far2l-python() {
  pkgdesc+=' - Python Plugin' 
  depends=('far2l' 'python-cffi') 
  optdepends=()

  cd "${srcdir}/far2l-v_${pkgver}"
  install -Dm0755 install/Plugins/python/plug/python.far-plug-wide "${pkgdir}"/usr/lib/far2l/Plugins/python/plug/python.far-plug-wide
  install -Dm0644 install/Plugins/python/plug/pythonEng.hlf        "${pkgdir}"/usr/share/far2l/Plugins/python/plug/pythonEng.hlf

  env -C install/Plugins/python/plug/far2l find . -type f -exec install -Dm0644 "{}" "${pkgdir}/usr/lib/far2l/Plugins/python/plug/far2l/{}" \;
  env -C install/Plugins/python/plugins    find . -type f -exec install -Dm0644 "{}" "${pkgdir}/usr/share/far2l/Plugins/python/plugins/{}"  \;
}

