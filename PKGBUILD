# Maintainer: David Anderegg <dd.anderegg@hotmail.com>

# Pointwise does no longer provide the installation files online. Thus you need
# to obtain the installation file ("pw-2024.1-linux_x86_64-jre.sh") manually.
# Then you need to place it in the same directory as this PKGBUILD. If
# Pointwise ships a compressed file, you need to extract it first

# !!CAUTION!! 
# You need to manually enter the license server location in the file
# 'pointwise.desktop' on line 5 by replacing PORT with your servers port and
# SERVER with your severs adress.

pkgname=pointwise
pkgver=2024.1
pkgrel=1
pkgdesc="Pointwise is the choice for CFD (computational fluid dynamics) mesh generation, covering all of preprocessing from geometry model import to flow solver export."
arch=('x86_64')
url="https://pointwise.com/"
_filename=pw-${pkgver}-linux_x86_64-jre.sh
_licensefile="Fidelity Pointwise Click-Through Terms 2024-July 15.pdf"
source=("pointwise.desktop" 
	"pointwise.ico"
	"local://${_filename}")
sha256sums=(
	"SKIP"
	"f0fb928f4e5be67b8bc7b2084ed96f84f1e235b6dd9ea60ae5cd3fc4da75f083"
	"1a4a283b6a7db11dbd51ace1294666de4ccc71866dc6a16d2f9371e47f6fd6f9")
options=("!strip")

package() {
    prefix="${pkgdir}/opt/${pkgname}"

    # Fake install pointwise in the current directory
    bash "${srcdir}/${_filename}" -q -dir ${prefix} -Dinstall4j.keepLog=false -Dinstall4j.logToStderr=false

    # .desktop file
    install -Dm644 "${srcdir}/pointwise.desktop" \
	    "${pkgdir}/usr/share/applications/pointwise.desktop"
    
    # .ico file
    install -Dm644 "${srcdir}/pointwise.ico" \
	    "${pkgdir}/usr/share/pixmaps/pointwise.ico"

    # remove install4j-stuff
    rm "${prefix}/.install4j" -r
    rm "${prefix}/uninstall_pointwise${pkgver}"

    # extract license and install it
    pdftotext "${prefix}/${_licensefile}" "${srcdir}/LICENSE"
    sed -i "1i The content of this file was automatically extracted using 'pdftotext' from the file found in '/opt/pointwise/${_licensefile}'\n" "${srcdir}/LICENSE"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

}
