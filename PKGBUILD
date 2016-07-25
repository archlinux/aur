# Maintainer: Jon Eyolfson <jon@eyolfson.com>
# Contributor: Roni Choudhury <aichoudh@gmail.com>

pkgname=pin
pkgver=3.0.r76991
_pkgver=3.0-76991
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
sha256sums=('68fe4bc525790d48c51f1f8375589fc8a21654ed2e443bb8cc08d19d5b3d7c6e'
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

    # Move LICENSE to the Arch location
    mkdir -p "${pkgdir}/usr/share/licenses/pin"
    mv "${pkgdir}/opt/pin/LICENSE" "${pkgdir}/usr/share/licenses/pin"

    # Copy shell script for modifying path.
    cd "$srcdir"
    mkdir -p ${pkgdir}/etc/profile.d 
    install pin.sh ${pkgdir}/etc/profile.d
}
