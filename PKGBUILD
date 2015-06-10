# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: perpetrator
pkgname=indigo
pkgver=2.4.13
pkgrel=1
pkgdesc="Physically-based unbiased render engine"
arch=('x86_64' 'i686')
url="http://www.indigorenderer.com/"
license=('custom')
depends=('wxgtk' 'libtiff4' 'libjpeg6')
backup=('opt/indigo/inifile.xml')
options=(docs)
install=indigo.install
if [ $CARCH = "x86_64" ]; then
  source=(http://www.indigorenderer.com/dist/beta/indigo_x64_v2.4.13.tar.gz \
          indigo.desktop indigo.png indigo.sh indigo_console.sh \
          http://www.indigorenderer.com/dist/exporters/blendigo/blendigo-linux-2.4.Stable.2.tar.gz)
  md5sums=('bec2669449d62180516c8fd4d5c751ef'
         '3d1ee12344502bda3a41f496e97a4cf4'
         '19fde0fa8b9151f7d2aa56710a1296d6'
         'a186f890883ab81744904a93ff91f56e'
         '09062de09facc7652f8fe9e6e4de635f'
         '401bacee3fe7e8b1272f7e02a0978257')
else
  source=(http://www.indigorenderer.com/dist/beta/indigo_v2.4.13.tar.gz \
          indigo.desktop indigo.png indigo.sh indigo_console.sh \
          http://www.indigorenderer.com/dist/exporters/blendigo/blendigo-linux-2.4.Stable.2.tar.gz)
  md5sums=('bec2669449d62180516c8fd4d5c751ef'
         '3d1ee12344502bda3a41f496e97a4cf4'
         '19fde0fa8b9151f7d2aa56710a1296d6'
         'a186f890883ab81744904a93ff91f56e'
         '09062de09facc7652f8fe9e6e4de635f'
         '401bacee3fe7e8b1272f7e02a0978257')
fi

build() {
  mkdir -p "$pkgdir/opt"

  cd "$srcdir/dist"

  if [ $CARCH = "x86_64" ]; then
    cp -a "${pkgname}_x64_v${pkgver}" \
      "$pkgdir/opt" || return 1
    mv "$pkgdir/opt/${pkgname}_x64_v${pkgver}" "$pkgdir/opt/indigo"
    cd "${pkgname}_x64_v${pkgver}"
  else
    cp -a "${pkgname}_v${pkgver}" \
      "$pkgdir/opt" || return 1
    mv "$pkgdir/opt/${pkgname}_v${pkgver}" "$pkgdir/opt/indigo"
    cd "${pkgname}_v${pkgver}"
  fi

  touch "$pkgdir"/opt/indigo/log.txt
  chmod 777 "$pkgdir"/opt/indigo/log.txt
  rm "$pkgdir"/opt/indigo/changelog.txt
  rm -rf "$pkgdir"/opt/indigo/testscenes

  # documentation
  mkdir -p "$pkgdir"/usr/share/doc/$pkgname
  mv "$pkgdir/opt/indigo/Indigo Manual.pdf" "$pkgdir"/usr/share/doc/$pkgname/IndigoManual.pdf

  cd "$srcdir"

  # install scripts
  install -D -m755 indigo.sh "$pkgdir"/usr/bin/indigo
  install -D -m755 indigo_console.sh "$pkgdir"/usr/bin/indigo_console

  # install desktop file and icon
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # install the license
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  mv "$pkgdir"/opt/indigo/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt

  # install blendigo
  cd "$srcdir/blendigo-linux-2.4.Stable.2/sources"
  mkdir -p "$pkgdir"/usr/share/blender/scripts/bpydata/
  install -Dm644 blendigo.py "$pkgdir/usr/share/blender/scripts/"
  cp -r blendigopkg "$pkgdir/usr/share/blender/scripts/bpydata/"
  echo "/opt/indigo" > "$pkgdir"/usr/share/blender/scripts/bpydata/IndigoWrapper.conf
}

# vim:set ts=2 sw=2 et:
