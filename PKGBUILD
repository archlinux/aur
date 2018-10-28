# Maintainer: Geoffrey Frogeye <geoffrey@frogeye.fr>

pkgname=sheepit-client-git
pkgver=5.0.0r325.cc2dacb
pkgrel=1
pkgdesc="Client for the free and distributed render farm"
arch=('i686' 'x86_64')
url="https://www.sheepit-renderfarm.com/"
license=('GPL')
depends=('java-runtime' 'freetype2' 'glew')
makedepends=('git' 'apache-ant')
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
        printf "%sr%s.%s" "$(grep 'name="compile.release"' build.xml | cut -d '"' -f 4)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd "$srcdir/${pkgname%-git}"
        ant
}

package() {
        install -Dm644 "${srcdir}/${pkgname%-git}/bin/sheepit-client.jar" "${pkgdir}/usr/share/java/sheepit-client/sheepit-client.jar"
        install -Dm755 "${srcdir}/sheepit-client.sh" "${pkgdir}/usr/bin/sheepit-client"
        install -Dm644 "${srcdir}/sheepit-client.sysusers" "${pkgdir}/usr/lib/sysusers.d/sheepit-client.conf"
        install -Dm644 "${srcdir}/sheepit-client.conf" "${pkgdir}/etc/conf.d/sheepit-client"
        install -Dm644 "${srcdir}/sheepit-client.service" "${pkgdir}/usr/lib/systemd/system/sheepit-client.service"
}

