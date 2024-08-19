# Maintainer: Ruben Deisenroth (Discord: Rubosplay#0815) <ruben.deisenroth@stud.tu-darmstadt.de>

pkgname=latex-tuda-ci-logos-sanity
pkgver=1.0.0
pkgrel=2
pkgdesc="Logos for TUDa-CI from Technische Universität Darmstadt - Sane Version that automatically fetches the logo from Wikipedia instead of relying on the user to download them"
arch=("any")
url="https://www.ulb.tu-darmstadt.de/finden_nutzen/medien_nutzen/dokumente_erstellen/latex/index.en.jsp"
license=("CC-BY-4.0")
depends=()
conflicts=("latex-tuda-ci-logos")
provides=("latex-tuda-ci-logos")
makedepends=("librsvg")
source=("tuda_logo.svg::https://upload.wikimedia.org/wikipedia/de/2/24/TU_Darmstadt_Logo.svg?download")
sha256sums=("94afd6f2a2b3804c706e2f5c6264a8a4cf8ec3ed87a0fd9b54a27d0edef36271")

# Build Package
package() {
    cd "${srcdir}"
    
    # Convert SVG to PDF
    if ! rsvg-convert -f pdf -o tuda_logo.pdf tuda_logo.svg; then
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
