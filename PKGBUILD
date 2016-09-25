# Maintainer: Marc Mettke <marc@itmettke.de>

pkgbase=mediawiki-lts
_pkgname=mediawiki
pkgname=('mediawiki-lts' 'mediawiki-math')
_basever=1.27
pkgrel=1
pkgver=${_basever}.${pkgrel}
pkgdesc="Latests MediaWiki LTS engine"
arch=('any')
url="http://www.mediawiki.org/wiki/MediaWiki"
# + http://www.mediawiki.org/wiki/Extension:Math
license=("GPL")
depends=('php')
makedepends=('git')
optdepends=('texvc: for math rendering'
	    'python2'
	    'pcre: for regular expressions support'
	    'php-intl: to handle Unicode normalization'
#	    'php-mysql: for MySQL database support'
	    'php-pgsql: for PostgreSQL database support'
	    'php-sqlite: for sqlite database support'
	    'php-apc: for cache support'
	    'php-xcache: for cache support'
	    'memcached: for cache support'
	    'php-gd: for thumbnails rendering'
	    'imagemagick: for thumbnails rendering'
	    'smtp-forwarder: for mail sending')
install=mediawiki.install
options=(!strip)
#	mediawiki-math-${_basever}::git+https://git.wikimedia.org/git/mediawiki/extensions/Math.git#branch=REL${_basever/./_}
source=("http://releases.wikimedia.org/mediawiki/${_basever}/mediawiki-$pkgver.tar.gz"
	"mediawiki-math-${_basever}.tar.gz::https://codeload.github.com/wikimedia/mediawiki-extensions-Math/legacy.tar.gz/REL${_basever/./_}"
	apache.example.conf)
sha256sums=('08a676c392625cf3c5730a6c1b9390ab1e11dcc17cfd0ff97a2ae3917ef5a36a'
         '9fb1d9cd450ad579f6e95a3be9a66240485fe50697aea5322af949698dfcb2be'
         'cfeff68331e930b6a93f166c12666ac59a84aa24334f94520eff3f988f37ce2b')
         

package_mediawiki-lts() {
  cd $srcdir
  install -vdm0755 $pkgdir/usr/share/webapps
  install -vdm0755 $pkgdir/etc/webapps/mediawiki
  cp -a $_pkgname-$pkgver $pkgdir/usr/share/webapps/mediawiki

  install -vDm0644 $srcdir/apache.example.conf $pkgdir/etc/webapps/mediawiki/apache.example.conf

  # move cache and images to /var
  install -vdm0755 -o http -g http $pkgdir/var/cache/mediawiki
  install -vdm0755 -o http -g http $pkgdir/var/lib/mediawiki

  cd $pkgdir/usr/share/webapps/mediawiki

  mv cache/.htaccess $pkgdir/var/cache/mediawiki/
  rmdir cache
  ln -sf /var/cache/mediawiki cache

  mv images/* $pkgdir/var/lib/mediawiki/
  mv images/.htaccess $pkgdir/var/lib/mediawiki/
  rmdir images
  ln -sf /var/lib/mediawiki images
}

package_mediawiki-math() {
  depends=('mediawiki' 'texvc')
  optdepends=()
  backup=()
  pkgdesc="MediaWiki math extension"
  unset install

  cd $srcdir
  install -vdm0755 $pkgdir/usr/share/webapps/mediawiki/extensions
#  cp -a mediawiki-math-${_basever} $pkgdir/usr/share/webapps/mediawiki/extensions/Math
  cp -a wikimedia-mediawiki-extensions-Math-efdd7c2 $pkgdir/usr/share/webapps/mediawiki/extensions/Math
  ln -s /usr/bin/texvc $pkgdir/usr/share/webapps/mediawiki/extensions/Math/math/texvc
}
