# Contributor: Jaroslaw Swierczynski <swiergot@aur.archlinux.org>
# Contributor: Ignas Anikevicius <anikevicius+arch@gmail.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

_pkgname=skype
pkgname=skype-classic
pkgver=4.3.0.37
pkgrel=2
arch=(i686 x86_64)
pkgdesc="P2P software for high-quality voice communication"
url="http://www.skype.com/"
license=('custom')
options=('!strip')
install=skype.install
depends=(xdg-utils hicolor-icon-theme)


if [[ $CARCH == i686 ]]; then
  depends+=(qt4 pulseaudio libxss libxv libxcursor v4l-utils gstreamer0.10-base)
  optdepends=('libcanberra: XDG sound support'
              'notification-daemon: native notification support')
else
  depends+=(lib32-{qt4,libpulse,libxss,libxv,libxcursor,v4l-utils})
  optdepends=('lib32-libcanberra: XDG sound support'
              'notification-daemon: native notification support')
fi

source=(http://download.skype.com/linux/$_pkgname-$pkgver.tar.bz2
        PERMISSION
        skype-wrapper
        http://mirror2.evolution-host.com/archlinux/other/skype/qtwebkit-2.2.2-i686.tar.xz
        https://linuxtv.org/downloads/v4l-utils/v4l-utils-1.12.6.tar.bz2
)

md5sums=('95db8f2072b9acd6f79ed42da3d6db79'
         '26e1772379d4d4df9471b6ed660a6d97'
         '34c11fd22ea5c052533b437ceed05aec'
         '42c01ffa98e32b59605403efb42c8821'
         '9805ff48a4d470669b707731386b67c9')

build()
{
  cd "$srcdir/v4l-utils-1.12.6"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=//usr/share/skype/ --libdir=//usr/share/skype/lib32 --sysconfdir=/etc
  make -C lib
}

package() {
  cd "$srcdir/v4l-utils-1.12.6"
  MAKEFLAGS="-j1" make -C lib install DESTDIR="${pkgdir}"
  
  cd "$srcdir/$_pkgname-$pkgver"

  if [[ $CARCH == i686 ]]; then
      libdir="usr/lib"
  
      # FS#33417 - Skype wants qtwebkit 2.2.x
      install -Dm755 "${srcdir}"/libQtWebKit.so.4 "${pkgdir}"/usr/share/skype/lib/libQtWebKit.so.4
  else
      libdir="usr/lib32"
      install -Dm755 "${srcdir}"/libQtWebKit.so.4 "${pkgdir}"/usr/share/skype/lib/libQtWebKit.so.4
  fi

  install -d "$pkgdir/usr/bin"
  sed "s#@LIBDIR@#/$libdir#" "$srcdir/skype-wrapper" > "$pkgdir/usr/bin/skype"
  chmod 755 "$pkgdir/usr/bin/skype"

  # Executable
  install -D skype "$pkgdir/$libdir/skype/skype"
  sed -i 's/4\.3\.0\.37/8\.28\.0\.4/' "$pkgdir/$libdir/skype/skype"

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
    
  sed -i "s/Name=Skype/Name=Skype Classic/g" "$pkgdir/usr/share/applications/skype.desktop"
}
