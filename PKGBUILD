# Maintainer :  Kr1ss $(sed s/\+/./g\;s/\-/@/ <<<\<kr1ss+x-yandex+com\>)


pkgname=social-engineer-toolkit-git
_name="${pkgname%-git}"

pkgver() { git -C "$_name" describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'; }
pkgver=8.0.3.r82.80fe70d70
pkgrel=2

pkgdesc='The Social-Engineer Toolkit (SET) - Development Version'
arch=('any')
url="https://github.com/trustedsec/$_name"
license=('BSD')

makedepends=('git')
depends=('python-pexpect' 'python-pycryptodome' 'python-requests'
         'python-pyopenssl' 'python-pefile' 'impacket'
         'python-qrcode' 'python-beautifulsoup4')
optdepends=('metasploit' 'java-runtime' 'openssl')

provides=("$_name")
conflicts=("$_name")

changelog=CHANGELOG
source=("git+$url.git")
sha256sums=('SKIP')


prepare() { rm -r "$_name"/{seupdate,setup.py,requirements.txt,.git{hub,ignore}}; }

build() { python -O -m compileall "$_name"; }

package() {
  rm -r "$_name/.git"
  install -Dm644 "$_name/src/core/config.baseline" "$pkgdir/etc/setoolkit/set.config"
  install -dm755 "$pkgdir/usr/"{bin,share/{doc,licenses/setoolkit}}
  cp -a --no-preserve=o "$_name" "$pkgdir/usr/share/setoolkit"
  cd "$pkgdir/usr/share"
  mv setoolkit/readme    doc/setoolkit
  mv setoolkit/README.md doc/setoolkit/
  ln -s /usr/share/doc/setoolkit                        setoolkit/readme
  ln -s /usr/share/doc/setoolkit/LICENSE                licenses/setoolkit/
  ln -s /usr/share/setoolkit/se{toolkit,proxy,automate} ../bin/
}


# vim: ts=2 sw=2 et ft=PKGBUILD:
