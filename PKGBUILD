# Maintainer: jason ryan <jasonwryan@gmail.com>
# Contributor: Andreas Wagner <Andreas dot Wagner at em dot uni-frankfurt dot de>
# Contributor: Giorgio Lando <patroclo7@gmail.com>

pkgname=muttprint
pkgver=0.73_4
_mainver=0.73
pkgrel=1
arch=("i686" "x86_64")
pkgdesc="An app to print email from CLI mail clients, mutt in particular"
license=("GPL")
arch=("i686" "x86_64")
depends=('texlive-latexextra' 'perl-timedate' 'perl-file-which' 'perl-text-iconv' 'psutils' 'dialog')
optdepends=('texlive-fontsextra:         Adds the CMBright font')
makedepends=('imagemagick')
url=(http://muttprint.sf.net)
backup=('etc/Muttprintrc')
source=(http://downloads.sf.net/$pkgname/$pkgname-$_mainver.tar.gz
        'muttprint_0.73-4.diff.gz' 'regex.patch')
md5sums=('39b76058b838e3078df93236eda2c316'
         'd5d2ba786cd4ff0a40b7fd2c53e11562'
         'c0eb6dcfc195c95edf5e27c414f8290a')

prepare(){
   cd $srcdir/$pkgname-$_mainver
   patch -p1 < "$srcdir"/muttprint_0.73-4.diff
   patch -p1 < "$srcdir"/regex.patch
   # convert images (and make pics/ build work)
   cd pics && \
     convert -flop BabyTuX.eps BabyTuX.eps
     for i in BabyTuX_color.eps BabyTuX.eps Debian_color.eps Debian.eps \
       Gentoo.eps Gentoo_color.eps ; do \
       convert $i $(basename $i .eps).png; \
     done && \
     convert penguin.eps penguin.jpg
}

build() {
   cd $srcdir/$pkgname-$_mainver

   aclocal
   automake --add-missing --copy
   autoconf
   ./configure --prefix=/usr
   make PREFIX=/usr
}

package() {
   cd $srcdir/$pkgname-$_mainver
   make PREFIX=/usr DESTDIR=$pkgdir install
   for i in README* CREDITS ChangeLog CHANGES AUTHORS ; do \
     install -m644 $i $pkgdir/usr/share/doc/muttprint/$i ; \
   done

   mkdir -p $pkgdir/etc
   install -m644 sample-muttprintrc-en 	 $pkgdir/etc/Muttprintrc
}

# vim:set ts=2 sw=2 et:
