# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: David Birks <david@tellus.space>
# Contributor: Piotr Rogoza <piotr dot r dot public at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Sergei Lebedev <superbobry at gmail dot com>

pkgname=rutorrent
_pkgname=ruTorrent
pkgver=4.1.7
_pkgver=$pkgver
pkgrel=1
pkgdesc="Yet another web front-end for rTorrent"
arch=('any')
url='https://github.com/Novik/ruTorrent'
license=('GPL')
depends=(php curl gzip coreutils)
optdepends=('mod_scgi: for SCGI protocol')
conflicts=(rutorrent-plugins)
source=( 
    $pkgname-$_pkgver.tar.gz::https://github.com/Novik/ruTorrent/archive/v${_pkgver}.tar.gz
    apache.example.conf
    apache.example.site.conf
)
sha256sums=('361004a1a0ff11643bfd8f7b52fa6aa9f2fc81eb8260765e81519ac53dfb4c0a'
            '79b5aab7ef928727b3ec2aa0f1b0869310adde11cd774d148c03025deb6dec0c'
            '9afe7d2a9aadb5fd6a0fcd907f7f46bdc3630c369a5a684c51bbeeb5b4d354aa')
backup=( 
    etc/webapps/rutorrent/conf/config.php
    etc/webapps/rutorrent/conf/plugins.ini
    etc/webapps/rutorrent/conf/access.ini
)
options=(emptydirs !strip)

prepare() {
    cd $srcdir/$_pkgname-$_pkgver
    rm -f .gitignore
    msg2 "Removing files with Russian letters in filenames"
    cd plugins/tracklabels/labels
    find . -print0 | perl -MFile::Path=remove_tree -n0e 'chomp; remove_tree($_, {verbose=>1}) if /[[:^ascii:][:cntrl:]]/'
}
package() {
    cd $srcdir/$_pkgname-$_pkgver
  
    install -d "$pkgdir"/usr/share/webapps
    install -d "$pkgdir"/etc/webapps/$pkgname
  
    cp -r conf "$pkgdir"/etc/webapps/$pkgname/
    cp -r . "$pkgdir"/usr/share/webapps/$pkgname/
  
    rm -rf "$pkgdir"/usr/share/webapps/$pkgname/conf
  
    install -Dm644 ../apache.example.conf "$pkgdir"/etc/webapps/rutorrent/
    install -Dm644 ../apache.example.site.conf "$pkgdir"/etc/webapps/rutorrent/
  
    cd "$pkgdir"/usr/share/webapps/$pkgname
    ln -s /etc/webapps/$pkgname/conf
  
    #fix perms
    #chown http\: $pkgdir/usr/share/webapps/$pkgname/share/{settings,torrents,users}
    chmod 0777 $pkgdir/usr/share/webapps/$pkgname/share/{settings,torrents,users}
}
