# Maintainer: Trung Le (Kagamma) <kagamma(dot)km(at)gmail(dot)com>
# Maintainer: Michalis Kamburelis (michalis) <michalis@castle-engine.io>

pkgname=castle-engine-git
pkgver=v7.0.alpha.1.r16494.f39aec48a
pkgrel=1
pkgdesc="Cross-platform (desktop, mobile, console) 3D and 2D game engine using modern Object Pascal"
arch=(x86_64)
url="https://castle-engine.io/"
license=('LGPL with static linking exception')
depends=(gtk2 freetype2 openal libpng libvorbis mesa fpc lazarus)
makedepends=(git make fpc lazarus)
source=(git+https://github.com/castle-engine/castle-engine.git)
md5sums=('SKIP')

pkgver() {
          cd castle-engine
          printf "%s.r%s.%s" "$(git describe --abbrev=0 | sed 's/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
          # Build tools
          cd castle-engine
          make cleanall tools
          tools/build-tool/castle-engine --project tools/castle-editor compile
          make cleanall
}

package() {
          cd castle-engine
          # Prepare desktop file
          printf '[Desktop Entry]
Encoding=UTF-8
Type=Application
Icon=/usr/src/castle-engine/doc/pasdoc/logo/castle_game_engine_icon.png
Path=/usr/src/castle-engine
Exec=/usr/bin/castle-editor
Name=Castle Editor
GenericName=Castle Game Engine Editor
Category=Application;Development;GUIDesigner;Programming;
Categories=Application;Development;GUIDesigner;Programming;
Keywords=editor;pascal;fpc;design;castle;engine;' > castle-editor.desktop
          # Install binaries & desktop file
          install -Dm755 tools/build-tool/castle-engine "${pkgdir}/usr/bin/castle-engine"
          install -Dm755 tools/castle-editor/castle-editor "${pkgdir}/usr/bin/castle-editor"
          install -Dm755 tools/castle-curves/castle-curves "${pkgdir}/usr/bin/castle-curves"
          install -Dm755 tools/image-to-pascal/image-to-pascal "${pkgdir}/usr/bin/image-to-pascal"
          install -Dm755 tools/texture-font-to-pascal/texture-font-to-pascal "${pkgdir}/usr/bin/texture-font-to-pascal"
          install -Dm755 tools/to-data-uri/to-data-uri "${pkgdir}/usr/bin/to-data-uri"
          install -Dm755 castle-editor.desktop "${pkgdir}/usr/share/applications/castle-editor.desktop"
          # Cleanup
          rm -f tools/build-tool/castle-engine
          rm -f tools/castle-editor/castle-editor
          rm -f tools/castle-curves/castle-curves
          rm -f tools/image-to-pascal/image-to-pascal
          rm -f tools/texture-font-to-pascal/texture-font-to-pascal
          rm -f tools/to-data-uri/to-data-uri
          rm -f castle-editor.desktop
          rm -rf .git
          # Install the rest to /usr/src
          mkdir -p ${pkgdir}/usr/src
          cd ..
          mv castle-engine ${pkgdir}/usr/src/castle-engine
}
