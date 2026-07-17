# Maintainer: C-Yassin <c.yassin.org@gmail.com>
pkgname=flameget
pkgver=1.5
pkgrel=1
pkgdesc="A GTK4 Download Manager wrapping Aria2, Curl, and YT-DLP"
arch=('x86_64' 'aarch64')
url="https://github.com/C-Yassin/FlameGet"
license=('MIT' 'LGPL3')

depends=('python' 'python-gobject' 'python-flask' 'gtk4' 'libappindicator'
         'aria2' 'python-pycurl' 'yt-dlp' 'python-certifi' 'python-requests'
         'python-waitress' 'xdg-user-dirs' 'ffmpeg' 'python-loguru'
         'python-platformdirs' 'python-websocket-client')
makedepends=('git' 'python-installer')

provides=('aria2p')

_botguard_ver="v0.1.2"
_plugin_whl="yt_dlp_get_pot_rustypipe-0.2.0-py3-none-any.whl"
_aria2p_whl="aria2p-0.11.2-py3-none-any.whl"

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "https://files.pythonhosted.org/packages/ca/85/3e379cb2f2e214764c1e15485d1e2ec6d6f839b29289a1202fc26c93e07d/${_plugin_whl}"
        "https://files.pythonhosted.org/packages/py3/a/aria2p/${_aria2p_whl}")

sha256sums=('bbadef824055ff2a682a159268838e841ef23599f400bf3d4689348f5d5af8bf'
            '601b3b940e49bc45ba48fcdb2327850a75ba23c7e91709b5abbff5d4b914fa0b'
            'c3c0a87958dacc6b3ad194b5320811baf1e593ddaf83542320d439f6a82f865d')
sha256sums_x86_64=('4f2ec561e8f9fadece7deadc6ce0624fbdedd852222c3eb194c22153b1323129')
sha256sums_aarch64=('4d038857374a69aea9be8ded981d93a776dc88d4e254f5c6d292746099abf69a')


source_x86_64=("https://codeberg.org/ThetaDev/rustypipe-botguard/releases/download/$_botguard_ver/rustypipe-botguard-$_botguard_ver-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("https://codeberg.org/ThetaDev/rustypipe-botguard/releases/download/$_botguard_ver/rustypipe-botguard-$_botguard_ver-aarch64-unknown-linux-gnu.tar.xz")

prepare() {
    cd "FlameGet-$pkgver"
    sed -i 's/FLAMEGET_VERSION = "v1.4"/FLAMEGET_VERSION = "v1.5"/g' updater.py
}

package() {
    python -m installer --destdir="$pkgdir" "$srcdir/${_plugin_whl}"
    python -m installer --destdir="$pkgdir" "$srcdir/${_aria2p_whl}"

    cd "FlameGet-$pkgver"

    install -d "$pkgdir/usr/lib/$pkgname"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"

    cp -a configs icons binaries themes "$pkgdir/usr/lib/$pkgname/"

    install -m644 *.py -t "$pkgdir/usr/lib/$pkgname/"

    install -m644 configs/flameget.desktop -t "$pkgdir/usr/share/applications/"
    install -m644 repo-data/flameget.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"

    install -m755 "$srcdir/rustypipe-botguard" -t "$pkgdir/usr/lib/$pkgname/binaries/"

    install -m755 repo-data/flameget.sh "$pkgdir/usr/bin/flameget"
}
