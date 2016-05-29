# Maintainer: Geoffrey Frogeye <geoffrey@frogeye.fr>

pkgname=sheepit-client-git
pkgver=3.3.2r200.358ec13
pkgrel=1
pkgdesc="Client for the free and distributed render farm"
arch=('i686' 'x86_64')
url="https://www.sheepit-renderfarm.com/"
license=('GPL')
depends=('java-runtime' 'freetype2' 'glew')
makedepends=('git' 'apache-ant')
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
         'ade86db2b906f3468e014b28ebdd36d6'
         '7ffbac5dffd3ffcf04ffba3c0c1f5bd2'
         'de9bc913315eee47c88b119e49279771')

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

