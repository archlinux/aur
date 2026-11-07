# Maintainer:hzyry2046 <hzyry2046@163.com>
# Contributor: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>

_pkgname=mindustry
pkgbase="mindustry-sdl3-bin"
pkgname="mindustry-sdl3-bin"
pkgver=160.7
pkgrel=1
pkgdesc="SDL3 backend version of Mindustry."
url="https://github.com/Anuken/Mindustry"
license=('GPL-3.0-only')
arch=('any')
options=(!debug)

depends=(
  'alsa-lib'
)
makedepends=(
  'libicns'
)

# The SDL3 jar is compiled (with the SDL3 patches) by the build action
# (mindustry-sdl3-bin.yml) and published as a GitHub Release asset on tag
# v$pkgver. PKGBUILD sources that pre-built jar; no source build here.
source=(
  "${pkgname}-${pkgver}.jar::https://github.com/BlackCherryCat/my-aur/releases/download/v${pkgver}/${pkgname}-${pkgver}.jar"
  "icon.icns::https://github.com/Anuken/Mindustry/raw/v${pkgver}/core/assets/icons/icon.icns"
  "${pkgname}.install"
)
noextract=("${pkgname}-${pkgver}.jar")
sha256sums=('a1c3c42a632dda51806451883ba2c8a47484bf24461625e475f5d27669213db3'   # mindustry-sdl3-bin-160.7.jar (compiled SDL3, published as a release asset)
            '80aa3f58c2211188e9586b1ef47892956b0bb4042dcea7ea29e954b996ea786f'   # icon.icns (upstream)
            '7e5451947f90876b86ca8a96a285cdddaa7b426dbe71767c03c66dcfe2ddb966')  # mindustry-sdl3-bin.install

package() {
  depends+=(
    "java-runtime>=$_java_ver"
    'hicolor-icon-theme'
  )

  # icns2png (from makedepends libicns) extracts the upstream Mindustry icon
  # into $srcdir as icon_<size>x<size>x32.png (source is named icon.icns)
  ( cd "$srcdir" && icns2png --extract icon.icns )

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$pkgname.desktop" <<END
[Desktop Entry]
Type=Application
Name=$(sed -E -e "s/-/ /g;s/\b(.)/\u\1/g" <<<"$pkgname")
Comment=$pkgdesc
Exec=$pkgname
Icon=$pkgname
Categories=Game;
Terminal=false
END

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<END
#!/usr/bin/env sh
exec /usr/bin/java -jar /usr/share/java/$pkgname/$pkgname.jar "\$@"
END

  local icon_size
  for icon_size in 256 512 1024; do
    install -Dm644 "icon_${icon_size}x${icon_size}x32.png" \
      "$pkgdir/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/$pkgname.png"
  done

  install -Dm644 "$srcdir/${pkgname}.install" "$pkgdir/etc/pacman.d/${pkgname}.install"

  install -Dm755 "${pkgname}-${pkgver}.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
