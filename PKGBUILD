# Maintainer: serkho <sergey.khorev@gmail.com>
# adopted from reduce-algebra by quasi <quasi@aur.archlinux.org>
# Contributor: wangjiezhe <wangjiezhe AT yandex DOT com>

pkgbase=reduce-svn
_pkgbase=reduce
pkgname=(reduce-csl-svn reduce-psl-svn reduce-common-svn reduce-addons-svn)
pkgver=20160420.3606
pkgrel=1
arch=('i686' 'x86_64')
url="http://reduce-algebra.sourceforge.net/"
license=('BSD')
groups=('science')
makedepends=('subversion' 'texlive-htmlxml' 'imagemagick') # for documentation
depends=('ncurses' 'libxext' 'libxrandr' 'libxft' 'freetype2' 'expat' 'libx11' 'libxcursor')
source=("${_pkgbase}::svn+http://svn.code.sf.net/p/reduce-algebra/code/trunk"
        'csl' 'redcsl' 'redpsl'
        'redcsl.desktop' 'qreduce.desktop'
        'qreduce-file-location.patch')
sha256sums=('SKIP'
            '5a6065ef28bc64e38cc5c7e9c3ce5145c273e3ea7e7c073d8417a4d94fa6bafe'
            '9724e19545f181f6456e30bc1eff837cb708678f162a939b45f23627ad50c46c'
            '3d383ac93cb831a5a142395e76a9c275dc7e49dc150763610869e56e5a795e65'
            '22c7c510fba9ec2bcb8f476af0c96055a915a31f34c01ece43ff21d0dfa9dd0d'
            '9dce4d401c759c933ebc3ffbe0eff86150f04829ca10a9fd6f6faba4498f47ad'
            'e387eada63c3e15cb75f5f5a5060491831f607d93c7f97b30262fc30cf1ebea3')

pkgver() {
  cd ${srcdir}/${_pkgbase}
  svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
}

prepare() {
  rm -rf "${srcdir}/${_pkgbase}-build"
  svn export "${srcdir}/${_pkgbase}" "${srcdir}/${_pkgbase}-build"
  #svn export --force "${srcdir}/${_pkgbase}" "${srcdir}/${_pkgbase}-build"

  cd "${srcdir}/${_pkgbase}-build"
  patch -Np0 -i "${srcdir}/qreduce-file-location.patch"
}

build() {
  cd "${srcdir}/${_pkgbase}-build"
  ./configure --with-csl
  ./configure --with-psl
  make -j1
  (cd generic/redfront && make -j1)
  (cd generic/casefold && cc casefold.c -o casefold)
  (cd generic/libreduce && make PYTHON=/usr/bin/python2 -j1)
  (cd generic/emacs && makeinfo reduce-ide.texinfo)
}

package_reduce-csl-svn() {
  depends=('reduce-common')
  provides=('reduce-csl')
  conflicts=('reduce-csl' 'reduce-algebra')
  pkgdesc='REDUCE Computer Algebra System -- CSL version'
  #pkgdesc="A portable general-purpose computer algebra system (CSL version)"
  install=reduce-csl-svn.install

  install -Dm755 redcsl ${pkgdir}/usr/bin/redcsl
  install -Dm755 csl ${pkgdir}/usr/bin/csl
  install -Dm644 redcsl.desktop ${pkgdir}/usr/share/applications/redcsl.desktop

  cd "${srcdir}/${_pkgbase}-build"

  install -Dm644 cslbuild/generated-c/reduce.img ${pkgdir}/usr/lib/reduce/cslbuild/csl/reduce.img
  install -Dm644 cslbuild/generated-c/csl.img ${pkgdir}/usr/lib/reduce/cslbuild/csl/csl.img

  install -d ${pkgdir}/usr/lib/reduce/cslbuild/csl
  install -d ${pkgdir}/usr/share/reduce/

  install -t ${pkgdir}/usr/lib/reduce/cslbuild/csl/ cslbuild/${CARCH}-unknown-linux-gnu/csl/{csl,reduce}

  cp -r cslbuild/${CARCH}-unknown-linux-gnu/csl/reduce.resources ${pkgdir}/usr/lib/reduce/cslbuild/csl/
  cp -r cslbuild/${CARCH}-unknown-linux-gnu/csl/reduce.fonts ${pkgdir}/usr/share/reduce/fonts

  install -Dm644 debianbuild/reduce/debian/copyright ${pkgdir}/usr/share/doc/reduce-csl/copyright
  install -Dm644 debianbuild/reduce/debian/redcsl.1 ${pkgdir}/usr/share/man/man1/redcsl.1

  cd "${pkgdir}/usr/lib/reduce/cslbuild/csl"
  ln -s ../../../../share/reduce/fonts reduce.fonts

  cd "${pkgdir}/usr/share/reduce"
  ln -s ../../lib/reduce/cslbuild
}

