# Maintainer: Alex3236 <me@alex3236.moe>

pkgname=pineapple-notepad-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="A Qt 6, KDE Framework and Scintilla-based Cross-Platform Notepad++ Alternative"
arch=('x86_64')
url="https://github.com/BLumia/pineapple-notepad"
license=('custom:Pineapple Notepad EULA')
depends=(
    'gcc-libs'
    'glibc'
    'kcodecs'
    'kcolorscheme'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'ki18n'
    'kiconthemes'
    'kwidgetsaddons'
    'kxmlgui'
    'qt6-5compat'
    'qt6-base'
)
makedepends=('patchelf')
optdepends=('breeze: Breeze widget style for Qt (recommended for best experience)')
provides=('pineapple-notepad')
conflicts=('pineapple-notepad')
source=("${pkgname}-${pkgver}.deb::https://github.com/BLumia/pineapple-notepad/releases/download/${pkgver}-freeware/pineapple-notepad-debian-trixie-x86_64-${pkgver}.deb")
sha256sums=('31a6ca692d1ffb51bf6bf971665d61ea59cb979ec88d653c2cbacf974c77dbaa')

package() {
    cd "$srcdir"

    ar x "${pkgname}-${pkgver}.deb"
    tar xzf data.tar.gz

    install -Dm755 usr/bin/pnotepad "$pkgdir/usr/bin/pnotepad"

    install -dm755 "$pkgdir/usr/lib/pineapple-notepad"
    install -m755 usr/lib/x86_64-linux-gnu/liblexilla.so "$pkgdir/usr/lib/pineapple-notepad/liblexilla.so"
    install -m755 usr/lib/x86_64-linux-gnu/libscintilla-qt.so "$pkgdir/usr/lib/pineapple-notepad/libscintilla-qt.so"

    patchelf --set-rpath '$ORIGIN/../lib/pineapple-notepad' "$pkgdir/usr/bin/pnotepad"

    install -Dm644 usr/share/applications/net.blumia.pineapple-notepad.desktop "$pkgdir/usr/share/applications/net.blumia.pineapple-notepad.desktop"
    install -Dm644 usr/share/icons/hicolor/scalable/apps/net.blumia.pineapple-notepad.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/net.blumia.pineapple-notepad.svg"
    install -Dm644 usr/share/metainfo/net.blumia.pineapple-notepad.metainfo.xml "$pkgdir/usr/share/metainfo/net.blumia.pineapple-notepad.metainfo.xml"

    for lang_dir in usr/share/locale/*/; do
        lang=$(basename "$lang_dir")
        install -Dm644 "usr/share/locale/${lang}/LC_MESSAGES/pineapple-notepad.mo" \
            "$pkgdir/usr/share/locale/${lang}/LC_MESSAGES/pineapple-notepad.mo"
    done

    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << 'LICENSE_EOF'
Pineapple Notepad - End User License Agreement

LICENSE GRANT

Gary "BLumia" Wang ("Licensor") grants you ("Licensee") a non-exclusive, non-transferable,
royalty-free license to install and use Pineapple Notepad ("Software") for both personal
and commercial purposes. You may use this software within your business, for-profit projects,
or professional services.

RESTRICTIONS

* No Resale: You may not sell, rent, lease, sublicense, or distribute the Software for money,
  nor may you bundle the Software with other products or services for sale.
* No Modification: You may not modify, reverse engineer, decompile, or disassemble the Software.
* No Rebranding: You may not remove any copyright notices, branding, or logos from the Software.

OWNERSHIP

The Software is licensed, not sold. The Licensor retains all title, copyright, and other
intellectual property rights in the Software.

DISCLAIMER OF WARRANTY

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND
NON-INFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES, OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT, OR OTHERWISE, ARISING
FROM, OUT OF, OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

TERMINATION

This license is effective until terminated. Your rights under this license will terminate
automatically without notice from the Licensor if you fail to comply with any term(s) of
this license.
LICENSE_EOF
}
