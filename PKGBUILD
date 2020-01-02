# Maintainer: Geoffrey Frogeye <geoffrey+aur@frogeye.fr>

pkgname=sheepit-client-git
pkgver=5.1678.3038r381.2a8f324
pkgrel=1
pkgdesc="Client for the free and distributed render farm"
arch=('i686' 'x86_64')
url="https://www.sheepit-renderfarm.com/"
license=('GPL')
depends=('java-runtime' 'freetype2' 'glew' 'libxrender')
makedepends=('git' 'gradle4')
optdepends=('cuda: CUDA GPU rendering (not in service mode)' 'blender: Create 3D scenes to render')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=sheepit-client.install
backup=('etc/conf.d/sheepit-client')
source=('git://github.com/laurent-clouet/sheepit-client.git#branch=master'
        'sheepit-client.sh'
        'sheepit-client.sysusers'
        'sheepit-client.conf'
        'sheepit-client.service')
md5sums=('SKIP'
         'a30b3ba1c40b2063ccab54b65a7b8e09'
         '0c61cd94f631e9480cd1aec5377f57ab'
         '30e9d9e679a8b22d9c5efbf64c14743c'
         'e051e06111c73777914dffee61b43afc')

pkgver() {
        cd "$srcdir/${pkgname%-git}"
        printf "%sr%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/${pkgname%-git}"
        gradle4 shadowJar
}

package() {
        install -Dm644 "${srcdir}/${pkgname%-git}/build/libs/sheepit-client-all.jar" "${pkgdir}/usr/share/java/sheepit-client/sheepit-client.jar"
        install -Dm755 "${srcdir}/sheepit-client.sh" "${pkgdir}/usr/bin/sheepit-client"
        install -Dm644 "${srcdir}/sheepit-client.sysusers" "${pkgdir}/usr/lib/sysusers.d/sheepit-client.conf"
        install -Dm644 "${srcdir}/sheepit-client.conf" "${pkgdir}/etc/conf.d/sheepit-client"
        install -Dm644 "${srcdir}/sheepit-client.service" "${pkgdir}/usr/lib/systemd/system/sheepit-client.service"
}

