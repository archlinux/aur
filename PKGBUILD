# Maintainer: Adrian Sinclair <adrian@transloadit.com>

pkgname=standard
pkgver=8.6.0
pkgrel=1
pkgdesc='JavaScript Standard Style'
arch=('any')
url='http://standardjs.com/index.html'
license=('MIT')
depends=('nodejs' 'eslint' 'eslint-plugin-react' 'eslint-plugin-promise')
makedepends=('npm')

_npmnames=($pkgname
           standard-engine
           eslint-plugin-standard
           eslint-config-standard
           eslint-config-standard-jsx)
_npmvers=($pkgver
          5.2.0
          2.0.1
          6.2.1
          3.2.0)

source=()
noextract=()
for n in 0 1 2 3 4; do
  source[$n]="http://registry.npmjs.org/${_npmnames[$n]}/-/${_npmnames[$n]}-${_npmvers[$n]}.tgz"
  noextract[$n]="${_npmnames[$n]}-${_npmvers[$n]}.tgz"
done
md5sums=('5f91004c0f2f9da458c90b7b663ac1b0'
         'ec1a1a9087496c5321149bac05756bed'
         '6c02705f28b66be297131041d08b1d55'
         'c1dab86fdc4f639dfbf9e47512c86aea'
         'b92982f2ce4145c063f406da8e5df289')
package() {
  for n in 0 1 2 3 4; do
    npm install -g --user root --prefix "$pkgdir"/usr "$srcdir"/${_npmnames[$n]}-${_npmvers[$n]}.tgz
  done
  rm -r "$pkgdir"/usr/etc

  # Fix permissions
  find "$pkgdir/usr" -type d -exec chmod 755 '{}' +

  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s ../../../lib/node_modules/$pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Experimental dedup
  cd "$pkgdir"/usr/lib/node_modules/$pkgname/node_modules
  for dep in eslint eslint-plugin-react eslint-plugin-promise; do
    rm -r $dep;
    npm link $dep;
  done
}
