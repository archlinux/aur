# Maintainer: Uwe Koloska <kolewu [at] koloro [dot] de>
# Contributor: William Díaz <wdiaz [at] archlinux [dot] us>

pkgname=snack
pkgver=2.2.10
pkgrel=14
_srcdir="snack-upstream-2.2.10.20090623-dfsg"
pkgdesc="a sound toolkit for scripting languages (Tcl, Python, Ruby, ...)"
url="http://www.speech.kth.se/snack/"
arch=('i686' 'x86_64')
license=('GPL-2.0-or-later')
depends=('tk' 'alsa-lib' 'libxft' 'libxss' 'mpg123' 'libvorbis' 'libogg')
source=(https://salsa.debian.org/tcltk-team/snack/-/archive/upstream/2.2.10.20090623-dfsg/${_srcdir}.tar.gz
        alsa.patch
        args.patch
        cflags.patch
        configure.patch
        CVE-2012-6303.patch
        formant.patch
        libs.patch
        mpg123.patch
        seektell.patch
        tksnack.patch
        warnings.patch
        warnings2.patch
        fix-tests.patch
        archbuild.patch
		use-std-gnu17.patch
        copyright)
sha256sums=('0c8ba78e0ae7606b99f6794374b166bbaf58b9bf393dac6c53b0218c2b0275c3'
            'ac4e5c0b62f5d11b0dc426c2ee17f7615e08a4ac327cc21f87dca01aa0ea4e51'
            '2331e66f5c0d0e2d0de42bac2886a89f5fdf5aa10141bfe332202fd23b739ebe'
            'e2a41fc9a96b198b80fa9fe4d5d396ccc958b2e03b7fb3e7b4a64526b4294e73'
            '29b192cbe496d61c5c866f67cc324e51740d8733c5fd319159bd8ec5e3f3718e'
            '15a3f4efb5d7231ef8e473ff9760ed623bb6145d1c8f2dae910200c006da2e3b'
            '1cffd0c63851ae242a698b0bddbf5feee064fdd39213f44d430586e031175fdf'
            'c81570e89fba8d7df2dd6673379267b3a5530dea724036c2e07cf0dcc8c3ed8b'
            '4ea6468598525b024e0de090f51c6e235048e04c22610a523e0350314c376df6'
            '9d6d3b123436a836f5f6bad9c0cbd1ac6bf335952b4da6ed3251ae6d5138a906'
            'edb6c7aacde9dcd5724530a1688a6f1dfa549aa4f3f56f88b08753635c873f44'
            'b3850cc8a91d62e28a54022680c1a92c2ca7438b0e86e990f95b3db27fa24f6c'
            '2d59cee6ad38a0dbd15a8f1e8d7be5cb0d445299dcd4807fa31f4c26ba8f7d17'
            '463a2520f89539fef5d7f63a7cf078bfb3a6ebe83f1037785d1d56d09fa3c9a3'
            'e65c4d0914be9bb659d0fe513fa38ee7c8787bffee93fb6a0c3a0a85feb35782'
            'b13a8c93ea234319a43f513ca753a26db21e42111a2c0f358cb5d94aed106c00'
            '0f77b90d898379d8a8510e7777e3b7cc562e36bf03551325c1a8714df41b82c0')

build() {
  cd ${_srcdir}

  patch -p1 -i ../alsa.patch
  patch -p1 -i ../args.patch
  patch -p1 -i ../libs.patch
  patch -p1 -i ../CVE-2012-6303.patch
  patch -p1 -i ../mpg123.patch
  patch -p1 -i ../tksnack.patch
  patch -p1 -i ../warnings.patch
  patch -p1 -i ../warnings2.patch
  patch -p1 -i ../seektell.patch
  patch -p1 -i ../cflags.patch
  patch -p1 -i ../formant.patch
  patch -p1 -i ../configure.patch
  patch -p1 -i ../fix-tests.patch
  patch -p1 -i ../archbuild.patch
  patch -p0 -i ../use-std-gnu17.patch

  cd unix

  ./configure --prefix=/usr \
              --with-tcl=/usr/lib \
              --with-tk=/usr/lib \
              --enable-alsa
  make
  make libsnackmpg.so libsnackogg.so
}

check() {
  cd ${_srcdir}/unix
  make test
}

package() {
  cd ${_srcdir}/unix

  make DESTDIR="${pkgdir}" install
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" ../../copyright
}
