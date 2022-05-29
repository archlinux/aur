# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=taup-git
pkgver=2.6.0.r9.ff98c73
pkgrel=1
pkgdesc="A seismic travel time calculator."
arch=(any)
url="https://github.com/crotwell/TauP"
license=('LGPL3')
depends=('java-runtime=8' 'java-atk-wrapper-openjdk=8')
makedepends=('git' 'java-environment=8' 'gradle')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
        "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '8af69c98ac6180f4b2632d37936004c79d9153a775f94c67585962ec85f63a4e')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    export JAVA_HOME="/usr/lib/jvm/java-8-openjdk"
	sh ./gradlew eB
}

package() {
	cd "$srcdir/${pkgname%-git}"
    rm build/explode/bin/*.bat
    install -D -t "${pkgdir}/opt/${pkgname%-git}/bin" \
        -m 755 build/explode/bin/taup*
    install -D -t "${pkgdir}/opt/${pkgname%-git}/lib" \
        -m 644 build/explode/lib/*.jar
    install -d "${pkgdir}/usr/share/doc"
    cp -r docs "${pkgdir}/usr/share/doc/${pkgname%-git}"
    cp -r build.gradle.kts \
        gradle \
        gradlew \
        groovy \
        jacl \
        native \
        README.md \
        settings.gradle.kts \
        src \
        "${pkgdir}/opt/${pkgname%-git}/"
    install -D -t "${pkgdir}/etc/profile.d/" \
        -m 755 "${srcdir}/${pkgname%-git}.sh"
    install -D -t "${pkgdir}/usr/share/licenses/${pkgname%-git}/" \
        -m 644 LICENSE
        
}
# vim:set ts=4 sw=4 et:
