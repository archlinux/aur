# Maintainer: Ruben Deisenroth (Discord: Rubosplay#0815) <ruben.deisenroth@stud.tu-darmstadt.de>

pkgname=latex-tuda-ci-logos-sanity
pkgver=1.1.0
pkgrel=1
pkgdesc="Logos for TUDa-CI from Technische Universität Darmstadt - Sane Version that automatically fetches the logo from the corporate design book instead of relying on the user to download them"
arch=("any")
url="https://www.ulb.tu-darmstadt.de/finden_nutzen/medien_nutzen/dokumente_erstellen/latex/index.en.jsp"
license=("CC-BY-4.0")
depends=()
conflicts=("latex-tuda-ci-logos")
provides=("latex-tuda-ci-logos")
makedepends=("librsvg" "inkscape>=1.3")
source=("das_bild_der_tu_darmstadt.pdf::https://www.tu-darmstadt.de/media/medien_stabsstelle_km/services/medien_cd/das_bild_der_tu_darmstadt.pdf")
sha256sums=('92e42e15f7a880308d3bfef593fa9dea0a28f8bba73057c7e81c64f042049f43')

# Build Package
package() {
    cd "${srcdir}"
    # the logo is present on page one of the PDF, so we extract it
    inkscape das_bild_der_tu_darmstadt.pdf --export-filename=p1_i.svg --export-dpi=300 --pages=1
    # now we have to remove all the ICC stuff, as it is not supported by rsvg-convert (and doesn't matter for a B/W logo)
    sed -i 's/icc-color([^)]*)//g' p1_i.svg
    # Also for some reason, the logo isn't quite black, so we fix that as well
    sed -i 's/#000000/#1d1d1bff/g' p1_i.svg
    # now we extract the logo from the SVG and export the logo as PDF
    if ! rsvg-convert -f pdf -o tuda_logo.pdf p1_i.svg --export-id=g23; then
        echo "Warning: PDF conversion failed."
        echo "This may be due to ImageMagick's security policy settings."
        echo "To fix this, modify /etc/ImageMagick-6/policy.xml as follows:"
        echo "  - Change rights=\"none\" to rights=\"read|write\" for the PDF, PS, and SVG patterns."
        echo "  - Example:"
        echo "    sed -i 's/rights=\"none\" pattern=\"PDF\"/rights=\"read|write\" pattern=\"PDF\"/' /etc/ImageMagick-6/policy.xml"
        echo "    sed -i 's/rights=\"none\" pattern=\"PS\"/rights=\"read|write\" pattern=\"PS\"/' /etc/ImageMagick-6/policy.xml"
        echo "    sed -i 's/rights=\"none\" pattern=\"SVG\"/rights=\"read|write\" pattern=\"SVG\"/' /etc/ImageMagick-6/policy.xml"
        exit 1
    fi

    # Install
    install -Dm644 tuda_logo.pdf "${pkgdir}/$(kpsewhich -var-value TEXMFDIST)/tex/latex/tuda-ci/tuda_logo.pdf"
}