package_reduce-psl-svn() {
  depends=('reduce-common')
  provides=('reduce-psl')
  conflicts=('reduce-psl')
  pkgdesc='REDUCE Computer Algebra System -- PSL version'

  install -D redpsl ${pkgdir}/usr/bin/redpsl

  cd "${srcdir}/${_pkgbase}-build"

  install -d ${pkgdir}/usr/lib/reduce/pslbuild
  install -d ${pkgdir}/usr/share/reduce

  cp -r pslbuild/${CARCH}-unknown-linux-gnu/{psl,red} ${pkgdir}/usr/lib/reduce/pslbuild/

  install -Dm644 debianbuild/reduce/debian/copyright ${pkgdir}/usr/share/doc/reduce-psl/copyright
  install -Dm644 debianbuild/reduce/debian/redpsl.1 ${pkgdir}/usr/share/man/man1/redpsl.1

  cd "${pkgdir}/usr/share/reduce"
  ln -s ../../lib/reduce/pslbuild
}

package_reduce-common-svn() {
  provides=('reduce-common')
  conflicts=('reduce-common')
  pkgdesc='REDUCE Computer Algebra System -- common files'

  cd "${srcdir}/${_pkgbase}-build"

  install -d ${pkgdir}/usr/share/reduce/doc

  cp -r packages ${pkgdir}/usr/share/reduce/

  install -Dm644 debianbuild/reduce/debian/copyright ${pkgdir}/usr/share/doc/reduce-common/copyright

  cp -r doc/{manual,manual2,misc,primers,util} ${pkgdir}/usr/share/reduce/doc

  install -Dm644 generic/qreduce/Bumblebee.png ${pkgdir}/usr/share/icons/redcsl.png
}

package_reduce-addons-svn() {
  provides=('reduce-addons')
  conflicts=('reduce-addons')
  pkgdesc='Useful addons for the REDUCE Computer Algebra System'
  optdepends=(
    'reduce-csl: REDUCE Computer Algebra System'
    'reduce-psl: REDUCE Computer Algebra System'
    'python2-pyside: for QT-based GUI'
  )
  install=reduce-addons-svn.install

  cd "${srcdir}/${_pkgbase}-build"

  install -d ${pkgdir}/usr/lib/reduce
  install -d ${pkgdir}/usr/share/doc/reduce-addons
  install -d ${pkgdir}/usr/share/emacs/site-lisp/reduce

  install -D generic/redfront/${CARCH}-unknown-linux-gnu/redfront/redfront ${pkgdir}/usr/bin/redfront
  install -Dm644 generic/redfront/src/redfront.1 ${pkgdir}/usr/share/man/man1/redfront.1

  install -D generic/breduce/breduce ${pkgdir}/usr/bin/breduce
  install -Dm644 generic/breduce/breduce.1 ${pkgdir}/usr/share/man/man1/breduce.1
  install -t ${pkgdir}/usr/share/doc/reduce-addons generic/breduce/breduce.{bbl,pdf,tex}

  install -D generic/casefold/casefold ${pkgdir}/usr/bin/casefold
  install -Dm644 generic/casefold/README ${pkgdir}/usr/share/doc/reduce-addons/README.casefold

  install -t ${pkgdir}/usr/lib/reduce generic/libreduce/${CARCH}-unknown-linux-gnu/{libreduce.so,RedPy.so}

  cp -r generic/qreduce ${pkgdir}/usr/share/

  install -t ${pkgdir}/usr/share/emacs/site-lisp/reduce generic/emacs/reduce-{mode,run}.el
  install -Dm644 generic/emacs/reduce-ide.texinfo ${pkgdir}/usr/share/doc/reduce-addons/reduce-ide.texinfo
  install -Dm644 generic/emacs/README ${pkgdir}/usr/share/doc/reduce-addons/README.emacs
  install -Dm644 generic/emacs/reduce-ide.info ${pkgdir}/usr/share/info/reduce-ide.info

  cd "${pkgdir}/usr/bin"
  ln -s redfront rfcsl
  ln -s redfront rfpsl
  ln -s ../share/qreduce/qreduce.py qreduce

  cd "${pkgdir}/usr/share/man/man1"
  ln -s redfront.1 rfcsl.1
  ln -s redfront.1 rfpsl.1

  cd "${pkgdir}/usr/share/qreduce"
  ln -s ../../lib/reduce/RedPy.so
}

# vim:set ts=2 sw=2 et:
