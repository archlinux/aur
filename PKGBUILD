# Maintainer: Mohamed Feddad <mrf345@gmail.com>

pkgname=urbanterror-slim-git
pkgver=r2267.c8538130
pkgrel=1
pkgdesc="Improved Quake III Arena engine for Urban Terror with Vulkan support"
arch=('x86_64')
url="https://github.com/omg-urt/urbanterror-slim"
license=('GPL-2.0')
source=('git+https://github.com/omg-urt/urbanterror-slim'
        'urbanterror-slim.sh'
        'urbanterror-slim.desktop')
depends=('urbanterror')
makedepends=('make' 'gcc' 'curl' 'mesa' 'libxxf86dga' 'libxrandr' 'libxxf86vm' 'alsa-lib' 'sdl2')
provides=('urbanterror-slim')
sha256sums=('SKIP'
	    '20074330d1ec9280fb169ccfaf861e328d0116880cf75d1a37180bd0530a22fc'
	    'a3b0a91ad8ae37b9e6233742fd68a971e9f32217c9ff896c9e3c450661836de6')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname%-git}"
    make BUILD_SERVER=0 USE_RENDERER_DLOPEN=0 RENDERER_DEFAULT=vulkan
}

package() {
    cd "${srcdir}/${pkgname%-git}"
    chmod +x build/release-linux-x86_64/urbanterror-slim.x64
    install -Dm755 build/release-linux-x86_64/urbanterror-slim.x64 "$pkgdir/opt/urbanterror/urbanterror-slim"
    install -Dm644 "${srcdir}/urbanterror-slim.desktop" "${pkgdir}/usr/share/applications/urbanterror-slim.desktop"
    install -Dm755 "${srcdir}/urbanterror-slim.sh" "${pkgdir}/usr/bin/urbanterror-slim"
    install -Dm644 id-readme.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
