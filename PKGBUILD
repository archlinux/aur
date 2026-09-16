# Maintainer: Alex3236 <me@alex3236.moe>

pkgname=gety-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="The local file search engine for you and your AI agents, made by Listary team"
arch=('x86_64')
url="https://gety.ai/"
license=('LicenseRef-Gety-ToS')
depends=(
    'cairo'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'libayatana-appindicator'
    'libsoup3'
    'webkit2gtk-4.1'
)
provides=('gety')
conflicts=('gety' 'gety-appimage')
options=('!strip')
source=(
    "gety-${pkgver}.deb::https://dl.gety.ai/Gety-linux-x64-${pkgver}-beta.deb"
    "gety-license.txt"
)
sha256sums=('d0578200f483e19965c3c866d04daaf5f8a396acb61ae94ad34acf62cae01c8c'
            'fe5811b6741770c6dded6256176f4a71bdf2918541a1191767484984e810172e')

package() {
    cd "$srcdir"
    rm -rf deb
    mkdir -p deb/root
    cd deb
    ar x "$srcdir/gety-${pkgver}.deb"
    tar -xzf data.tar.gz -C root

    # 0.6.2 resolves its helpers relative to the executable
    # (<exedir>/../lib/gety/), so the deb layout installs as-is:
    #   /usr/bin/gety
    #   /usr/lib/gety/{deno,aria2c,mcp-proxy,gety-reporter}
    #   /usr/lib/Gety/{lib,resources}
    # No /usr/bin pollution, hence no bwrap wrapper needed (<=0.5.7 did).
    cp -a root/usr "$pkgdir/"

    # Gety ships no license text; distribute the terms snapshot from gety.ai
    # (maintained in this repo as gety-license.txt, like google-chrome's
    # eula_text.html). Refresh it manually when upstream terms change.
    install -Dm644 "$srcdir/gety-license.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}