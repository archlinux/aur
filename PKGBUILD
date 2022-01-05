# Maintainer: everyx <lunt.luo#gmail.com>

pkgname=wepush
pkgdesc="专注批量推送的小而美的工具"
pkgver=4.4.0
pkgrel=2
arch=('x86_64' 'i686')
url="https://rememberber.github.io/WePush/"
license=('MIT')
depends=("java-runtime")
makedepends=('maven' 'imagemagick')

_appname="WePush"
_icon="wepush.png"
_targetjar="WePush-1.0.jar"
_sourcecode="wepush-src-${pkgver}.tar.gz"
source=("${_sourcecode}::https://github.com/rememberber/${_appname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7bd0b2a6b5f44e63614ccf7d76bd75c39b48aebd49328c09b984115aa5bf28f1')

prepare() {
    cat > "${pkgname}" <<EOF
#!/usr/bin/env bash
exec java -jar /usr/share/${pkgname}/${_targetjar} "\$@"
EOF
    gendesk \
        --pkgname "${pkgname}" \
        --pkgdesc "${pkgdesc}" \
        --name "${_appname}" \
        --categories "Network;Office;Utility" \
        -n \
        -f
}

build() {
    cd "${srcdir}/${_appname}-${pkgver}" || return

    mvn -Djava.net.useSystemProxies=true clean

    mvn -q install:install-file -Dfile=./lib/cpdetector_1.0.10.jar -DgroupId=net.sourceforge.cpdetector -DartifactId=cpdetector -Dversion=1.0.10 -Dpackaging=jar
    mvn -q install:install-file -Dfile=./lib/antlr-2.7.4.jar -DgroupId=net.sourceforge.cpdetector -DartifactId=antlr -Dversion=2.7.4 -Dpackaging=jar
    mvn -q install:install-file -Dfile=./lib/chardet-1.0.jar -DgroupId=net.sourceforge.cpdetector -DartifactId=chardet -Dversion=1.0.0 -Dpackaging=jar
	mvn -q install:install-file -Dfile=./lib/jargs-1.0.jar -DgroupId=net.sourceforge.cpdetector -DartifactId=jargs -Dversion=1.0.0 -Dpackaging=jar
	mvn -q install:install-file -Dfile=./src/main/lib/taobao-sdk-java-auto.jar -DgroupId=com.taobao -DartifactId=top-auto-sdk -Dversion=1.0.0 -Dpackaging=jar
	
    # fix Lombok compatible with JDK 16
    # https://github.com/projectlombok/lombok/issues/2681#issuecomment-772207925
    export _JAVA_OPTIONS="--add-opens=jdk.compiler/com.sun.tools.javac.code=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.comp=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.file=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.main=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.model=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.parser=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.processing=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.tree=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.util=ALL-UNNAMED \
        --add-opens=jdk.compiler/com.sun.tools.javac.jvm=ALL-UNNAMED"
    mvn -q -Djava.net.useSystemProxies=true package
}


package() {
    mkdir -p "${pkgdir}/usr/share"

    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/" "${srcdir}/${_appname}-${pkgver}/target/${_targetjar}"
    install -Dm644 -t "${pkgdir}/usr/share/${pkgname}/lib" "${srcdir}/${_appname}-${pkgver}"/target/lib/*
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname}.desktop"
    install -Dm755 -t "${pkgdir}/usr/bin/" "${pkgname}"

	_iconpath="${srcdir}/${_appname}-${pkgver}/src/main/resources/icon/logo-1024.png"
	for _size in "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"; do
    	install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    	convert "${_iconpath}" -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/${pkgname}.png"
  	done
}