# Maintainer: Fabian Zaremba <fabian at youremail dot eu>
pkgname=sslyze-git
pkgver=0.11.420
pkgrel=4
pkgdesc="Fast and full-featured SSL scanner."
arch=('i686' 'x86_64')
url="https://github.com/nabla-c0d3/sslyze"
license=('GPL2')
depends=('python2')
makedepends=('git')
provides=('sslyze')
conflicts=('sslyze')
options=('!makeflags')
source=("git://github.com/nabla-c0d3/nassl.git"
"git://github.com/nabla-c0d3/sslyze.git"
"http://zlib.net/zlib-1.2.8.tar.gz"
"https://www.openssl.org/source/openssl-1.0.2a.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            '36658cb768a54c1d4dec43c3116c27ed893e88b02ecfcb44f2166f9c0b7f2a0d'
            '15b6393c20030aab02c8e2fe0243cb1d1d18062f6c095d67bca91871dc7f324a')


pkgver() {
cd "$srcdir/sslyze"
echo $(grep "##" CHANGELOG.md | head -n 1 | sed 's/## v//').$(git rev-list --count HEAD)
} 

build() {

cd "$srcdir/"

mv "$srcdir/openssl-1.0.2a" "$srcdir/nassl/"
mv "$srcdir/zlib-1.2.8" "$srcdir/nassl/"

cd "$srcdir/nassl"

python2.7 buildAll_unix.py

cd "$srcdir/nassl/test/nassl"
rm *.pyc

mv "$srcdir/nassl/test/nassl" "$srcdir/sslyze/"

}

package() {

#Packaging routine derived from sslyze PKGBUILD by goll

# Install files in /opt
mkdir -p "$pkgdir/opt/sslyze"
cp -a "$srcdir/sslyze/." "$pkgdir/opt/sslyze"

rm -rf "$pkgdir/opt/sslyze/.git"

# Create an indirect launcher in /usr/bin
mkdir -p "$pkgdir/usr/bin"

cat << EOF > "$pkgdir/usr/bin/sslyze"
#!/usr/bin/bash
cd /opt/sslyze && python2.7 sslyze.py \$@
EOF

chmod 755 "$pkgdir/usr/bin/sslyze"

}
