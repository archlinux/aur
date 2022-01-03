# Contributor: David Anderegg <dd.anderegg@hotmail.com>

pkgname=pointwise
pkgver=18.5R1
pkgrel=1
pkgdesc="Pointwise is the choice for CFD (computational fluid dynamics) mesh generation, covering all of preprocessing from geometry model import to flow solver export."
arch=('x86_64')
url="https://pointwise.com/"
_filename=pw-V${pkgver}-linux_x86_64-jre.sh
_licensefile="Cadence-tbl-v8.pdf"
source=("pointwise.desktop" 
	"pointwise.ico"
	"https://www.pointwise.com/downloads/${_filename}")
sha256sums=(
	"2508104477e93b7f32c80f248b01e527d6a85a1e18e6b27199b7b617289a2bd7"
	"f0fb928f4e5be67b8bc7b2084ed96f84f1e235b6dd9ea60ae5cd3fc4da75f083"
	"648bbb3dad0f138a78c16fc95dcb8e80feacccb90cf8287fa4daabbca1bb1c78")
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
