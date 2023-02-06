# Maintainer: Joaqim Planstedt <aur@joaqim.xyz>

# Check for new releases: https://github.com/allusion-app/Allusion/releases
# or use:
# $ curl -sL $(curl -s https://github.com/allusion-app/Allusion/releases | sed -n -e "s/^.*\(\/allusion-app\/Allusion\/releases\/download\/.*\/latest-linux.yml\)\".*/https:\/\/github.com\1/p" | head -n1)

#timestamp: 2023-02-05T23:24:12.146Z

pkgname=allusion-appimage
pkgver=1.0.0
pkgrel=19
pkgdesc="Allusion is a tool built for artists, aimed to help you organize your Visual Library – A single place that contains your entire collection of references, inspiration and any other kinds of images."
arch=('x86_64')
url='https://allusion-app.github.io'
license=('GNU')
makedepends=('curl' 'sed')
depends=('glibc' 'zlib' 'fuse2')
options=(!strip)
gittag=$(curl -s https://github.com/allusion-app/Allusion/releases | sed -n -e "s/^.*releases\/download\/v${pkgver}\(.*\)\/.*.AppImage\".*/\1/p" | head -n1)
gitver="${pkgver}${gittag}"
source_x86_64=("Allusion-${gitver}.AppImage::https://github.com/allusion-app/Allusion/releases/download/v${gitver}/Allusion-${gitver}.AppImage"
               "Allusion.desktop"
	       "Allusion.svg::https://raw.githubusercontent.com/allusion-app/Allusion/master/resources/logo/svg/full-color/allusion-logomark-fc.svg"
               "LICENSE::https://github.com/allusion-app/Allusion/raw/master/LICENSE"
               )
noextract=("Allusion-${gitver}.AppImage")
sha256sums_x86_64=('e5b0508e36f6becdfeb35afbf863925506d105cf1ec968d0140948dff99487f9'
                   '2c732763e801c2d16fdb666a961e6ce53323a863552fc8e6746e125fbdfb3ec6'
                   'fdaccc7f6521f98b22b31b5996f65929b33068b86aaacd6ec00727b1a5fee2fa'
                   '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')

package() {

    # Install AppImage
    install -Dm755 "${srcdir}/Allusion-${gitver}.AppImage" "${pkgdir}/opt/${pkgname}/Allusion-${pkgver}.AppImage"

    # Install the icon and desktop file
    install -D -m644 "Allusion.svg"  "${pkgdir}/usr/share/pixmaps/Allusion.svg"
    install -D -m644 "Allusion.desktop" "${pkgdir}/usr/share/applications/Allusion.desktop"

    # Install the license file
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    # Symlink executable
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/Allusion-${pkgver}.AppImage" "${pkgdir}/usr/bin/allusion"
}
