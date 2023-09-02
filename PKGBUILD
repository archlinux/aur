# Maintainer: a821 <a821 mail.de>
# Contributor: lukaszimmermann <luk.zim91 gmail.com>
# Contributor: florianbw <florian.bw gmail.com>

pkgname=cytoscape
pkgver=3.10.1
pkgrel=1
pkgdesc="Network Data Integration, Analysis, and Visualization in a Box"
arch=('any')
url=https://www.cytoscape.org
license=('LGPL')
depends=('java-runtime=17' 'bash')
optdepends=('opencl-driver: for OpenCL support')
source=("https://github.com/cytoscape/cytoscape/releases/download/${pkgver}/cytoscape-unix-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "${pkgname}")

sha256sums=('7eac40b27a4c602623d215b6a31bbf347e0fa9eb119563ece5e0d27928f2d5a5'
            'f4476545086f845e1cec5861169270da9f82a6ad4944972010827a567af0c7d0'
            '135faa3f0beb8ecc1b704cf376408e8bd5f62f32ba50a84002c14321d0bb0b68'
            'daf81142f560db93aeeea96ca185a2662dd0ec9ee220aee167bf826fc44f3dc3')

prepare() {
  cd ${pkgname}-unix-${pkgver}
  sed -i 's#^\(vm_options_path\)=.*$#\1="\${HOME}/CytoscapeConfiguration"#' cytoscape.sh gen_vmoptions.sh
  sed -i '/^LOCAL_CLASSPATH/a KARAF_INSTANCES="\${HOME}/CytoscapeConfiguration/instances"' framework/bin/karaf
  sed -i 's#\${KARAF_HOME}/instances#\${KARAF_INSTANCES}#' framework/bin/karaf
}

package() {
  install -d -m755 "${pkgdir}/opt"
  cp -r cytoscape-unix-${pkgver} "${pkgdir}/opt/cytoscape"
  install -Dm755 -t "${pkgdir}/usr/bin" "${pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.png"
  install -Dm644 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
}

# vim:set ts=2 sw=2 et:
