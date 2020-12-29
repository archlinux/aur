# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
# Contributor: Jon Eyolfson <jon@eyolfson.com>
# Contributor: Roni Choudhury <aichoudh@gmail.com>

pkgname=pin
pkgver=3.17.r98314
_pkgver=3.17-98314-g0c048d619
pkgrel=1
pkgdesc="A tool for the dynamic instrumentation of programs"
arch=('x86_64')
url="http://www.pintool.org"
license=('custom')
groups=()
depends=('gcc>=4.4.7' 'bash' 'lib32-gcc-libs>=4.4.7')
options=('!strip' 'staticlibs')
source=("http://software.intel.com/sites/landingpage/pintool/downloads/${pkgname}-${_pkgver}-gcc-linux.tar.gz"
        "pin.sh")
sha256sums=('a9cc3df7667b70dd44e51f66ed506bcdc31d942bb7698e1d4e1f8fe5d01c80bb'
            '7198073c94e785cbd9002cdd174ab3bb1d28cc4e26626905c12173ad31ae82fc')

package() {
    cd "${srcdir}/${pkgname}-${_pkgver}-gcc-linux"

    # Copy pin executables, etc. to the /opt/pin directory (because pin
    # uses a non-standard FHS for its stuff).
    mkdir -p ${pkgdir}/opt/pin
    cp -r * ${pkgdir}/opt/pin

    # Fix the permissions (they're very broken)
    find "${pkgdir}/opt/pin" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/pin" -type f -exec chmod 644 {} \;
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
}
