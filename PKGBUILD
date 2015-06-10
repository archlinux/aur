# $Id: PKGBUILD 87989 2013-04-09 21:30:21Z eric $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Dominika Solarz <dominikasolarz@gmail.com>

pkgname=icewm-utils
pkgver=1.0

_mcver=2.1
_tsver=1.4
_bgsetver=1.3
_kedver=1.5
_woedver=1.8
_sndcfgver=1.3
_ccver=2.9
_cursorscfgver=0.6
_iconcvtver=1.0
_rrunver=0.5
_mergeprefsver=0.5

pkgrel=6
pkgdesc="Suite of tools for IceWM"
arch=(i686 x86_64)
license=("GPL")
url="http://icecc.sourceforge.net/"
depends=('qt3' 'python2')
optdepends=('pyqt3' 'gvim')
source=("http://downloads.sourceforge.net/icecc/icemc-$_mcver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/icets-$_tsver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/icebgset-$_bgsetver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/iceked-$_kedver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/icewoed-$_woedver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/icesndcfg-$_sndcfgver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/icecc-$_ccver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/icecursorscfg-$_cursorscfgver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/iceiconcvt-$_iconcvtver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/icerrun-$_rrunver.tar.bz2"
	"http://downloads.sourceforge.net/sourceforge/icecc/icemergeprefs-$_mergeprefsver.tar.bz2"
	icets-fix-icewmtray-crash.diff)
md5sums=('cb2afc6efaa0f9d77b0119b29d528667'
         '1d87c93f5cb27da16c90f47531b7fb21'
         '7086b771fc7877369924affc5b5f5e41'
         '47761a8dc59880ddda2a00de9cd187f5'
         '518f05c02cb24a7e36715ce0d0672c8e'
         '2113c524ebbbf38ce7eb174b9997c202'
         'e3ddbb3536941745435f727053816865'
         '000ec299a83dbae269f2f335910bd50e'
         '64463287b6c535b31cb2823d97bfe299'
         'cea2fd7726b9f01b080e3861d325ec24'
         'b34931566da118e7a14ddcb529e739c6'
         '5116da930c0063dd8c478dd8e473b08f')

build() {
  cd $srcdir
  # fix default global path to IceWM
  for file in icewoed-$_woedver/qcentralwidget.cpp \
             icemc-$_mcver/qcentralwidget.cpp \
             icets-$_tsver/icets.cpp
  do
    sed -i 's|/usr/local/|/usr/|' $file
  done

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_#!.*/usr/bin/python$_#!/usr/bin/python2_' $file
    sed -i 's_#!.*/usr/bin/env.*python$_#!/usr/bin/env python2_' $file
  done

  (cd icets-$_tsver && patch -p0 <$srcdir/icets-fix-icewmtray-crash.diff)

  cd $srcdir/icemc-$_mcver
  qmake-qt3
  make MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3 INCPATH+='-I/usr/include/qt3'

  cd $srcdir/icets-$_tsver
  qmake-qt3
  make MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3 INCPATH+='-I/usr/include/qt3'

  cd $srcdir/icebgset-$_bgsetver
  qmake-qt3
  make MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3 INCPATH+='-I/usr/include/qt3'

  cd $srcdir/iceked-$_kedver
  qmake-qt3
  make MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3 INCPATH+='-I/usr/include/qt3'

  cd $srcdir/icecc-$_ccver
  qmake-qt3
  make MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3 INCPATH+='-I/usr/include/qt3'

  cd $srcdir/icesndcfg-$_sndcfgver
  qmake-qt3
  make MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3 INCPATH+='-I/usr/include/qt3'

  cd $srcdir/icewoed-$_woedver
  qmake-qt3
  make MOC=/usr/bin/moc-qt3 UIC=/usr/bin/uic-qt3 INCPATH+='-I/usr/include/qt3'
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $srcdir/icemc-$_mcver/icemc $pkgdir/usr/bin/
  cp $srcdir/icets-$_tsver/icets $pkgdir/usr/bin/
  cp $srcdir/icebgset-$_bgsetver/icebgset $pkgdir/usr/bin/
  cp $srcdir/iceked-$_kedver/iceked $pkgdir/usr/bin/
  cp $srcdir/icecc-$_ccver/icecc $pkgdir/usr/bin/
  cp $srcdir/icesndcfg-$_sndcfgver/icesndcfg $pkgdir/usr/bin/
  cp $srcdir/icewoed-$_woedver/icewoed $pkgdir/usr/bin/
  cp $srcdir/icecursorscfg-$_cursorscfgver/icecurcfg.py $pkgdir/usr/bin/icecurcfg
  cp $srcdir/iceiconcvt-$_iconcvtver/iceiconcvt.py $pkgdir/usr/bin/iceiconcvt
  cp $srcdir/icemergeprefs-$_mergeprefsver/icemergeprefs.py $pkgdir/usr/bin/icemergeprefs
  cp $srcdir/icerrun-$_rrunver/icerrun.py $pkgdir/usr/bin/icerrun
  cp $srcdir/icerrun-$_rrunver/icerrrun.py $pkgdir/usr/bin/icerrrun
}
