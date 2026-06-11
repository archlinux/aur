# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
pkgver=1.93.1.182.r0.5083ea425
pkgrel=1
pkgdesc="Open Source remake of Elite with many, many enhancements, git version"
arch=('x86_64')
url="https://oolite.space/"
license=('GPL-2.0-or-later')
groups=('game')
depends=(bash libglvnd glibc zlib gnustep-base hicolor-icon-theme libstdc++ libobjc libgcc 
          espeak-ng glu nspr openal sdl3 libvorbis libpng)
makedepends=(gcc-objc git mozillajs-linux-bin meson ninja gnustep-make)
source=(oolite-git::git+https://github.com/OoliteProject/oolite
        oolite-git.sh
)

sha512sums=('SKIP'
            '569d6ec72266c8651a2140b663192ca558a4de59a26d2d3ee6659b96a1f7a3c8c945638b59532c0c5a6740e4b374bae28a771f70c9d209f39368e792f2251e6a')
options=(!strip)

pkgver() {
  git -C oolite-git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  meson setup $pkgname _build \
    --backend=ninja \
    -D debug=false \
    -D strip_bin=true \
    -D b_lto=true \
    --wrap-mode=nofallback \
    -D prefix=/usr
  meson configure --no-pager _build
  meson compile -C _build
}

package() {
  DESTDIR="$pkgdir" meson install -C _build
  # Correct file locations
  mkdir -p "$pkgdir"/usr/bin
  mkdir -p "$pkgdir"/usr/share/{$pkgname/AddOns,applications,icons/hicolor/256x256/apps}
  mv $pkgdir/usr/oolite $pkgdir/usr/share/$pkgname/
  cp _build/oolite.app/run_oolite.sh $pkgdir/usr/share/$pkgname/
  cp -r _build/oolite.app/Resources $pkgdir/usr/share/$pkgname
  
  # custom launcher & .desktop related
  install -D -m755 "$srcdir"/oolite-git.sh "$pkgdir"/usr/bin/oolite-git.sh
  install -D -m644 $pkgname/Resources/Textures/oolite-logo1.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/space.oolite.Oolite.png
  sed -e 's:Name=oolite:Name=oolite--git:' \
    -e 's:Exec=run_oolite.sh:Exec=/usr/bin/oolite-git.sh:' \
    -e 's:StartupWMClass=oolite:StartupWMClass=oolite-git:' \
    <$pkgname/installers/FreeDesktop/space.oolite.Oolite.desktop \
    >"$pkgdir"/usr/share/applications/space.oolite.Oolite-git.desktop
  chmod 644 "$pkgdir"/usr/share/applications/space.oolite.Oolite-git.desktop
  
  # debug.oxp
  cp -r $pkgname/DebugOXP/Debug.oxp "$pkgdir"/usr/share/$pkgname/AddOns/Basic-debug.oxp
}
