# Maintainer: Anish Bhatt anish [at] gatech [dot] edu

pkgname='pipelight'
pkgver=0.2.8
pkgrel=2
epoch=1
pkgdesc="A browser plugin which allows one to use windows only plugins inside Linux browser"
url="https://launchpad.net/pipelight"
arch=('i686' 'x86_64')
license=('GPL2' 'LGPL2.1' 'MPL')

depends=('wine-silverlight>=1.7.33-1' 'ttf-ms-fonts' 'wget' 'cabextract' 'unzip' 'gnupg')
if  [[ "$CARCH" == "x86_64" ]]; then
  depends+=('lib32-libsm' 'lib32-libgl')
else
  depends+=('libsm' 'libgl')
fi

optdepends=('zenity: needed for file dialogs',
            'kdebase-kdialog: needed for file dialogs in KDE')

# Set value to 1 if you want to compile pluginloader yourself
_compilepluginloader=0

if [[ $_compilepluginloader != 0 ]]; then
  if [[ "$CARCH" == "x86_64" ]]; then
  makedepends=('mingw-w64-gcc')
  else
  makedepends=('mingw32-gcc')
  fi
fi

makedepends+=('cabextract' 'xz')

#source=("https://bitbucket.org/mmueller2012/pipelight/get/v${pkgver%.*}-${pkgver##*.}.tar.bz2"
#  "https://launchpad.net/pipelight/trunk/0.1/+download/pluginloader-prebuilt-v${pkgver%.*}-${pkgver##*.}.tar.gz")
source=("https://bitbucket.org/mmueller2012/pipelight/get/v${pkgver}.tar.bz2"
  "pluginloader-v${pkgver}.tar.gz::http://repos.fds-team.de/pluginloader/v${pkgver}/pluginloader.tar.gz"
#  "pluginloader-v${pkgver}.tar.gz.sig::http://repos.fds-team.de/pluginloader/v${pkgver}/pluginloader.tar.gz.sig"
  "gnupg_fix.patch")
noextract=("pluginloader-v${pkgver}.tar.gz")

md5sums=('9fcbc7019a49eb0c2f613eaba0e96df6'
         '71b595924b8c8d91c830c2a897362ad2'
#         'SKIP'
         'ac561ff3cc7df2bc3805567780ed545c')

#validpgpkeys=(428B5197DE952586DA520298E49CC0415DC2D5CA) # Sebastian Lackner & Michael Mueller

install=pipelight.install

_srcdir=mmueller2012-pipelight-b7b5e5471d52/

#this changes the install location for the pipelight executables
_prefix=/usr

#change this if your wine-silverlight is installed elsewhere, or if you prefer a different wine directory
_wine=/usr

prepare() {
  pushd $_srcdir

  if [[ $_compilepluginloader == 0 ]]; then
    ln -sf ../pluginloader-v${pkgver}.tar.gz .
    ln -sf ../pluginloader-v${pkgver}.tar.gz.sig .
  fi

  patch -p1 < ../gnupg_fix.patch
  pushd share/

  #in case you want to use 64bit wine, you would need this
  #if [[ "$CARCH" == "x86_64" ]]; then
  #  sed -i 's|Files|Files (x86)|g' configs/pipelight*
  #  sed -i 's|Files|Files (x86)|g' install-dependency
  #fi

  popd
  popd
}

build() {
  pushd $_srcdir
  if [[ $_compilepluginloader == 0 ]]; then
    ./configure --prefix=$_prefix --wine-path=$_wine/bin/wine --gcc-runtime-dlls="" --win32-prebuilt
  else
    ./configure --prefix=$_prefix --wine-path=$_wine/bin/wine --gcc-runtime-dlls="" --win32-static
  fi
  make
  popd
}

package() {
  make -C $_srcdir PREFIX=$_prefix DESTDIR=$pkgdir install

  #if [[ $_compilepluginloader  == 0 ]]; then
  #  install -Dm644 src/windows/pluginloader.exe ${pkgdir}/$_prefix/share/pipelight/.
  #fi
# All plugin creation has now been moved to pipelight.install

# fix man page flags
  chmod 0644 ${pkgdir}/usr/share/man/man1/pipelight-plugin.1
}

# vim:set ts=2 sw=2 et:
