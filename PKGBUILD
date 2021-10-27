# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: Marc Mettke <marc@itmettke.de>

pkgbase=mediawiki-lts
_pkgname=mediawiki
pkgname=('mediawiki-lts' 'mediawiki-math-lts')
pkgver=1.35.4
_basever=${pkgver%.*}
_hash=93930b1
pkgrel=1
pkgdesc="Latests MediaWiki LTS engine"
arch=('any')
url="http://www.mediawiki.org/wiki/MediaWiki"
# + http://www.mediawiki.org/wiki/Extension:Math
license=("GPL")
depends=('php')
makedepends=('git')
optdepends=('python2'
	    'pcre: for regular expressions support'
	    'php-intl: to handle Unicode normalization'
#	    'php-mysql: for MySQL database support'
	    'php-pgsql: for PostgreSQL database support'
	    'php-sqlite: for sqlite database support'
#	    'php-apcu: for cache support'
#	    'php-xcache: for cache support'
	    'memcached: for cache support'
	    'php-gd: for thumbnails rendering'
	    'imagemagick: for thumbnails rendering'
	    'smtp-forwarder: for mail sending')
install=mediawiki.install
options=(!strip)
validpgpkeys=('41B2ABE817ADD3E52BDA946F72BC1C5D23107F8A'
              '1D98867E82982C8FE0ABC25F9B69B3109D3BB7B0')
#	mediawiki-math-${_basever}::git+https://git.wikimedia.org/git/mediawiki/extensions/Math.git#branch=REL${_basever/./_}
source=("https://releases.wikimedia.org/mediawiki/${_basever}/mediawiki-$pkgver.tar.gz"{,.sig}
	"mediawiki-math-${_basever}.tar.gz::https://codeload.github.com/wikimedia/mediawiki-extensions-Math/legacy.tar.gz/REL${_basever/./_}"
	apache.example.conf)
sha256sums=('1902f7b9375dc7813aa50df9c23a758ba431d2e8a4116345c1eb5775dda94868'
            'SKIP'
            'cacaca559909e3cd5ba74c53b9f1c53476e58a7f454c796d18c678da925c4a24'
            'cfeff68331e930b6a93f166c12666ac59a84aa24334f94520eff3f988f37ce2b')

package_mediawiki-lts() {
  cd "$srcdir"
  install -vdm0755 "$pkgdir"/usr/share/webapps
  install -vdm0755 "$pkgdir"/etc/webapps/mediawiki
  cp -a $_pkgname-$pkgver "$pkgdir"/usr/share/webapps/mediawiki

  install -vDm0644 "$srcdir"/apache.example.conf "$pkgdir"/etc/webapps/mediawiki/apache.example.conf

  # move cache and images to /var
  install -vdm0755 -o http -g http "$pkgdir"/var/cache/mediawiki
  install -vdm0755 -o http -g http "$pkgdir"/var/lib/mediawiki

  cd "$pkgdir"/usr/share/webapps/mediawiki

  mv cache/.htaccess "$pkgdir"/var/cache/mediawiki/
  rmdir cache
  ln -sf /var/cache/mediawiki cache

  mv images/* "$pkgdir"/var/lib/mediawiki/
  mv images/.htaccess "$pkgdir"/var/lib/mediawiki/
  rmdir images
  ln -sf /var/lib/mediawiki images
}

package_mediawiki-math-lts() {
  depends=('mediawiki-lts')
  optdepends=()
  backup=()
  pkgdesc="MediaWiki math extension"
  unset install

  cd "$srcdir"
  install -vdm0755 "$pkgdir"/usr/share/webapps/mediawiki/extensions
#  cp -a mediawiki-math-${_basever} "$pkgdir"/usr/share/webapps/mediawiki/extensions/Math
  cp -a wikimedia-mediawiki-extensions-Math-${_hash} "$pkgdir"/usr/share/webapps/mediawiki/extensions/Math
}

