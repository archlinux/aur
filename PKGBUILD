# Maintainer: Alexander Jacocks <alexander@redhat.com>

pkgname=1oom
pkgver=1.11.9
pkgrel=1.1
pkgdesc="1oom is a Master of Orion (1993) game engine recreation."
arch=(x86_64)
url=https://sourcecraft.dev/fork1oom/1oom
license=('GPL2')
depends=(sdl2 sdl2_mixer libsamplerate soundfont-fluid)
source=(  "${pkgname}-${pkgver}.tar.gz::https://sourcecraft.dev/api/archive/fork1oom/${pkgname}?rev=tag%3Av${pkgver}&format=tar.gz"
          'Master_of_Orion_cover.png'
          '1oom.desktop'
          '1oom_classic_sdl2.sh' )
noextract=("${pkgname}-${pkgver}.tar.gz")
md5sums=('1cf57e00565dec541168d498d86f4b56'
         '49248e72b7ddc5209cca2c1c61099d85'
         'ccac2feb67cecfc30b8156edf106b7ca'
         '41b52627b2d52b477adcbc2a9a627b37')

prepare() {
  tar -xvf ${pkgname}-${pkgver}.tar.gz --transform "s|^[^/]*|${pkgname}-${pkgver}|"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  autoreconf -fi
  test -d build-native || mkdir build-native
  cd build-native
  ../configure --prefix=/usr
  { test "$(nproc)" -gt 1 && make -j"$(nproc)" ;} || make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build-native"
  make PREFIX="/usr" DESTDIR="${pkgdir}" install

  # install docs
  cd "${srcdir}/${pkgname}-${pkgver}/doc"
  mkdir -p "$pkgdir/usr/share/doc/${pkgname}"
  cp *.txt "$pkgdir/usr/share/doc/${pkgname}/"
  cd ..
  cp AUTHORS CHANGES COMPILING COPYING HACKING NEWS PHILOSOPHY README.md "$pkgdir/usr/share/doc/${pkgname}/"

  # create storage directory for MOO data
  mkdir -p "$pkgdir/usr/share/1oom"

  # install launch script
  mv "$pkgdir/usr/bin/1oom_classic_sdl2" "$pkgdir/usr/bin/1oom_classic_sdl2-bin"
  install -m 0755 "${srcdir}/1oom_classic_sdl2.sh" "$pkgdir/usr/bin/1oom_classic_sdl2"

  # install icon
  install -Dm 0644 ${srcdir}/Master_of_Orion_cover.png $pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname}.png

  # install desktop file
  install -Dm644 ${srcdir}/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
