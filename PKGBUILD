# Maintainer: Andy Bao <contact at andybao dot me>
_pkgname=spacecadetpinball
pkgname=$_pkgname-git
pkgdesc='Reverse engineered port of "3D Pinball for Windows – Space Cadet" to Linux'
pkgver=2.0.1.r27.g8017734
pkgrel=1
arch=('x86_64' 'i686' 'pentium4' 'aarch64' 'armv7h' 'armv6h')
depends=('sdl2' 'sdl2_mixer')
makedepends=('p7zip' 'cmake' 'git')
optdepends=('freepats-general-midi: Soundfont for playing background music')
provides=("$_pkgname")
conflicts=("$_pkgname")
license=('MIT' 'proprietary')
noextract=('Space_Cadet.rar' 'Full%20tilt%20pinball.iso')
url="https://github.com/k4zmu2a/SpaceCadetPinball"
source=(
  'https://archive.org/download/SpaceCadet_Plus95/Space_Cadet.rar'
  'https://archive.org/download/win311_ftiltpball/FULLTILT.ZIP'
  "$pkgname::git+$url"
  'spacecadetpinball.desktop'
)
sha256sums=('3cc5dfd914c2ac41b03f006c7ccbb59d6f9e4c32ecfd1906e718c8e47f130f4a'
            '183a2219865b3f2199403928b817b7c967837ea6298de14fb8a379944c7b4599'
            'SKIP'
            'SKIP')

_FT_BASEDIR="CADET"
prepare() {
  7z x -y Space_Cadet.rar -oSpace_Cadet/
  7z x -y 'FULLTILT.ZIP' -oFullTilt/ "$_FT_BASEDIR/CADET.DAT" "$_FT_BASEDIR/SOUND/*"
}

pkgver() {
  cd "$pkgname"
  # cutting off 'Release_' prefix that presents in the git tag
  git describe --long | sed 's/^Release_//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # -DNDEBUG is required, otherwise you get: "Package contains reference to $srcdir"
  # You can also change -DCMAKE_BUILD_TYPE to "Release" however this goes against Arch packaging guidelines
  LDFLAGS="$LDFLAGS -DNDEBUG" CXXFLAGS="$CXXFLAGS -DNDEBUG" cmake -B "$pkgname/build" -S "$pkgname" \
      -Wno-dev \
      -DCMAKE_BUILD_TYPE=None \
      -DCMAKE_INSTALL_PREFIX=/usr
  make -C "$pkgname/build"
}

package() {
  # Install binary
  install -Dm0755 "$pkgname/bin/SpaceCadetPinball" "$pkgdir/usr/lib/$_pkgname/$_pkgname"
  # Install wrapper script
  install -Dm0755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" <<END
#!/bin/sh

# Configure soundfonts if not already configured
if [ -z "\$SDL_SOUNDFONTS" ]; then
  DEFAULT_SOUNDFONT="/usr/share/soundfonts/default.sf2"
  if [ -f "\$DEFAULT_SOUNDFONT" ]; then
    # Use default soundfont since it exists
    export SDL_SOUNDFONTS="\$DEFAULT_SOUNDFONT"
  else
    # Use first available soundfont
    export SDL_SOUNDFONTS="\$(find /usr/share/soundfonts -type f,l -print -quit 2> /dev/null)"
  fi
fi

# Run program in correct directory so it can find it's resources
cd /usr/lib/$_pkgname
exec ./$_pkgname "\$@"
END

  # Install original game files
  cd Space_Cadet
  # Install resources
  install -m0644 PINBALL.DAT *.MID Sounds/*.WAV -t "$pkgdir/usr/lib/$_pkgname"
  # Install documentation
  install -Dm0644 PINBALL.DOC TABLE.BMP -t "$pkgdir/usr/share/doc/$_pkgname"
  cd ..

  # Install full tilt game files
  cd "FullTilt/$_FT_BASEDIR"
  install -m0644 CADET.DAT -t "$pkgdir/usr/lib/$_pkgname"
  install -Dm0644 SOUND/* -t "$pkgdir/usr/lib/$_pkgname/SOUND"
  cd "$srcdir"

  # Install icon
  install -Dm0644 "$pkgname/SpaceCadetPinball/Icon_1.ico" "$pkgdir/usr/lib/$_pkgname/icon.ico"
  # Install desktop launcher
  install -Dm644 spacecadetpinball.desktop -t "$pkgdir/usr/share/applications"
}
