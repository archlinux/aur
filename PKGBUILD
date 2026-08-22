# Maintainer: Philipp Wagner <philipp@wagnersnetz.de>
pkgname=kst4contest
pkgver=1.42.0
pkgrel=1
pkgdesc="ON4KST Chat Client for VHF/UHF contest operation"
arch=('x86_64')
url="https://github.com/praktimarc/kst4contest"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good')
makedepends=('java-environment=21' 'maven')
provides=('kst4contest')
conflicts=('kst4contest-bin' 'kst4contest-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/praktimarc/kst4contest/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('bd396387b8de41aac706458d5ebf64140ab3e83b8a7c710b66aa802bd48e804e')

build() {
    cd "${srcdir}/kst4contest-${pkgver}"

    export JAVA_HOME=$(find /usr/lib/jvm -maxdepth 1 -name 'java-21-*' -type d | head -n 1)
    export PATH="${JAVA_HOME}/bin:${PATH}"

    mvn -B -DskipTests package dependency:copy-dependencies \
        -DincludeScope=runtime \
        -DoutputDirectory=target/dist-libs

    cp "$(ls -t target/praktiKST-*.jar | head -n 1)" target/dist-libs/app.jar

    mkdir -p dist
    # This PKGBUILD builds from a released source tarball, which may predate
    # packaging/AddModules.java. Older tarballs carry the same list in pom.xml,
    # which the build keeps in sync with module-info.java from v1.42.0 onwards.
    if [ -f packaging/AddModules.java ]; then
        ADD_MODULES="$(java packaging/AddModules.java)"
    else
        ADD_MODULES="$(sed -n 's:.*<addmodule>\(.*\)</addmodule>.*:\1:p' pom.xml | paste -sd,)"
    fi
    # Same story for the packaging icon: without --icon jpackage silently ships
    # its own Duke placeholder, but tarballs older than v1.42.0 have no icon to
    # point at, so only pass the flag when the file is actually there.
    ICON_ARGS=()
    if [ -f packaging/icons/kst4contest.png ]; then
        ICON_ARGS=(--icon packaging/icons/kst4contest.png)
    fi
    jpackage \
        --type app-image \
        --name KST4Contest \
        "${ICON_ARGS[@]}" \
        --input target/dist-libs \
        --main-jar app.jar \
        --main-class kst4contest.view.Kst4ContestApplication \
        --module-path target/dist-libs \
        --add-modules "$ADD_MODULES" \
        --dest dist
}

package() {
    cd "${srcdir}/kst4contest-${pkgver}"

    install -dm755 "${pkgdir}/usr/lib/KST4Contest"
    cp -a dist/KST4Contest/. "${pkgdir}/usr/lib/KST4Contest/"

    install -dm755 "${pkgdir}/usr/bin"
    printf '#!/bin/sh\nexec /usr/lib/KST4Contest/bin/KST4Contest "$@"\n' \
        > "${pkgdir}/usr/bin/KST4Contest"
    chmod 755 "${pkgdir}/usr/bin/KST4Contest"

    install -dm755 "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/KST4Contest.desktop" << 'EOF'
[Desktop Entry]
Type=Application
Name=KST4Contest
Comment=ON4KST Chat Client for VHF/UHF contest operation
Exec=KST4Contest
Icon=KST4Contest
Categories=Network;HamRadio;
Terminal=false
EOF

    if [[ -f "${pkgdir}/usr/lib/KST4Contest/lib/KST4Contest.png" ]]; then
        install -Dm644 "${pkgdir}/usr/lib/KST4Contest/lib/KST4Contest.png" \
            "${pkgdir}/usr/share/icons/hicolor/256x256/apps/KST4Contest.png"
    fi

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
