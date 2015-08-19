# Mantainer Jens Staal <staal1978@gmail.com>

pkgname=openwatcom-v2-git
pkgver=0.r3013.g79c74d0
pkgrel=1
pkgdesc="The Open Watcom C/C++ compiler, github source fork"
arch=('i686' 'x86_64')
url="http://open-watcom.github.io/open-watcom/"
#url="http://www.openwatcom.org"
license=('custom:OWPL-1')
makedepends=('git' 'openwatcom-v2')
optdepend=('openwatcom-v2: skip bootstrapping with gcc' \
            'dosbox: build documentation (wgml)')
provides=('openwatcom-v2')
conflicts=('openwatcom-v2')
replaces=('openwatcom-v2')

source=('watcom'::'git://github.com/open-watcom/open-watcom-v2.git' )
sha256sums=('SKIP')

options=('!strip' '!buildflags' 'staticlibs')

pkgver() {
  cd $srcdir/watcom/

  if GITTAG="$(git describe --abbrev=0 --tags 2>/dev/null)"; then
    echo "$(sed -e "s/^${pkgname%%-git}//" -e 's/^[-_/a-zA-Z]\+//' -e 's/[-_+]/./g' <<< ${GITTAG}).r$(git rev-list --count ${GITTAG}..).g$(git log -1 --format="%h")"
  else
    echo "0.r$(git rev-list --count master).g$(git log -1 --format="%h")"
  fi
}

build() {
  cd $srcdir/watcom
  
  msg "set current source directory and other variables"
  mv setvars.sh setvars.old
  cat setvars.old | sed "s|\/home\/ow\/ow|${PWD}|g" > setvars.sh
  
  source /opt/watcom/owsetenv.sh
  
  chmod +x build.sh
  source setvars.sh
  source cmnvars.sh
  msg "OWROOT is $OWROOT" #testing variables from setvars.sh
  msg "OWSRCDIR is $OWSRCDIR" #testing variables from cmnvars.sh
  msg "WATCOM is $WATCOM"
  msg "OWDEFPATH is $OWDEFPATH"
#  ./clean.sh # make sure everything is pristine
  ./build.sh

  cd bld
  builder rel
}


package() {
 cd $srcdir/watcom/rel
 install -d "$pkgdir/usr/share/licenses/watcom"
 install -Dm644 "$srcdir/watcom/license.txt" "$pkgdir/usr/share/licenses/watcom/license.txt"
 mkdir -p $pkgdir/opt/watcom/{binl,lh,h/{dos,win,nt,os2,os21x},lib286/{dos,win,os2},lib386/{nt,os2}}
 cp -ar * $pkgdir/opt/watcom/
 cp $srcdir/owsetenv.sh $pkgdir/opt/watcom/

 msg "adding some fake binaries to make life easier"
 cd $pkgdir/opt/watcom/binl
 ln -s /usr/bin/true ranlib
 ln -s wlib ar
}

