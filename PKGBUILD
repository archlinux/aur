# Maintainer: Geoffrey Frogeye <geoffrey+aur@frogeye.fr> 
# Maintainer: John Turner <jturner.usa+aur@gmail.com>

pkgname=sheepit-client-git
pkgver=6.2020.0
pkgrel=2
pkgdesc="Client for the free and distributed render farm"
arch=('i686' 'x86_64')
url="https://www.sheepit-renderfarm.com/"
license=('GPL')
depends=('java-runtime' 'freetype2' 'glew' 'libxrender' 'libxfixes' 'libxi' 'libxxf86vm')
makedepends=('git' 'gradle')
optdepends=('cuda: CUDA GPU rendering (not in service mode)' 'blender: Create 3D scenes to render')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
backup=('etc/conf.d/sheepit-client')
source=('git://github.com/laurent-clouet/sheepit-client.git#branch=master'
        'sheepit-client.sh'
        'sheepit-client.sysusers'
        'sheepit-client.conf'
        'sheepit-client.service')

sha256sums=('SKIP'
            '7e6b48f67f35556aaef7823d5e84b6841c46003b65b9a8c373d1cd14343068a4'
            '2ec4f41f996f149102403a0376da75bf6545a80883c595232aa27eedc2eb9803'
            '19924349046bc2801ed8532f37d388d6e0317cb5e46b7c13acb5c3069193177d'
            '22c9a9461a56e37971a8662308448188164f70caac7e328fc4c7c78a91772af4')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "%sr%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/sheepit-client"
        gradle shadowJar
}

package() {
        install -Dm644 "${srcdir}/sheepit-client/build/libs/sheepit-client.jar" "${pkgdir}/usr/share/java/sheepit-client/sheepit-client.jar"
        install -Dm755 "${srcdir}/sheepit-client.sh" "${pkgdir}/usr/bin/sheepit-client"
        install -Dm644 "${srcdir}/sheepit-client.sysusers" "${pkgdir}/usr/lib/sysusers.d/sheepit-client.conf"
        install -Dm644 "${srcdir}/sheepit-client.conf" "${pkgdir}/etc/conf.d/sheepit-client"
        install -Dm644 "${srcdir}/sheepit-client.service" "${pkgdir}/usr/lib/systemd/system/sheepit-client.service"
}

