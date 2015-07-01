# Contributor: Jed Liu <jed@litech.org>
pkgname=pidgin-icon-override-svn
pkgver=3
pkgrel=3
pkgdesc="Pidgin Prpl Icon Override"
arch=('i686' 'x86_64')
url="http://pidgin-icon-override.googlecode.com/"
license=('GPL3')
groups=()
depends=('pidgin')
makedepends=('subversion')
provides=('pidgin-icon-override')
conflicts=('pidgin-icon-override')
replaces=()
backup=()
options=()
install=
#source=(makefile.patch facebook16.png facebook22.png facebook48.png google-talk48.png)
source=(makefile.patch google-talk48.png)
noextract=()
md5sums=('d1f0dee924cf049862d166ed8ceebb9d'
         'e2155e15532ef0c87a30b27dde9116b3')
sha1sums=('1ffa0306f69d2bfe1e4df89770c3061a6ae485ef'
          'fa17f073a65b8b47e814759c3a10976fd3d92dde')
sha256sums=('c8e0d8516e9b8e35d9c72bb91c6a0dacf921db3cef3fe96e81762a126e95fa24'
            'ef6303b968f7ea4129571bdeea5b3eb1a576ba35b7876ee23a1d891a2b997c1f')
sha384sums=('3d371d2ab2b3933073e85d1533fe925f6cbcf2e45c293545ff71aee6021d1906fc15a86f77df534f91e9e336c16ee8b0'
            '920597cec4f04f54e569d310f025eb970e46dd8ab71248df00af1ca516e8f12fcae443a6026612a47161da12b8557ca9')
sha512sums=('f380e8ba8e4fffd8eb7d9c5050897705d0dca1e4de70b8837b2d20fed3f3831afda32dd2ffe963daf526f083bae249a048c213a38eaa7dc411ae2cbb4b72da8d'
            'ae9966c1fc490e87b8cf1703fa034892ac733a23b517db0c667675cb3dba5eb10494d81cf7f0a14790f3b763ea710ec3f1b3d17d2da1e3eae56c955b904e85bd')

_svntrunk=http://pidgin-icon-override.googlecode.com/svn/trunk/
_svnmod=pidgin-icon-override-read-only

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  patch < ${srcdir}/makefile.patch

  #
  # BUILD
  #
  make icon_override.so
}

package() {
  cd "${srcdir}"

  install -D -m 0755 ${_svnmod}-build/icon_override.so \
    ${pkgdir}/usr/lib/purple-2/icon_override.so
#  for i in 16 22 48 ; do
#    install -D -m 0644 ${srcdir}/facebook${i}.png \
#      ${pkgdir}/usr/share/pixmaps/pidgin/protocols/${i}/facebook.png || return 1
#  done

  install -D -m 0644 google-talk48.png \
    ${pkgdir}/usr/share/pixmaps/pidgin/protocols/48/google-talk.png
}
