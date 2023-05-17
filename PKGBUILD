# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Jon Eyolfson <jon@eyolfson.com>
# Contributor: Roni Choudhury <aichoudh@gmail.com>

pkgname=pin
pkgver=3.27
_pkgver=3.27-98718-gbeaa5d51e
pkgrel=1
pkgdesc="A tool for the dynamic instrumentation of programs"
arch=('x86_64')
url="https://software.intel.com/content/www/us/en/develop/articles/pin-a-dynamic-binary-instrumentation-tool.html"
license=('custom')
depends=('gcc' 'bash' 'lib32-gcc-libs')
options=('!strip' 'staticlibs')
source=("http://software.intel.com/sites/landingpage/pintool/downloads/${pkgname}-${_pkgver}-gcc-linux.tar.gz"
        "pin.sh")
sha256sums=('e7d44d25668632007d5a109e5033415e91db543b8ce9e665893a05e852b67707'
            '7198073c94e785cbd9002cdd174ab3bb1d28cc4e26626905c12173ad31ae82fc')

package() {
    cd "${srcdir}/${pkgname}-${_pkgver}-gcc-linux"

    # Copy pin executables, etc. to the /opt/pin directory (because pin
    # uses a non-standard FHS for its stuff).
    mkdir -p ${pkgdir}/opt/pin
    cp -r * ${pkgdir}/opt/pin

    # Fix the permissions (they're very broken)
    chmod -R a=r,u+w,a+X "${pkgdir}/opt/pin"
    chmod +x "${pkgdir}/opt/pin/pin"
    find "${pkgdir}/opt/pin" -name pinbin -type f -exec chmod +x {} \;
    find "${pkgdir}/opt/pin" -name xed -type f -exec chmod +x {} \;
    find "${pkgdir}/opt/pin" -name pindb -type f -exec chmod +x {} \;
    find "${pkgdir}/opt/pin/source/tools/Utils" -name 'test*' -type f -exec chmod +x {} \;
    find "${pkgdir}/opt/pin/source/tools/Utils" -name '*.py' -type f -exec chmod +x {} \;

    # Copy shell script for modifying path.
    cd "$srcdir"
    mkdir -p ${pkgdir}/etc/profile.d
    install pin.sh ${pkgdir}/etc/profile.d

    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -r "${pkgdir}"/opt/pin/licensing "${pkgdir}/usr/share/licenses/${pkgname}"
}
