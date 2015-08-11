# Maintainer: Jon Eyolfson <jon@eyolfson.com>
# Contributor: Roni Choudhury <aichoudh@gmail.com>

pkgname=pin
pkgver=2.14.r71313
_pkgver=2.14-71313
pkgrel=1
pkgdesc="A tool for the dynamic instrumentation of programs"
arch=('x86_64')
url="http://www.pintool.org"
license=('custom')
groups=()
depends=('gcc>=4.4.7' 'bash' 'lib32-gcc-libs>=4.4.7')
options=('!strip' 'staticlibs')
source=("http://software.intel.com/sites/landingpage/pintool/downloads/${pkgname}-${_pkgver}-gcc.4.4.7-linux.tar.gz"
        "pin.sh")
sha256sums=('1c29f589515772411a699a82fc4a3156cad95863a29741dfa6522865d4d281a1'
            '7198073c94e785cbd9002cdd174ab3bb1d28cc4e26626905c12173ad31ae82fc')

package() {
    cd "${srcdir}/${pkgname}-${_pkgver}-gcc.4.4.7-linux"

    # Copy pin executables, etc. to the /opt/pin directory (because pin
    # uses a non-standard FHS for its stuff).
    mkdir -p ${pkgdir}/opt/pin
    cp -r * ${pkgdir}/opt/pin

    # Fix the permissions (they're very broken)
    find "${pkgdir}/opt/pin" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/pin" -type f -exec chmod 644 {} \;
    chmod +x "${pkgdir}/opt/pin/pin"
    chmod +x "${pkgdir}/opt/pin/pin.sh"
    find "${pkgdir}/opt/pin" -name pinbin -type f -exec chmod +x {} \;
    find "${pkgdir}/opt/pin" -name xed -type f -exec chmod +x {} \;
    find "${pkgdir}/opt/pin" -name pindb -type f -exec chmod +x {} \;
    find "${pkgdir}/opt/pin/source/tools/Utils" -name 'test*' -type f -exec chmod +x {} \;
    find "${pkgdir}/opt/pin/source/tools/Utils" -name '*.py' -type f -exec chmod +x {} \;

    # Move LICENSE to the Arch location
    mkdir -p "${pkgdir}/usr/share/licenses/pin"
    mv "${pkgdir}/opt/pin/LICENSE" "${pkgdir}/usr/share/licenses/pin"

    # Copy shell script for modifying path.
    cd "$srcdir"
    mkdir -p ${pkgdir}/etc/profile.d 
    install pin.sh ${pkgdir}/etc/profile.d
}
