# Contributor: Johannes Dewender < arch at JonnyJD dot net >

pkgname=vim-vimwiki
pkgver=2.0.1
pkgrel=1
pkgdesc="Personal Wiki for Vim"
arch=('any')
url="http://code.google.com/p/vimwiki/"
license=('MIT' 'GPL3')
groups=('vim-plugins')
depends=('vim' 'python2')
install=vimwiki.install
source=(http://vimwiki.googlecode.com/files/vimwiki-2-0-1.zip
        license.txt
        convert_links.py
        convert-links.patch)
md5sums=('fd3ea1842270db87e0b8b966970fedc1'
         'e19fa0689d06a724fc8ddfe824ef2680'
         '0fc0e816bb93e408b62f74e8b2073daa'
         '1ba74a69c30927e947f22870c2551f73')

build () {
  cd "$srcdir"

  # change symlink to file
  mv convert_links.py convert_links.symlink
  cp -L convert_links.symlink convert_links.py
  rm convert_links.symlink
  patch -p1 < convert-links.patch
}

package () {
  cd "$srcdir"

  install -d $pkgdir/usr/share/vim/vimfiles/autoload/vimwiki
  install -Dm644 autoload/vimwiki/* \
    ${pkgdir}/usr/share/vim/vimfiles/autoload/vimwiki/

  install -d $pkgdir/usr/share/vim/vimfiles/{doc,ftplugin,plugin,syntax}
  for x in {ftplugin,plugin,syntax}; do
    install -Dm644 $x/* $pkgdir/usr/share/vim/vimfiles/$x/
  done
  install -Dm644 license.txt $pkgdir/usr/share/licenses/$pkgname/license.txt
  install -Dm644 doc/vimwiki.txt $pkgdir/usr/share/vim/vimfiles/doc/ 

  # install convert-links
  install -D convert_links.py $pkgdir/usr/bin/vimwiki_convert_links
}

# vim:set ts=2 sw=2 et:
