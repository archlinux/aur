# Contributer: Dan McCurry <dan.mc at protonmail dot com>
# Contributer: Nikola Milinković <nikmil@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

# If an unsupported java environment is set using archlinux-java,
# uncomment/edit the appropriate line in /usr/bin/jabref after
# installation.

pkgname=jabref-git
pkgver=5.15.r674.de81430c14
pkgrel=1
epoch=3
pkgdesc="GUI frontend for BibTeX, written in Java -- built from git"
arch=('x86_64')
url="https://www.jabref.org"
license=('MIT')
depends=('java-runtime=21' 'xdg-user-dirs' 'gtk3>=3.8' 'alsa-lib')
makedepends=('git' 'java-environment=21' 'archlinux-java-run'  'gradle') 
optdepends=('gsettings-desktop-schemas: For web search support' 'python: browser extension')
provides=('jabref')
conflicts=('jabref')
source=("git+https://github.com/JabRef/jabref.git" 
    "git+https://github.com/JabRef/abbrv.jabref.org.git"
    "git+https://github.com/citation-style-language/styles.git"
    "git+https://github.com/citation-style-language/locales.git"
	"${pkgname%-git}.desktop"
	"${pkgname%-git}.sh")
sha256sums=('SKIP'
    'SKIP'
    'SKIP'
    'SKIP'
    'cb50a38f701374e6922e74e35c4f99f0418441c48b3c4855e64f0995f0be9cb8'
    'b5936f54b1fd806687171bef46b5be3fa247289e7c63352b448c0922072edcdf')

prepare() {
    cd ${pkgname%-git}
    git submodule init
    git config submodule.abbrv.jabref.org.url "${srcdir}/abbrv.jabref.org"
    git config submodule.csl-styles.url "${srcdir}/styles"
    git config submodule.csl-locales.url "${srcdir}/locales"
    git -c protocol.file.allow=always submodule init
}

pkgver() {
    cd ${pkgname%-git}
    printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    # Due to a jlink bug you need at least JDK 21.0.1 to compile JabRef
    cd ${pkgname%-git}
    export JAVA_HOME=$(archlinux-java-run --java-home --min 21 --max 21)
    [[ -d "$srcdir"/gradle ]] && install -d "$srcdir"/gradle
    export GRADLE_USER_HOME="$srcdir"/gradle
    export DEFAULT_JVM_OPTS='"-Xmx1g" "-Xms64m"'
    /usr/bin/gradle --no-daemon -PprojVersion="${pkgver}" \
        -PprojVersionInfo="${pkgver}--ArchLinux--${pkgrel}" assemble
    /usr/bin/gradle --no-daemon -PprojVersion="${pkgver}" \
        -PprojVersionInfo="${pkgver}--ArchLinux--${pkgrel}" jlink 
}

package() {
    install -Dm755 jabref.sh "${pkgdir}"/usr/bin/JabRef
    install -Dm644 jabref.desktop \
	    "${pkgdir}"/usr/share/applications/${pkgname}.desktop

    cd ${pkgname%-git}
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 src/main/resources/icons/jabref.svg \
	    "${pkgdir}"/usr/share/pixmaps/jabref.svg

    ln -sf /usr/bin/JabRef "${pkgdir}"/usr/bin/jabref

    install -d "${pkgdir}/opt"
    cp -R build/image "${pkgdir}"/opt/${pkgname}
}
