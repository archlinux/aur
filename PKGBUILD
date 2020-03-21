# Maintainer: Naleo Hyde <naleo dot hyde at gmail dot com>

_npmname=somafm
pkgname=nodejs-"$_npmname"
pkgver=2.7.0
pkgrel=1
pkgdesc='Command Line Tool to play soma.fm'
arch=('any')
url='http://github.com/uschek/somafm'
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'jq' 'moreutils')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('07f644ebe57d11631af9bc47384d849d679def9724b7bb174822c2006e9c0b80')
noextract=("${source[@]##*/}")

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
    find "$pkgdir" -type f -name package.json \
        -execdir sh -c "jq '. |= with_entries(select(.key | test(\"_.+\") | not))' {} | sponge {}" \;
    chown -R root:root "$pkgdir"
}
