# Maintainer: Visne <visne2 at proton dot me>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Alexandre Moine <alexandre@moine.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: |AhIoRoS| < ahioros@gmail.com >

pkgname=tuxguitar
pkgver=2.0.0
pkgrel=1
pkgdesc='A multitrack guitar tablature editor and player'
arch=('x86_64' 'aarch64')
url='https://www.tuxguitar.app/'
license=('LGPL-3.0-or-later')
depends=('java-runtime>=9' 'gtk3' 'alsa-lib')
makedepends=('gzip' 'java-environment>=9' 'maven' 'fluidsynth' 'jack' 'lv2' 'suil' 'lilv' 'qt5-base')
optdepends=('fluidsynth: FluidSynth plugin support'
            'lv2: LV2 plugin support'
            'suil: LV2 plugin support'
            'lilv: LV2 plugin support'
            'qt5-base: LV2 plugin support'
            'jack: Jack plugin support'
            'lilypond: Compile exported LilyPond files')
replaces=('tuxguitar-common' 'tuxguitar-gtk2')
source=("tuxguitar-$pkgver.zip::https://github.com/helge17/tuxguitar/archive/refs/tags/$pkgver.zip")
source_x86_64=("https://archive.eclipse.org/eclipse/downloads/drops4/R-4.26-202211231800/swt-4.26-gtk-linux-x86_64.zip")
source_aarch64=("https://archive.eclipse.org/eclipse/downloads/drops4/R-4.26-202211231800/swt-4.26-gtk-linux-aarch64.zip")
sha256sums=('4551ba67ebe022dfe75fde0e5fdc1f2b87a4444a3b5613de4d44593bffaf6283')
sha256sums_x86_64=('fac4cb43891114d56fae2771f3d03759befac05c4777c190662ce24386d332e2')
sha256sums_aarch64=('e5deda6315ccee51b6cd907af936adc0f861cf35cf444f812d8c7a6d1bf707e8')

prepare() {
    export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"

    # Install SWT manually (see https://github.com/helge17/tuxguitar/blob/2.0.0/INSTALL.md#download-and-install-swt-for-linux)
    mvn install:install-file -Dfile=swt.jar -DgroupId=org.eclipse.swt -DartifactId=org.eclipse.swt.gtk.linux -Dpackaging=jar -Dversion=4.36

    # Change build version from 9.99-SNAPSHOT to $pkgver in config files (see https://github.com/helge17/tuxguitar/blob/2.0.0/misc/build_tuxguitar_from_source.sh#L225)
    find . \( -name "*.xml" -or -name "*.gradle"  -or -name "*.properties" -or -name "*.html" -or -name control -or -name Info.plist -or -name CHANGES \) -and -not -path "./website/*" -and -type f -exec sed -i -e "s/9.99-SNAPSHOT/$pkgver/" '{}' \;
}

build() {
    cd tuxguitar-$pkgver/desktop/build-scripts/tuxguitar-linux-swt

    export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"

    mvn -e clean verify -P native-modules
}

package() {
    cd "$srcdir/tuxguitar-$pkgver/desktop/build-scripts/tuxguitar-linux-swt/target/tuxguitar-$pkgver-linux-swt"

    # Man page has to be gzipped first
    gzip share/man/man1/tuxguitar.1

    # Install all files
    mkdir -p "$pkgdir/opt/tuxguitar"
    cp -a * "$pkgdir/opt/tuxguitar"

    # Set up symlinks
    cd "$pkgdir"

    mkdir -p usr/bin
    mkdir -p usr/share/{applications,man/man1,mime/packages,pixmaps}

    ln -s /opt/tuxguitar/tuxguitar.sh usr/bin/tuxguitar
    ln -s /opt/tuxguitar/share/applications/tuxguitar.desktop usr/share/applications/
    ln -s /opt/tuxguitar/share/mime/packages/tuxguitar.xml usr/share/mime/packages/
    ln -s /opt/tuxguitar/share/pixmaps/tuxguitar.png usr/share/pixmaps/
    ln -s /opt/tuxguitar/share/man/man1/tuxguitar.1.gz usr/share/man/man1/tuxguitar.1.gz
}
