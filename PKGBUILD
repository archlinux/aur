# Maintainer: Visne <visne2 at proton dot me>
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Thanos Apostolou <thanosapostolou@outlook.com>
# Contributor: Alexandre Moine <alexandre@moine.me>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: |AhIoRoS| < ahioros@gmail.com >

pkgname=tuxguitar
pkgver=1.6.2
pkgrel=3
pkgdesc='A multitrack guitar tablature editor and player'
arch=('x86_64')
url='https://www.tuxguitar.app/'
license=('LGPL-3.0-or-later')
depends=('java-runtime' 'gtk3' 'alsa-lib')
makedepends=('unzip' 'gzip' 'wget' 'java-environment' 'maven' 'fluidsynth' 'jack' 'lv2' 'suil' 'lilv' 'qt5-base')
optdepends=('fluidsynth: FluidSynth plugin support'
            'lv2: LV2 plugin support'
            'suil: LV2 plugin support'
            'lilv: LV2 plugin support'
            'qt5-base: LV2 plugin support'
            'jack: Jack plugin support'
            'lilypond: Compile exported LilyPond files')
replaces=('tuxguitar-common' 'tuxguitar-gtk2')
source=("tuxguitar-$pkgver::https://github.com/helge17/tuxguitar/archive/refs/tags/$pkgver.zip")
sha256sums=('d0d8e8f64240379e8fc8f83dcdfd220f9c105dcc2879b56f6f1c3ad4ce256a11')

prepare() {
    cd tuxguitar-$pkgver

    export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"

    # Install SWT manually (see https://github.com/helge17/tuxguitar/blob/1.6.2/INSTALL.md#download-and-install-swt-for-linux)
    mkdir swt && cd swt
    wget https://archive.eclipse.org/eclipse/downloads/drops4/R-4.26-202211231800/swt-4.26-gtk-linux-x86_64.zip -O swt.zip
    unzip -o swt.zip
    # Lie about version to fix wayland bug https://github.com/helge17/tuxguitar/issues/323
    mvn install:install-file -Dfile=swt.jar -DgroupId=org.eclipse.swt -DartifactId=org.eclipse.swt.gtk.linux.x86_64 -Dpackaging=jar -Dversion=4.13
}

build() {
    cd tuxguitar-$pkgver/desktop/build-scripts/tuxguitar-linux-swt-x86_64

    export MAVEN_OPTS="$MAVEN_OPTS -Duser.home=$srcdir"

    mvn -e clean verify -P native-modules
}

package() {
    cd "$srcdir/tuxguitar-$pkgver/desktop/build-scripts/tuxguitar-linux-swt-x86_64/target/tuxguitar-SNAPSHOT-linux-swt-x86_64"

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
