# Maintainer: Joris Steyn <joris@j0r1s.nl>
#
# Example usage:
#  $ man array_pop
#  $ man SplFileInfo.getInode
#
# And to avoid ambiguity with other libraries:
#  $ man strlen (libc)
#  $ man 3p strlen (posix)
#  $ man 3php strlen (php)
#
# More info:
#  * https://wiki.php.net/doc/phd/install
#  * the HOWTO.RELEASE file in php-phd

pkgname=php-manpages-svn
pkgver=338334
pkgrel=1
pkgdesc='Manual pages for PHP, generated from latest documentation (alternative to pman)'
arch=('any')
url='https://wiki.php.net/doc'
license=('PHP')
provides=('php-manpages')
makedepends=('subversion' 'php' 'php-phd' 'bash')
source=('phpdoc-en::svn+https://svn.php.net/repository/phpdoc/modules/doc-en')
md5sums=('SKIP')

pkgver() {
    cd "$SRCDEST"/phpdoc-en
    svnversion | tr -d [A-z]
}

build() {
    cd "$srcdir"

    # disable system-wide php.ini and hard-code required settings for
    # configure.php and phd, this is to allow building in a chroot
    tee php-wrapper.sh <<< '
#!/usr/bin/sh
php -n \
  -d open_basedir=/ \
  -d extension=sqlite3.so \
  -d date.timezone=Europe/Amsterdam \
  -d memory_limit=256M \
  $@
'
    chmod +x php-wrapper.sh

    msg 'Generating manual in raw XML format...'
    ./php-wrapper.sh phpdoc-en/doc-base/configure.php \
      --output=php-manual.xml --with-php=`pwd`/php-wrapper.sh

    msg 'Converting docbooks to manpages...'
    # use PhD_PHP to convert to manpage format
    ./php-wrapper.sh /usr/share/php/phd/render.php -d php-manual.xml -P PHP -f manpage

    # not generation pear package here, use man [3php] symbol
    #php $_phpargs /usr/share/php/phd/package-pman.php

    # create temporary output directory
    [ ! -d man3 ] && mkdir man3

    # rename to 'php' section (.3php.gz)
    cd "$srcdir"/output/php-functions/
    for file in *\.gz; do
        mv "$file" "$srcdir"/man3/"${file/\.3\.gz/.3php.gz}"
    done
}

package() {
    install -d "$pkgdir"/usr/share/man/man3
    install -m 644 "$srcdir"/man3/*.gz "$pkgdir"/usr/share/man/man3/
}

# vim:set ts=2 sw=2 et:
