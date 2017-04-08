# Maintainer: Adrian Sinclair <adrian@transloadit.com>

pkgname=standard
pkgver=10.0.1
pkgrel=1
pkgdesc='JavaScript Standard Style'
arch=('any')
url='http://standardjs.com/index.html'
license=('MIT')
depends=('nodejs' 'eslint' 'eslint-plugin-react' 'eslint-plugin-promise' 'eslint-plugin-node' 'eslint-plugin-import')
makedepends=('npm')

_npmnames=($pkgname
           standard-engine
           eslint-plugin-standard
           eslint-config-standard
           eslint-config-standard-jsx)
_npmvers=($pkgver
          7.0.0
          3.0.1
	  10.2.0
          4.0.1)

source=()
noextract=()
for n in 0 1 2 3 4; do
  source[$n]="http://registry.npmjs.org/${_npmnames[$n]}/-/${_npmnames[$n]}-${_npmvers[$n]}.tgz"
  noextract[$n]="${_npmnames[$n]}-${_npmvers[$n]}.tgz"
done
md5sums=('c175de17e2d6cb6c6a92e7d9c7d92689'
         '9aef55b42ac22f66d8c80401c4262a55'
	 '42240fb33303d86c1ef76531f174125c'
	 '129ffff2f86e93850047fad9676e25bf'
	 '0693e72fb2ca2879de76caf1e0bb3870')


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
