# Mantainer: Guidobelix <guidobelix AT hotmail DOT it>
# Contributor: Mattia Bertoni <mattia DOT b89 AT gmail DOT com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: erm67
# Contributor: ntia89
# Contributor: mattia.b89 <mattia DOT b89 AT gmail DOT com>
# Contributor: Hilinus
#

pkgname=amule-adnza-svn
pkgver=548
pkgrel=1
pkgdesc="aMule patched for Fastweb Network (Italy) by Adunanza forum - SVN development branch"
url='http://amule-adunanza.sourceforge.net/'
license=('GPL')
arch=('i686' 'x86_64' 'arm' 'armv7h')
depends=('wxgtk' 'wxgtk2.8' 'gd' 'geoip' 'libupnp' 'crypto++' 'libsm')
makedepends=('subversion')
conflicts=('amule' 'amule-adnza')
provides=('amule')
source=(
        'fix_icon+comment+name2.patch'
        'amuled.systemd'
        'amuleweb.systemd')
md5sums=(
         'cef300135ba532b171db957ccff0311a'
         '59772c41860e238f1c822feb8ca8d47f'
         '05975c5d94bfc41fddb894d98b1115d5')

_svntrunk=https://svn.code.sf.net/p/amule-adunanza/code/branches/MoonRiver/
_svnmod=mrhydeit

configureopts=(
            --prefix=/usr \
              --mandir=/usr/share/man \
              --enable-cas \
              --enable-wxcas \
              --enable-amule-daemon \
              --enable-amulecmd \
              --enable-amule-gui \
              --enable-alc \
              --enable-alcc \
              --enable-webserver \
              --disable-debug \
              --enable-optimize \
              --enable-ccache \
              --enable-geoip \
              --enable-upnp \
              --with-wxversion=2.8
)

build() {

  cd "${srcdir}"

  if [ -d "${_svnmod}/.svn" ]; then
    (cd "${_svnmod}" && svn up -r "${pkgver}")
  else
    svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_svnmod}-build"
  cp -r "${_svnmod}" "${_svnmod}-build"
  cd "${_svnmod}-build"

  patch -Np0 -i "${srcdir}/fix_icon+comment+name2.patch"

  ./autogen.sh
  ./configure "${configureopts[@]}"
  make
}

package() {
  cd "${srcdir}/${_svnmod}-build"
  make DESTDIR="${pkgdir}/" install
}
