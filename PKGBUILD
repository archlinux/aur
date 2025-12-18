# Maintainer: Emanuel Becerra <elbecerrrasoto@gmail.com>

pkgname=brother-dcpb7535dw-bin
_printer=DCPB7535DW
pkgver=4.0.0
pkgrel=1
pkgdesc="LPR and CUPS wrapper driver for Brother DCP-B7535DW"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=in&lang=en&prod=dcpb7535dw_as_cn"
license=("EULA")
depends=('cups' 'ghostscript' 'lib32-glibc')
# The download URL uses lowercase, so we keep that separate
source=("https://download.brother.com/welcome/dlf103666/dcpb7535dwpdrv-${pkgver}-1.i386.deb")
md5sums=('2ef0330b78c135dd974888b7bd3c427e')

package() {
    # 1. Extract the internal data archive
    tar -xf "${srcdir}/data.tar.gz" -C "${pkgdir}"

    # 2. Set internal paths based on your tree output
    _base_dir="${pkgdir}/opt/brother/Printers/${_printer}"

    # 3. Install the PPD file
    mkdir -p "${pkgdir}/usr/share/cups/model/Brother"
    install -m644 "${_base_dir}/cupswrapper/brother-${_printer}-cups-en.ppd" \
        "${pkgdir}/usr/share/cups/model/Brother/"

    # 4. Create the CUPS filter symlink
    # Based on your tree, the wrapper is named 'lpdwrapper'
    mkdir -p "${pkgdir}/usr/lib/cups/filter"
    ln -s "/opt/brother/Printers/${_printer}/cupswrapper/lpdwrapper" \
        "${pkgdir}/usr/lib/cups/filter/brother_lpdwrapper_${_printer}"

    # 5. Fix permissions for the binaries
    # Your tree shows i686 and x86_64 folders; we make them all executable
    chmod -R 755 "${pkgdir}/opt/brother/Printers/${_printer}/"
}
