# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=asciiportal
pkgver=1.3
_tag=v$pkgver-beta7
_yamlver=0.3.0
pkgrel=1
pkgdesc='Text based puzzle game inspired by the popular video game'
arch=('x86_64' 'i686')
url='https://github.com/cymonsgames/ASCIIpOrtal'
license=('GPL3')
depends=('sdl' 'sdl_mixer' 'pdcurses' 'yaml-cpp')
makedepends=('imagemagick' 'gendesk' 'pdcurses' 'cmake' 'setconf' 'yaml-cpp' 'boost' 'git')
source=("git://github.com/cymonsgames/ASCIIpOrtal.git#tag=$_tag"
        "${pkgname}_large.png::http://fc01.deviantart.net/fs71/f/2010/318/3/5/portal_ascii_icon___button_by_lightmystic-d32udqx.png"
        "$pkgname.sh"
        "$pkgname.patch"
        "https://yaml-cpp.googlecode.com/files/yaml-cpp-$_yamlver.tar.gz"
        'Makefile.default')
sha256sums=('SKIP'
            '390f21881377b331f1a65a3e54ccf91fba72a88146058cc146f914a1185de9d1'
            'ff3c48f06c0cd29c31c10762468ca90edc28253061a7125b5697ccbb512fcaf9'
            '6f081936081bdf3157b49fbf88882c266bda67c3cd992098a023b558b6d4a481'
            '2cd038b5a1583b6745e949e196fba525f6d0d5fd340566585fde24fc7e117b82'
            'aae5a59733c10942a636024a1bd6d2c4b51ef84a61a2bfec009ce070ca5b2843')

prepare() {
  # Generate desktop shortcut and icon
  gendesk -n -f --pkgname "$pkgname" --pkgdesc "$pkgdesc" --name 'ASCIIpOrtal' \
    --exec "/usr/bin/$pkgname" #--custom "Path=/usr/share/$pkgname"
  convert "${pkgname}_large.png" -resize 48x48\! "$pkgname.png"

  # The ._*.cpp files causes cmake to throw up its hands in exasperation
  find yaml-cpp -name "._*.cpp" -delete

  # Heavy patching for making ASCIIpOrtal compile
  cp -f Makefile.default ASCIIpOrtal/Makefile.default
  cp -r yaml-cpp/include ASCIIpOrtal/src/yaml-cpp
  setconf ASCIIpOrtal/Makefile.default YAML-CPP_VER "$_yamlver"
  sed 's|YAML::Newline|"\\n"|g' -i ASCIIpOrtal/src/ap_maps.cpp
}

build() {
  msg2 "Compiling old static YAML library (version $_yamlver)..."
  cd "yaml-cpp"
  cmake .
  make
  cd ..

  msg2 'Compiling ASCIIpOrtal...'
  make -C ASCIIpOrtal
}

package() {
  cd ASCIIpOrtal

  install -d "$pkgdir/usr/share/$pkgname"

  # Binary and launch script
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname.elf"
  install -Dm755 "../$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

  # Documentation
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"

  # Data files
  cp -r maps media "$pkgdir/usr/share/$pkgname"

  # Desktop shortcut and icon
  install -Dm644 "../$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
