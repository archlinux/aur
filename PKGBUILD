# Maintainer: Visne <visne2 at proton dot me>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Alexandre Moine <alexandre@moine.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: |AhIoRoS| < ahioros@gmail.com >

pkgname=tuxguitar
pkgver=1.6.3
pkgrel=1
pkgdesc='A multitrack guitar tablature editor and player'
arch=('x86_64' 'aarch64')
url='https://www.tuxguitar.app/'
license=('LGPL-3.0-or-later')
depends=('java-runtime' 'gtk3' 'alsa-lib')
makedepends=('gzip' 'java-environment' 'maven' 'fluidsynth' 'jack' 'lv2' 'suil' 'lilv' 'qt5-base')
optdepends=('fluidsynth: FluidSynth plugin support'
            'lv2: LV2 plugin support'
            'suil: LV2 plugin support'
            'lilv: LV2 plugin support'
            'qt5-base: LV2 plugin support'
            'jack: Jack plugin support'
            'lilypond: Compile exported LilyPond files')
replaces=('tuxguitar-common' 'tuxguitar-gtk2')
source=("tuxguitar-$pkgver.zip::https://github.com/helge17/tuxguitar/archive/refs/tags/$pkgver.zip")
source_x86_64=("https://archive.eclipse.org/eclipse/downloads/drops4/R-4.21-202109060500/swt-4.21-gtk-linux-x86_64.zip")
source_aarch64=("https://archive.eclipse.org/eclipse/downloads/drops4/R-4.21-202109060500/swt-4.21-gtk-linux-aarch64.zip")
sha256sums=('5a0855ea63e32773670dc7bc85ae4e76c055c8afd12016307e60d02135fde62c')
sha256sums_x86_64=('3e35a4ababf504bcf64df864e4a957aaa2f0dec9696a922d936c7ee224fa4c5f')
sha256sums_aarch64=('6d0e8d28eebe051710bc379d86a1ff8141aadcac633be0e02ce0a1eaab01a144')

prepare() {
    export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"

    # Install SWT manually (see https://github.com/helge17/tuxguitar/blob/1.6.3/INSTALL.md#download-and-install-swt-for-linux)
    mvn install:install-file -Dfile=swt.jar -DgroupId=org.eclipse.swt -DartifactId=org.eclipse.swt.gtk.linux -Dpackaging=jar -Dversion=4.21
}

build() {
    cd tuxguitar-$pkgver/desktop/build-scripts/tuxguitar-linux-swt

    export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"

    mvn -e clean verify -P native-modules
}

package() {
    cd "$srcdir/tuxguitar-$pkgver/desktop/build-scripts/tuxguitar-linux-swt/target/tuxguitar-9.99-SNAPSHOT-linux-swt"

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
    ln -s /opt/tuxguitar/share/pixmaps/tuxguitar.xpm usr/share/pixmaps/
    ln -s /opt/tuxguitar/share/man/man1/tuxguitar.1.gz usr/share/man/man1/tuxguitar.1.gz
}
