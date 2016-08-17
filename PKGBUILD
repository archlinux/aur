# Maintainer: James An <james@jamesan.ca>

pkgname=solr-conf-drupal
_pkgname=search_api_solr
pkgver=20160708
_pkgvers=(7.x-1.11
          8.x-1.0-alpha5)
pkgrel=2
pkgdesc="Configuration files to enable Drupal 7.x or 8.x to use Solr 3.x, 4.x, or 5.x as its search provider"
arch=('any')
url="http://drupal.org/project/$_pkgname"
license=('GPL')
depends=('solr>=3')
optdepends=(
  'drupal: Solr client for these configuration files'
  'aegir: meta-Drupal hosting platform'
  'solr-undertow: high performance servlet container for Solr')
# The mapping-ISOLatin1Accent.txt file is identical in all occurrences in the Solr repo across the head of all its supported branches (3-5.x)
source=("https://raw.githubusercontent.com/apache/lucene-solr/master/solr/example/example-DIH/solr/solr/mapping-ISOLatin1Accent.txt"
        "https://www.drupal.org/files/issues/2711685-support-solr6-${_pkgname//_/-}-4.patch"
        "http://ftp.drupal.org/files/projects/$_pkgname-${_pkgvers[0]}.tar.gz"
        "http://ftp.drupal.org/files/projects/$_pkgname-${_pkgvers[1]}.tar.gz")
md5sums=('9f3c8a60a4f09327fad22aeff082c2b3'
         '479dea32043f12575838eaa6de62f248'
         'a8b60845919774521861bdfbe7883a11'
         '1a2636b8050903114b66ce300c99b50d')
noextract=("${source[@]%%::*}")

prepare() {
  for _pkgver in "${_pkgvers[@]}"; do
    echo $_pkgver
    ver_drupal="${_pkgver%%-*}"
    install -dm755 "$ver_drupal"
    tar --extract --file="$_pkgname-$_pkgver.tar.gz" --strip-components=1 --directory="$ver_drupal" --overwrite
    [ "$ver_drupal" = "8.x" ] || patch --strip=1 --directory=$ver_drupal < "2711685-support-solr6-${_pkgname//_/-}-4.patch"
  done
}

package() {
  # Traverse and install conf files for Drupal 7.x and 8.x, and for Solr 1.4 (Drupal 8.x only), 3.x, 4.x, and 5.x.
  for ver_drupal in "${_pkgvers[@]%%-*}"; do
    for ver_solr in $(basename -a $ver_drupal/solr-conf/*); do
      for file in $(basename -a $ver_drupal/solr-conf/$ver_solr/*); do
        install -Dm644 "$ver_drupal/solr-conf/$ver_solr/$file" "$pkgdir/etc/solr/configsets/solr-$ver_solr-drupal-$ver_drupal/conf/$file"
      done
      install -Dm644 mapping-ISOLatin1Accent.txt "$pkgdir/etc/solr/configsets/solr-$ver_solr-drupal-$ver_drupal/conf/mapping-ISOLatin1Accent.txt"
    done
  done
}

#~ Create new core with drupal config set
#~ http://localhost:8983/solr/admin/cores?action=CREATE&name=coreX&configSet=solr-5.x-drupal-7.x
