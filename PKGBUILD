# Maintainer: Joinsider <public@joinside.de>
pkgname=dhbw-next-git
pkgver=1.0.6.r0.gc1b5359
pkgrel=1
pkgdesc='DHBW Horb Studenten App - Desktop application for DHBW Stuttgart students'
arch=('x86_64' 'aarch64')
url='https://github.com/Joinsider/dhbw-next'
license=('GPL-3.0-or-later')
depends=('java-runtime>=21' 'hicolor-icon-theme' 'libsecret')
optdepends=(
    'gnome-keyring: Secret Service backend for GNOME'
    'kwallet: Secret Service backend for KDE Plasma'
)
makedepends=('java-environment=21' 'jdk21-openjdk' 'git')
provides=('dhbw-next')
conflicts=('dhbw-next')
source=("${pkgname%-git}::git+https://github.com/Joinsider/dhbw-next.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/${pkgname%-git}"
    chmod +x gradlew
}

build() {
    cd "${srcdir}/${pkgname%-git}"

    export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
    export PATH="${JAVA_HOME}/bin:${PATH}"

    # Build using the release distributable task
    ./gradlew :composeApp:createReleaseDistributable --no-daemon --stacktrace
}

package() {
    cd "${srcdir}/${pkgname%-git}"

    local app_dir="composeApp/build/compose/binaries/main-release/app/dhbw-next"
    local launcher_script="${app_dir}/bin/dhbw-next"

    if [ ! -f "${launcher_script}" ]; then
        echo "Error: Could not find generated application launcher."
        ls -R composeApp/build/compose/binaries/
        return 1
    fi

    # Install the entire directory structure into /usr/share/java/dhbw-next/
    install -d "${pkgdir}/usr/share/java/${pkgname%-git}/"
    cp -r "${app_dir}/." "${pkgdir}/usr/share/java/${pkgname%-git}/"

    # Create a wrapper script in /usr/bin
    install -d "${pkgdir}/usr/bin"
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname%-git}" <<'EOF'
#!/bin/bash
exec /usr/share/java/dhbw-next/bin/dhbw-next "$@"
EOF

    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=DHBW Horb Studenten App
Comment=${pkgdesc}
Exec=${pkgname%-git}
Icon=${pkgname%-git}
Categories=Education;Utility;
Terminal=false
StartupWMClass=de-joinside-dhbw-MainKt
EOF

    # Install icon
    if [ -f "composeApp/icon.png" ]; then
        install -Dm644 "composeApp/icon.png" \
            "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    fi

    # Install license
    if [ -f "LICENSE" ]; then
        install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
    fi
}
