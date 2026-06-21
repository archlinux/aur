# Maintainer: Lone_Wolf <Lone_Wolf@klaas-de-kat.nl>
# Contributor: Evert Vorster <superchief@evertvorster.com>

pkgname=oolite-git
pkgver=1.93.1.184.r0.269131299
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
conflicts=(oolite)
sha512sums=('SKIP'
            '350d9f4e95b1f74385bce62729a197d5ce2b565783cebf187e4b0cc75d8bf0f89996e824a85df15c1609983136919e21dca05bad05a809b5cfc95fee509fab08'
)
options=(!strip !debug)

pkgver() {
  git -C oolite-git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  meson setup $pkgname _build \
    --backend=ninja \
    --wrap-mode=nofallback \
    -D debug=false \
    -D strip_bin=true \
    -D b_lto=true \
    -D prefix=/usr \
    -D bindir=bin \
    -D datadir=share
  meson configure --no-pager _build
  meson compile -C _build
}

package() {
  DESTDIR="$pkgdir" meson install -C _build
  # Create folders where files will be manually placed
  mkdir -p "$pkgdir"/usr/share/{$pkgname/AddOns,applications,icons/hicolor/256x256/apps}
  
  #Resources folder is created under /usr/share/oolite move it and create symlink
  pushd "$pkgdir"/usr/share
  mv oolite/* oolite-git/
  rmdir oolite
  ln -s /usr/share/$pkgname oolite
  popd
  # custom launcher & .desktop related
  install -m755 "$srcdir"/oolite-git.sh "$pkgdir"/usr/bin/oolite-git.sh
  install -m644 $pkgname/Resources/Textures/oolite-logo1.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/space.oolite.Oolite-git.png
  sed -e 's:Name=oolite:Name=oolite-git:' \
    -e 's:Exec=run_oolite.sh:Exec=/usr/bin/oolite-git.sh:' \
    -e 's:Icon=space.oolite.Oolite:Icon=space.oolite.Oolite-git:' \
    -e 's:StartupWMClass=oolite:StartupWMClass=oolite-git:' \
    <$pkgname/installers/FreeDesktop/space.oolite.Oolite.desktop \
    >"$pkgdir"/usr/share/applications/space.oolite.Oolite-git.desktop
  chmod 644 "$pkgdir"/usr/share/applications/space.oolite.Oolite-git.desktop
  
  # debug.oxp
  cp -r $pkgname/DebugOXP/Debug.oxp "$pkgdir"/usr/share/$pkgname/AddOns/Basic-debug.oxp
}
