# Maintainer: rtfreedman  (rob<d0t>til<d0t>freedman<aT>googlemail<d0t>com
# Contributor: Loren Copeland <thisisquitealongname at gm--l> 
# based on jack2 PKGBUILD by Ray Rashif <schiv@archlinux.org>

pkgbase=jack2-git
pkgname=('jack2-git' 'jack2-dbus-git')
#pkgname= # single build (overrides split)
pkgver=3274
pkgrel=1
arch=('i686' 'x86_64')
url="http://jackaudio.org/"
backup=(etc/security/limits.d/99-audio.conf)
license=('GPL')
makedepends=('python2' 'celt' 'opus' 'libsamplerate' 'git' 'libffado')
source=("git+https://github.com/jackaudio/jack2"
        '99-audio.conf'
        '40-hpet-permissions.rules')
md5sums=('SKIP'
         'ae65b7c9ebe0fff6c918ba9d97ae342d'
         '471aad533ff56c5d3cbbf65ce32cadef')

_gitname='jack2'

_pyfix() {
  sed -i 's:bin/env python:bin/env python2:' \
    "$pkgdir/usr/bin/jack_control"
}

_wafconf() {
  # default=64,  kxstudio=256  --clients= 
  # default=768, kxstudio=2048 --ports-per-application= 

  python2 waf configure --prefix=/usr \
    --clients=128 --ports-per-application=1536 \
    --alsa  --firewire $@

  # not building with doxygen
  # see https://github.com/jackaudio/jack2/issues/22
}

_isbuild() {
  printf "%s\n" ${pkgname[@]} | grep -qx $1
}

pkgver() {
  cd jack2
  # get a plain number
  echo $(git rev-list --count master) 
}

prepare() {
  # we may do 2 different builds
  cp -r $_gitname $_gitname-dbus
}

build() {
  cd "$srcdir"

  # Some optimisation bug exists for current GCC
  # see http://gcc.gnu.org/bugzilla/show_bug.cgi?id=53663 ##fixed
  #export CFLAGS="${CFLAGS/-O[0-9]/-O0}"
  #export CFLAGS
  #export CXXFLAGS="$CFLAGS"

  # fix doxygen building
  # TODO: report upstream, but redundant until gihub issue 22 resolves
  #sed -i 's:build/default/html:html:' $_tarname-$pkgver/wscript

  # mixed dbus/classic build
  if _isbuild jack2-git; then
    cd $_gitname
    msg2 "Running Mixed D-Bus/Classic build"
    _wafconf --classic --dbus # --autostart=dbus|none|default|classic
    python2 waf build $MAKEFLAGS
    cd ..
  fi

  # dbus-ONLY build
  if _isbuild jack2-dbus-git; then
    cd $_gitname-dbus
    msg2 "Running D-Bus-only build"
    _wafconf --dbus --autostart=dbus
    python2 waf build $MAKEFLAGS
    cd ..
  fi
}

package_jack2-git() {
  ! _isbuild jack2-git && return 0

  pkgdesc="The next-generation JACK with SMP support"
  depends=('libsamplerate' 'opus' 'celt' 'libffado')
  optdepends=('python2: jack_control')
  conflicts=('jack')
  provides=('jack' 'jackmp' 'jackdmp' 'jackdbus')

  cd "$srcdir/$_gitname"

  python2 waf install --destdir="$pkgdir"

  # fix for major python transition
  _pyfix

  # configure realtime access/scheduling
  # see https://bugs.archlinux.org/task/26343
  install -Dm644 "$srcdir/99-audio.conf" \
    "$pkgdir/etc/security/limits.d/99-audio.conf"

  install -Dm644 "$srcdir/40-hpet-permissions.rules" \
    "$pkgdir/usr/lib/udev/rules.d/40-hpet-permissions.rules"
}

package_jack2-dbus-git() {
  ! _isbuild jack2-dbus-git && return 0

  pkgdesc="The next-generation JACK with SMP support (for D-BUS interaction only)"
  depends=('libsamplerate' 'celt' 'opus' 'libffado')
  optdepends=('python2: jack_control')
  conflicts=('jack' 'jack2')
  provides=('jack' 'jack2' 'jackmp' 'jackdmp' 'jackdbus')

  cd "$srcdir/$_gitname-dbus"

  python2 waf install --destdir="$pkgdir"

  _pyfix

  install -Dm644 "$srcdir/99-audio.conf" \
    "$pkgdir/etc/security/limits.d/99-audio.conf"

  install -Dm644 "$srcdir/40-hpet-permissions.rules" \
    "$pkgdir/usr/lib/udev/rules.d/40-hpet-permissions.rules"
}

# vim:set ts=2 sw=2 et:
