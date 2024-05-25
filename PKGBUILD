# Maintainer: Fox <fox-aur at riseup dot net>

# Two-stage download because itch.io is dumb...
_file_id='10439175' # Update on every version change, check page source
_request_base='https://themirrorgdp.itch.io/the-mirror/file'
_src_url=$( # We need to fetch the temporary download URL via a POST request
    curl -s -X POST \
        -H 'Content-Type: application/json' \
        "${_request_base}/${_file_id}" \
    | jq -r '.url'
)

pkgname=the-mirror-bin
pkgver=6.1.101
pkgrel=1
pkgdesc='Open-source Roblox & UEFN alternative built on Godot and NestJS'
arch=('x86_64')
url='https://www.themirror.space'
license=('MIT' 'CC-BY-4.0')
depends=('vulkan-driver' 'vulkan-icd-loader')
makedepends=('curl' 'jq')
provides=('the-mirror')
source=("${pkgname}-${pkgver}.zip::${_src_url}"
        'the-mirror.png'
        'the-mirror-launcher.sh'
        'the-mirror.desktop'
        'LICENSE')
sha256sums=('0d0e12883c6d80c6f3ed82704049421b4cb9221c81e42695edfd22ef09fe7300'
            '05de3efaf859c7630a881121b590e06377d36ac93306adb063849e4fade7bda3' 
            '316ba2e5d51061b69d30e0735ee7db66f34f206d95bba90ba1ffa1a8b26a8b66'
            '004e17eb2a2d24e49e79b865c2794793fac986e2c61b097b18e63356b3a5df33'
            '43edd49d6eb05ccf8f2a1ae3bae8fc57f5cd37d0743109ef86f64c868b039776')

package() {
    # Copy build files
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 'the-mirror.png' "${pkgdir}/usr/share/pixmaps/the-mirror.png" 
    install -Dm755 'The Mirror Dev.x86_64' "${pkgdir}/usr/share/the-mirror/the-mirror" 
    install -Dm644 'The Mirror Dev.pck' "${pkgdir}/usr/share/the-mirror/the-mirror.pck" 
    install -Dm644 'the-mirror.desktop' "${pkgdir}/usr/share/applications/the-mirror.desktop"
    install -Dm755 'the-mirror-launcher.sh' "${pkgdir}/usr/share/the-mirror/the-mirror-launcher.sh"

    # Symlink to our launcher by default to avoid missing pck error when launching from terminal
    mkdir -p "${pkgdir}/usr/bin/"
    ln -s "/usr/share/the-mirror/the-mirror-launcher.sh" "${pkgdir}/usr/bin/the-mirror"
}
