# Maintainer: staalmannen <staal1978@gmail.com>
pkgname=nedit-qtify
_pkgname=nedit
pkgver=5.7
pkgrel=1
pkgdesc="NEdit, the classic Motif programmer's text editor, built on Qt with Motif on Qt"
arch=(x86_64 aarch64)
url="https://sourceforge.net/projects/nedit/"
license=(GPL-2.0-or-later)
depends=(qt6-base)
makedepends=(motif-on-qt perl)
provides=(nedit)
conflicts=(nedit)
source=("https://downloads.sourceforge.net/project/nedit/nedit-source/${_pkgname}-${pkgver}-src.tar.gz"
        nedit.desktop)
sha256sums=('add9ac79ff973528ad36c86858238bac4f59896c27dbf285cbe6a4d425fca17a'
            'c6580aef92843368d0bddd90d7340717f8fd94054f21c927a37b54fc4dd77d4c')

build() {
  cd "${_pkgname}-${pkgver}"
  # NEdit's makefiles set CFLAGS and LIBS themselves: the paths from
  # motif-on-qt-env go on the command line. gnu17: NEdit's code is not C23.
  eval "$(motif-on-qt-env)"
  make linux CFLAGS="$CFLAGS -std=gnu17 $CPPFLAGS -DUSE_DIRENT -DUSE_LPR_PRINT_CMD" \
    LIBS="$LDFLAGS -lXm -lXt -lX11 -lm"
  pod2man --section=1 --center=NEdit --release="NEdit $pkgver" doc/nedit.pod > nedit.1
  pod2man --section=1 --center=NEdit --release="NEdit $pkgver" --name=nedit-nc doc/nc.pod > nedit-nc.1
}

check() {
  cd "${_pkgname}-${pkgver}"
  HOME="$srcdir/home" QT_QPA_PLATFORM=offscreen MOTIFQT_AUTOQUIT=1500 ./source/nedit
}

package() {
  cd "${_pkgname}-${pkgver}"
  install -Dm755 source/nedit "$pkgdir/usr/bin/nedit"
  # nc is netcat's name: distributions install NEdit's client as nedit-nc
  install -Dm755 source/nc "$pkgdir/usr/bin/nedit-nc"
  install -Dm644 nedit.1 "$pkgdir/usr/share/man/man1/nedit.1"
  install -Dm644 nedit-nc.1 "$pkgdir/usr/share/man/man1/nedit-nc.1"
  install -Dm644 ../nedit.desktop "$pkgdir/usr/share/applications/nedit.desktop"
}
