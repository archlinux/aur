# Maintainer: Philipp Wagner <philipp@wagnersnetz.de>
pkgname=kst4contest-git
pkgver=1.50.0.r324.g8c0709a3
pkgrel=1
pkgdesc="ON4KST Chat Client for VHF/UHF contest operation (git)"
arch=('x86_64')
url="https://github.com/praktimarc/kst4contest"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good')
makedepends=('java-environment=21' 'gradle' 'git')
provides=('kst4contest')
conflicts=('kst4contest' 'kst4contest-bin')
source=("kst4contest::git+https://github.com/praktimarc/kst4contest.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/kst4contest"
    BASE=$(grep -m1 '^version=' gradle.properties \
        | cut -d= -f2 | sed 's/[-.]nightly//')
    printf '%s.r%s.g%s' "${BASE}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/kst4contest"

    export JAVA_HOME=$(find /usr/lib/jvm -maxdepth 1 -name 'java-21-*' -type d | head -n 1)
    export PATH="${JAVA_HOME}/bin:${PATH}"

    ./gradlew --offline -S :app-desktop:createDistributable

    # package() reads dist/KST4Contest. Application name, icon and the JDK
    # module list come from app-desktop/build.gradle.kts.
    rm -rf dist
    mkdir -p dist
    cp -a app-desktop/build/compose/binaries/main/app/KST4Contest dist/
}

package() {
    cd "${srcdir}/kst4contest"

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
