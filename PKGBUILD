# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Co-Maintainer: Sam Burgos < santiago dot burgos1089 at gmail dot com >
# Contributor: Jan Böhringer <janboe@gmail.com>
# Contributor: Frédérik Paradis <fredy_14@live.fr>
# Contributor: GI_Jack <GI_Jack@hushmail.com>

pkgbase=gtkhash
pkgname=(
  gtkhash
  gtkhash-caja 
  gtkhash-nautilus 
  gtkhash-nemo
  gtkhash-peony 
  gtkhash-thunar
)
pkgver=1.4
pkgrel=2
pkgdesc="A GTK+ utility for computing message digests or checksums"
arch=('i686' 'x86_64' 'mips64el')
url="https://github.com/tristanheaven/gtkhash"
license=('GPL')

makedepends=(
    'dconf'
    'gtk3'
    'intltool' 
    'librsvg' 
    'nettle'
    'xdg-utils'
)

#Add Caja support
if [[ $(xdg-mime query default inode/directory) = caja-folder-handler.desktop ]]; then
makedepends+=(
    'caja'
)

#Add Nautilus support
elif [[ $(xdg-mime query default inode/directory) = org.gnome.Nautilus.desktop ]]; then

makedepends+=(
    'libnautilus-extension'
)

#Add Nemo support
elif [[ $(xdg-mime query default inode/directory) = nemo.desktop ]]; then

makedepends+=(
    'nemo'
)

#Add Peony support
elif [[ $(xdg-mime query default inode/directory) = peony.desktop ]]; then

makedepends+=(
    'peony'
)

#Add Thunar support
elif [[ $(xdg-mime query default inode/directory) = thunar.desktop ]]; then

makedepends+=(
    'thunar'
)

#All file managers must be installed
else
   makedepends+=(
   'caja'
   'libnautilus-extension'
   'nemo'
   'peony'
   'thunar'
)
fi

source=("${url}/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('20b57dbb8f6c6d7323f573c111a11640603a422c5f9da7b302a4981e4adc37c4')

build() {
  cd gtkhash-$pkgver

#build with Caja support only
if [[ $(xdg-mime query default inode/directory) = caja-folder-handler.desktop ]]; then

#makedepends+=(
#    'caja'
#)

  ./configure \
    --prefix=/usr \
    --disable-schemas-compile \
    --enable-gtkhash \
    --enable-linux-crypto \
    --enable-nettle \
    --disable-blake2 \
    --with-gtk=3.0 \
    --enable-caja

#build with Nautilus support only
elif [[ $(xdg-mime query default inode/directory) = org.gnome.Nautilus.desktop ]]; then

#makedepends+=(
#    'libnautilus-extension'
#)


  ./configure \
    --prefix=/usr \
    --disable-schemas-compile \
    --enable-gtkhash \
    --enable-linux-crypto \
    --enable-nettle \
    --disable-blake2 \
    --with-gtk=3.0 \
    --enable-nautilus 

#build with Nemo support only
elif [[ $(xdg-mime query default inode/directory) = nemo.desktop ]]; then

#makedepends+=(
#    'nemo'
#)


  ./configure \
    --prefix=/usr \
    --disable-schemas-compile \
    --enable-gtkhash \
    --enable-linux-crypto \
    --enable-nettle \
    --disable-blake2 \
    --with-gtk=3.0 \
    --enable-nemo

#build with Peony support only
elif [[ $(xdg-mime query default inode/directory) = peony.desktop ]]; then

#makedepends+=(
#    'peony'
#)


  ./configure \
    --prefix=/usr \
    --disable-schemas-compile \
    --enable-gtkhash \
    --enable-linux-crypto \
    --enable-nettle \
    --disable-blake2 \
    --with-gtk=3.0 \
    --enable-peony

#build with Thunar support only
elif [[ $(xdg-mime query default inode/directory) = thunar.desktop ]]; then

#makedepends+=(
#    'thunar'
#)


  ./configure \
    --prefix=/usr \
    --disable-schemas-compile \
    --enable-gtkhash \
    --enable-linux-crypto \
    --enable-nettle \
    --disable-blake2 \
    --with-gtk=3.0 \
    --enable-thunar

#build with all file manager support
else
#   makedepends+=(
#   'caja'
#   'libnautilus-extension'
#   'nemo'
#   'peony'
#   'thunar'
#)
   
  ./configure \
    --prefix=/usr \
    --disable-schemas-compile \
    --enable-gtkhash \
    --enable-linux-crypto \
    --enable-nettle \
    --disable-blake2 \
    --with-gtk=3.0 \
    --enable-caja \
    --enable-nautilus \
    --enable-nemo \
    --enable-peony \
    --enable-thunar
fi

  make

  #./configure --prefix=/usr --disable-schemas-compile --enable-gtkhash \
  #            --enable-linux-crypto --enable-nettle --disable-blake2 --with-gtk=3.0 \
  #            --enable-nemo --enable-nautilus --enable-thunar --enable-caja # ← remove FMs here!
  #make
}

package_gtkhash() {
  depends=(
    'dconf'
    'gtk3' 
    'nettle'
  )

  make -C gtkhash-$pkgver DESTDIR="$pkgdir/" install

  # remove filemanager plugins
  rm -rf "$pkgdir"/usr/lib
}

package_gtkhash-caja() {
  pkgdesc+=' (Caja filemanager plugin)'
  depends=(
    'gtkhash'
    'caja'
)

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-{2,3},nautilus,nemo}
}

package_gtkhash-nautilus() {
  pkgdesc+=' (Nautilus filemanager plugin)'
  depends=(
    'gtkhash'
    'libnautilus-extension'
)

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-{2,3},caja,nemo}
}

package_gtkhash-nemo() {
  pkgdesc+=' (Nemo filemanager plugin)'
  depends=(
    'gtkhash'
    'nemo' 
  )

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-{2,3},nautilus,caja}
}

package_gtkhash-peony() {
  pkgdesc+=' (Peony filemanager plugin)'
  depends=(
    'gtkhash'
    'peony'
)

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{thunarx-{2,3},caja,nemo}
}

package_gtkhash-thunar() {
  pkgdesc+=' (Thunar filemanager plugin)'
  depends=(
    'gtkhash'
    'thunar'
)

  make -C gtkhash-$pkgver/src/nautilus DESTDIR="$pkgdir/" install
  # remove other filemanager plugins
  rm -rf "$pkgdir"/usr/lib/{nautilus,caja,nemo}
}
