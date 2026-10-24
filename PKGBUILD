# Maintainer: Philipp Wagner <philipp@wagnersnetz.de>
pkgname=kst4contest-git
pkgver=1.50.0.r366.gf165f7d3
pkgrel=1
pkgdesc="ON4KST Chat Client for VHF/UHF contest operation (git)"
arch=('x86_64')
url="https://github.com/HamRadioOnline/kst4contest"
license=('GPL-3.0-only')
depends=('gst-plugins-base' 'gst-plugins-good')
makedepends=('git')
provides=('kst4contest')
conflicts=('kst4contest' 'kst4contest-bin')
source=("kst4contest::git+https://github.com/HamRadioOnline/kst4contest.git")
sha256sums=('SKIP')

# The launcher is built with Temurin, not with the system JDK. Arch's openjdk links
# jpackage's launcher library against the shared libstdc++, and that build aborts
# with "pure virtual method called" (SIGABRT, core dump) in a static destructor when
# the application exits; Temurin links libstdc++ statically, like the CI packages.
# The _x86_64 arrays are deliberate: aur-publish.yml rewrites the plain sha256sums=
# line on every release and would drop a second entry there.
_temurin=21.0.13+9
source_x86_64=("https://github.com/adoptium/temurin21-binaries/releases/download/jdk-${_temurin/+/%2B}/OpenJDK21U-jdk_x64_linux_hotspot_${_temurin/+/_}.tar.gz")
sha256sums_x86_64=('d7f5d5cf865a2902b70ff549b97586a7d3f234e016f041ab447ea740c7d66d1c')

pkgver() {
    cd "${srcdir}/kst4contest"
    BASE=$(grep -m1 '^version=' gradle.properties \
        | cut -d= -f2 | sed 's/[-.]nightly//')
    printf '%s.r%s.g%s' "${BASE}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/kst4contest"

    export JAVA_HOME="${srcdir}/jdk-${_temurin}"
    export PATH="${JAVA_HOME}/bin:${PATH}"

    # A Gradle home inside $srcdir keeps the build independent of whatever the
    # builder's ~/.gradle happens to hold: with --offline against the personal
    # cache, every dependency added since the last local build broke the package.
    export GRADLE_USER_HOME="${srcdir}/gradle-home"

    # The Java toolchain, and with it jpackage, would otherwise pick any JDK 21 it
    # finds in /usr/lib/jvm, the system one included.
    ./gradlew --no-daemon -S \
        -Porg.gradle.java.installations.auto-detect=false \
        -Porg.gradle.java.installations.auto-download=false \
        -Porg.gradle.java.installations.paths="${JAVA_HOME}" \
        :app-desktop:createDistributable

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
