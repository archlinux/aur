# Maintainer: kusanaginoturugi <kusanaginoturugi at gmail dot com>
pkgname=man-pages-openssh-ja
pkgver=6.9p1
pkgrel=1
pkgdesc="Japanese Man pages for the OpenSSH"
arch=('any')
url="http://euske.github.io/openssh-jman/"
license=('BSD')
source=('http://euske.github.io/openssh-jman/openssh-jman-690p1.tar.gz'
        'Makefile.diff')
md5sums=('aa3447eb37f6c639086bc8b66ae8113f'
         'c32945f7c6589af10f900bc8ff1462df')

build() {
  cd ${srcdir}

  patch -i ${srcdir}/Makefile.diff

  mkdir man
  for i in *.[158]; do
    iconv -f EUCJP -t UTF8 ${i} -o man/${i}
  done

  make
}

package() {
  install -D -m644 ${srcdir}/README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"
  install -D -m644 ${srcdir}/*.html "${pkgdir}/usr/share/doc/${pkgname}/"

  cd $srcdir/man
  for i in 1 5 8; do
    if [ ! -e "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/" ]; then
      mkdir -p "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
      chmod 755 "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/"
    fi

    # To copy a noexistent man only.
    for f in *.${i} ; do
      if [ ! -e /usr/share/man/ja_JP.UTF-8/man${i}/${f}.gz ]; then
        cp ${f} "${pkgdir}/usr/share/man/ja_JP.UTF-8/man${i}/${f}"
        chmod 644 *.${i}
      fi
    done
  done
}
