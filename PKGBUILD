# Maintainer: Markus

pkgname=tuxguitar-src
_pkgname=tuxguitar
pkgver=2.1.0
pkgrel=1
pkgdesc='Multitrack guitar tablature editor and player'
arch=('x86_64' 'aarch64')
url='https://github.com/helge17/tuxguitar'
license=('LGPL-2.1-or-later')
depends=('alsa-lib' 'gtk3' 'java-runtime>=17' 'webkit2gtk-4.1')
makedepends=('fluidsynth' 'jack' 'java-environment>=17' 'lilv'
             'lv2' 'maven' 'qt5-base' 'suil')
optdepends=('fluidsynth: FluidSynth synthesizer support'
            'jack: JACK MIDI support'
            'lilv: LV2 synthesizer support'
            'lv2: LV2 synthesizer support'
            'qt5-base: graphical interfaces for LV2 plugins'
            'suil: graphical interfaces for LV2 plugins'
            'lilypond: compile exported LilyPond files')
provides=('tuxguitar')
conflicts=('tuxguitar')
options=('!debug')
source=("${_pkgname}-${pkgver}.zip::https://github.com/helge17/tuxguitar/archive/refs/tags/${pkgver}.zip")
source_x86_64=('swt-4.37-gtk-linux-x86_64.zip::https://download.eclipse.org/eclipse/downloads/drops4/R-4.37-202509050730/swt-4.37-gtk-linux-x86_64.zip')
source_aarch64=('swt-4.37-gtk-linux-aarch64.zip::https://download.eclipse.org/eclipse/downloads/drops4/R-4.37-202509050730/swt-4.37-gtk-linux-aarch64.zip')
sha256sums=('370244eae7976b9505577ab869e39bed765d68a4feede29ac45f32e7e41738af')
sha256sums_x86_64=('13ff4f7061078c03e17a2ace3c47931bca34cd5ad17494ee8cfc46780bb057db')
sha256sums_aarch64=('e41352cee8753c3afc72c5198abf1397779529557752b276f8bd05c1f0054ae4')

_mvn() {
  mvn --batch-mode --no-transfer-progress -Duser.home="$srcdir" "$@"
}

prepare() {
  # SWT's Linux artifact is not published to Maven Central.
  _mvn install:install-file \
    -Dfile="$srcdir/swt.jar" \
    -DgroupId=org.eclipse.swt \
    -DartifactId=org.eclipse.swt.gtk.linux \
    -Dpackaging=jar \
    -Dversion=4.37

  # Upstream keeps development builds at 9.99-SNAPSHOT and replaces the
  # placeholder while producing releases.
  find "$srcdir/${_pkgname}-${pkgver}" \
    \( -name '*.xml' -o -name '*.gradle' -o -name '*.properties' \
       -o -name '*.html' -o -name control -o -name Info.plist \
       -o -name CHANGES \) \
    -type f -not -path '*/website/*' \
    -exec sed -i "s/9.99-SNAPSHOT/${pkgver}/g" {} +
}

build() {
  cd "${_pkgname}-${pkgver}/desktop/build-scripts/tuxguitar-linux-swt"

  _mvn -e clean verify -P native-modules
}

package() {
  local dist="$srcdir/${_pkgname}-${pkgver}/desktop/build-scripts/${_pkgname}-linux-swt/target/${_pkgname}-${pkgver}-linux-swt"

  install -d "$pkgdir/usr/lib/${_pkgname}"
  cp -a "$dist/." "$pkgdir/usr/lib/${_pkgname}/"

  # Install system integration files in their standard locations only.
  rm -r "$pkgdir/usr/lib/${_pkgname}/share/"{applications,man,metainfo,mime,pixmaps}

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/${_pkgname}/tuxguitar.sh" "$pkgdir/usr/bin/tuxguitar"

  install -Dm644 "$dist/share/applications/TuxGuitar.desktop" \
    "$pkgdir/usr/share/applications/TuxGuitar.desktop"
  install -Dm644 "$dist/share/man/man1/tuxguitar.1" \
    "$pkgdir/usr/share/man/man1/tuxguitar.1"
  install -Dm644 "$dist/share/metainfo/app.tuxguitar.tuxguitar.metainfo.xml" \
    "$pkgdir/usr/share/metainfo/app.tuxguitar.tuxguitar.metainfo.xml"
  install -Dm644 "$dist/share/mime/packages/tuxguitar.xml" \
    "$pkgdir/usr/share/mime/packages/tuxguitar.xml"
  install -Dm644 "$dist/share/pixmaps/tuxguitar.png" \
    "$pkgdir/usr/share/pixmaps/tuxguitar.png"
  install -Dm644 "$srcdir/${_pkgname}-${pkgver}/docs/LICENSE" \
    "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
