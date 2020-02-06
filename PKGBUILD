# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=social-engineer-toolkit-git

pkgver() { git -C "${pkgname%-git}" describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=8.0.3.r4.bc1459567
pkgrel=2

pkgdesc='The Social-Engineer Toolkit (SET) - Development Version'
arch=('any')
url="https://github.com/trustedsec/${pkgname%-git}"
license=('BSD')

makedepends=('git')
depends=('python-pexpect' 'python-pycryptodome' 'python-requests'
         'python-pyopenssl' 'python-pefile' 'impacket'
         'python-qrcode' 'python-beautifulsoup4')
optdepends=('metasploit')

provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

changelog=CHANGELOG
source=("git+$url.git")
sha256sums=('SKIP')


prepare() {
    rm -r "${pkgname%-git}"/{seupdate,setup.py,requirements.txt,.git{hub,ignore}}
}

build() {
    python -O -m compileall "${pkgname%-git}"
}

package() {
    install -Dm644 "${pkgname%-git}/src/core/config.baseline" "$pkgdir/etc/setoolkit/set.config"
    install -dm755 "$pkgdir/usr/"{bin,share/{doc,licenses/setoolkit}}
    cp -a --no-preserve=ownership "${pkgname%-git}" "$pkgdir/usr/share/setoolkit"
    mv "$pkgdir/usr/share/setoolkit/readme" "$pkgdir/usr/share/doc/setoolkit"
    mv "$pkgdir/usr/share/setoolkit/README.md" "$pkgdir/usr/share/doc/setoolkit/"
    ln -s /usr/share/doc/setoolkit "$pkgdir/usr/share/setoolkit/readme"
    ln -s /usr/share/doc/setoolkit/LICENSE "$pkgdir/usr/share/licenses/setoolkit/"
    ln -s /usr/share/setoolkit/se{toolkit,proxy,automate} "$pkgdir/usr/bin/"
}


# vim: ts=4 sw=4 et ft=PKGBUILD:
