# Maintainer: Dan Ginovker <danielginovker@gmail.com>

pkgname=2009scape-git
pkgver=r23.702984b
pkgrel=1
pkgdesc="Authentic, Open Source 2009 Runescape Era Game (Launcher) (Git Version)"
arch=(any)
license=('GPL')
url="https://gitlab.com/2009scape/09launcher"
depends=('java-runtime>=8' 'bash')
makedepends=('git' 'bash')
provides=("2009scape")
conflicts=("2009scape")
source=("git+${url}.git"
    2009scape.desktop
    2009scape.png)
sha256sums=('SKIP'
    '5cc8ac0dc8a31562745c96fde13ec71572a4adac61ab37225261f5815fe84d95'
    'da472600b4cc81d8985e91518425a6c571d4b401af094ae7e3573de9c71fa8c1')

pkgver() {
    cd "${srcdir}/09launcher/"

    # Modified from the "If there are no tags then use number of revisions since beginning of the history" section of "https://wiki.archlinux.org/title/VCS_package_guidelines"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/09launcher/"

    sh gradlew jar
}

package() {
    client_jar=$(find "${srcdir}/09launcher/build/libs" -type f -name *.jar)
    
    install -D -m644 \
        "${client_jar}" \
        "${pkgdir}/usr/share/2009scape/2009scape.jar"

    install -D -m644 \
        "${srcdir}/2009scape.desktop" \
        "${pkgdir}/usr/share/applications/2009scape.desktop"

    install -D -m644 \
        "${srcdir}/2009scape.png" \
        "${pkgdir}/usr/share/pixmaps/2009scape.png"

    install -D -m755 \
        "/dev/null" \
        "${pkgdir}/usr/bin/2009scape"

    echo '#!/bin/sh' > "${pkgdir}/usr/bin/2009scape"
    echo 'exec java -jar /usr/share/2009scape/2009scape.jar "$@"' >> "${pkgdir}/usr/bin/2009scape"
}
