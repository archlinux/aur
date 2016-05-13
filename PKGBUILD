# Maintainer: Fabian Zaremba <fabian at youremail dot eu>

pkgname=sslyze-git
pkgver=0.13.5.r15.g771fb17
pkgrel=1
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url="https://github.com/nabla-c0d3/sslyze"
license=('GPL2')
depends=('python2')
makedepends=('git')
provides=('sslyze')
conflicts=('sslyze')
options=('!makeflags')
source=("git+https://github.com/nabla-c0d3/nassl.git"
"git+https://github.com/nabla-c0d3/sslyze.git"
"git+https://github.com/PeterMosmans/openssl.git"
"http://zlib.net/zlib-1.2.8.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d')


pkgver() {

cd "$srcdir/sslyze"
git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

} 

build() {

cd "$srcdir/"

mv "$srcdir/openssl" "$srcdir/nassl/openssl"
mv "$srcdir/zlib-1.2.8" "$srcdir/nassl/"

cd "$srcdir/nassl"

# Delete binaries that are shipped within the git repository
find "$srcdir/nassl/bin" -type f -delete

python2.7 build_from_scratch.py
python2.7 run_tests.py

cd "$srcdir/nassl/nassl"
rm *.pyc

mv "$srcdir/nassl/nassl" "$srcdir/sslyze/"

}

package() {

# Install files in /opt
mkdir -p "$pkgdir/opt/sslyze"
cp -a "$srcdir/sslyze/." "$pkgdir/opt/sslyze"
rm -rf "$pkgdir/opt/sslyze/.git"

# Create cli launcher symlink in /usr/bin
mkdir -p "$pkgdir/usr/bin"
ln -s /opt/sslyze/sslyze_cli.py "$pkgdir/usr/bin/sslyze"
chmod 755 "$pkgdir/opt/sslyze/sslyze_cli.py"

}
