# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>

pkgname=skype
pkgver=4.3.0.37
pkgrel=8
arch=('i686' 'x86_64')
pkgdesc="P2P software for high-quality voice communication"
url="http://www.skype.com/"
license=('custom')
options=('!strip')
depends=(xdg-utils hicolor-icon-theme)
optdepends=('pulseaudio: audio support/voice chatting'
            'pavucontrol: volume adjustment'
            'libao: microphone support')
source=(http://download.skype.com/linux/$pkgname-$pkgver.tar.bz2 PERMISSION skype-wrapper)
md5sums=('95db8f2072b9acd6f79ed42da3d6db79'
         '26e1772379d4d4df9471b6ed660a6d97'
         '66985be1d7b953fb9f73ba6ed749812b')

if [[ $CARCH == 'i686' ]]; then
  depends+=(libpulse qt4 libxss libxv libxcursor v4l-utils qtwebkit)
  optdepends+=('libcanberra: XDG sound support')
else
  depends+=(lib32-{libpulse,qt4,libxss,libxv,libxcursor,v4l-utils})
  optdepends+=('lib32-libcanberra: XDG sound support'
               'lib32-alsa-plugins: microphone support')
  source+=(https://archive.archlinux.org/packages/l/lib32-qt4/lib32-qt4-4.8.7-4-x86_64.pkg.tar.xz)
  md5sums+=('399f232b39602f42c318443471a258b6')
fi

package() {
  cd "$srcdir/$pkgname-$pkgver"

  if [[ $CARCH == i686 ]]; then
	  libdir="usr/lib"
  else
	  libdir="usr/lib32"
  fi

  install -d "$pkgdir/usr/bin"
  sed "s#@LIBDIR@#/$libdir#" "$srcdir/skype-wrapper" > "$pkgdir/usr/bin/skype"
  chmod 755 "$pkgdir/usr/bin/skype"

  # Executable
  install -D skype "$pkgdir/$libdir/skype/skype"

  # Data
  mkdir -p "$pkgdir"/usr/share/skype/{avatars,lang,sounds}
  install -m 644 avatars/* "$pkgdir/usr/share/skype/avatars"
  install -m 644 lang/*    "$pkgdir/usr/share/skype/lang"
  install -m 644 sounds/*  "$pkgdir/usr/share/skype/sounds"

  # DBus Service
  install -Dm 644 skype.conf \
    "$pkgdir/etc/dbus-1/system.d/skype.conf"

  # Icons
  for _i in 16 32 48; do
    install -Dm 644 icons/SkypeBlue_${_i}x${_i}.png \
      "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/skype.png"
  done
  install -Dm 644 icons/SkypeBlue_48x48.png \
    "$pkgdir/usr/share/pixmaps/skype.png"

  # Desktop file
  install -Dm 644 skype.desktop \
    "$pkgdir/usr/share/applications/skype.desktop"

  # License
  install -Dm 644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 "$srcdir/PERMISSION" \
    "$pkgdir/usr/share/licenses/$pkgname/PERMISSION"

  # Fix for buggy libQtWebKit from lib32-qt4. https://bbs.archlinux.org/viewtopic.php?pid=1664995#p1664995
  if [[ $CARCH == 'x86_64' ]]; then
    install -D -m 644 "$srcdir/usr/lib32/libQtWebKit.so.4.9.4" "$pkgdir/usr/share/skype/lib/libQtWebKit.so.4"
  fi
}
