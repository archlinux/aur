# Maintainer: XavierCLL <xavier.corredor.llano at gmail.com>
# Maintainer for aarch64: Ethan Reece <aur at ethanreece dot com>
# Contributor: Frederik Olesen
# Contributor: Andrew Shark

pkgname=pycharm-professional
pkgver=2023.3.5
pkgrel=1
pkgdesc="Python IDE for Professional Developers. Professional Edition"
arch=('x86_64' 'x86_64_v3' 'aarch64')
url='https://www.jetbrains.com/pycharm/'
license=('custom')
options=('!strip')
backup=(
    "opt/${pkgname}/bin/pycharm64.vmoptions"
    "opt/${pkgname}/bin/idea.properties"
)
depends=(
    giflib
    glibc
    sh
    python
    python-setuptools
    cython
    libdbusmenu-glib
    ttf-font
    fontconfig
)

source=("pycharm-professional.desktop" "ltedit-professional.desktop")
source_x86_64=("https://download-cf.jetbrains.com/python/${pkgname}-${pkgver}.tar.gz")
source_x86_64_v3=($source_x86_64)
source_aarch64=("https://download-cf.jetbrains.com/python/${pkgname}-${pkgver}-aarch64.tar.gz")
sha256sums=('6ff245b42b475a5b97c359d97bc48d573c2988170fc195073c9187d5abe1c576'
            '21e9d192712fb537d9e5abccc54970becb347b32ad2be469a35b2585f45a9116')
sha256sums_x86_64=('7e77390d7bba42843e950b1544da718913e6bae8543ce499c01484550df39004')
sha256sums_x86_64_v3=('7e77390d7bba42843e950b1544da718913e6bae8543ce499c01484550df39004')
sha256sums_aarch64=('4a5aef97f10d19b3b4f9e34f244a84592bde730171e0596abcfde1baffb65be4')
# makedepends=('python-setuptools' 'cython')
optdepends=(
    'ipython: For enhanced interactive Python shell inside Pycharm'
    'openssh: For deployment and remote connections'
    'python-setuptools: Packages manager for Python, for project interpreter'
    'python-coverage: For support code coverage measurement'
    'docker-machine: For support docker inside Pycharm'
    'docker-compose: For support docker inside Pycharm'
    'vagrant: For support virtualized development environments'
    'python-pytest: For support testing inside Pycharm'
    'python-tox: Python environments for testing tool'
    'jupyter-server: For Jupyter notebooks and apps'
)
            
if [[ "${CARCH}" == "x86_64" ]] ||  [[ "${CARCH}" == "x86_64_v3" ]] ; then
    install=pycharm-professional_x86_64.install
elif [ "${CARCH}" == "aarch64" ]; then
    install=pycharm-professional_aarch64.install
fi
            
prepare() {
    # clean up for PyDev debugger
    find pycharm-${pkgver}/plugins/python/helpers/pydev/ \( -name *.so -o -name *.pyd -o -name *.dll \) -delete
}

package() {
    # licenses
    install -dm 755 "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -m 644 "pycharm-${pkgver}/license/"* "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    # base
    install -dm 755 "${pkgdir}/opt/${pkgname}"
    mv "pycharm-${pkgver}/"* "${pkgdir}/opt/${pkgname}/"
    install -dm 755 "${pkgdir}/usr/share/applications"
    install -Dm 644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/"
    install -Dm 644 "ltedit-professional.desktop" "${pkgdir}/usr/share/applications/"
    install -dm 755 "${pkgdir}/usr/share/icons/hicolor/"{128x128,scalable}"/apps/"
    install -Dm 644 "${pkgdir}/opt/${pkgname}/bin/pycharm.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/pycharm-professional.png"
    install -Dm 644 "${pkgdir}/opt/${pkgname}/bin/pycharm.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pycharm-professional.svg"

    # issue https://youtrack.jetbrains.com/issue/IDEA-313202
    chmod 4755 "${pkgdir}/opt/pycharm-professional/jbr/lib/chrome-sandbox"

    # exec
    install -dm 755 "${pkgdir}/usr/bin/"
    ln -s "/opt/${pkgname}/bin/pycharm.sh" "${pkgdir}/usr/bin/pycharm-professional"
    ln -s "/opt/${pkgname}/bin/ltedit.sh" "${pkgdir}/usr/bin/ltedit-professional"
}
