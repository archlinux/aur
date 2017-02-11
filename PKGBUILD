# Maintainer: Metamer <metamer@openmailbox.org>
# Contributors: ytterbium <ytterbium@github>
# Contributors: Andrew Dorney <andrewd18@github>


pkgname=dwarffortress-lnp-git
pkgver=43.03
_pkgver=43_03
_dfhack_pkgrel=r1
pkgrel=8
epoch=0
pkgdesc="Installer for the Lazy Newb Pack to run Dwarf Fortress. Includes vanilla dwarf fortress, dfhack and graphics"
arch=(x86_64)
url=""
license=('custom')
groups=()
depends=(python gtk2 glu sdl_image libsndfile sdl_ttf glew tk
        hicolor-icon-theme)

optdepends=('lib32-nvidia-utils: If you have nvidia graphics'
           'lib32-catalyst-utils: If you have ATI graphics'
           'lib32-alsa-lib: for alsa sound'
           'lib32-libpulse: for pulse sound'
           'java-environment: for announcement filter')

optdepends+=("dwarftherapist-git: call dwarftherapist through gui"
            "soundsense: call soundsense through gui")
# For 64 bits:
depends_x86_64=(gcc-libs-multilib lib32-gtk2 lib32-glu lib32-sdl_image lib32-libsndfile lib32-openal
        lib32-libxdamage lib32-ncurses lib32-sdl_ttf lib32-glew
        lib32-libjpeg6-turbo lib32-libpng12)

# For the LNP
makedepends=(git mercurial rsync perl-libxml perl-xml-libxslt cmake)

makedepends_x86_64=(gcc-multilib)
options=(!strip !buildflags)
install=${pkgname}.install
changelog=
source=(git+"https://github.com/Lazy-Newb-Pack/Lazy-Newb-Pack-Linux"
        git+"https://github.com/DFgraphics/Afro-Graphics.git"#tag=${pkgver}
        git+"https://github.com/DFgraphics/CLA.git"#tag=43.04-v23
        git+"https://github.com/DFgraphics/GemSet.git"#tag=${pkgver}
        git+"https://github.com/DFgraphics/Ironhand.git"#tag=${pkgver}
        git+"https://github.com/DFgraphics/Jolly-Bastion.git"#tag=${pkgver}
        git+"https://github.com/DFgraphics/Mayday.git"#tag=43.04
        git+"https://github.com/DFgraphics/Obsidian.git"#tag=${pkgver}
        git+"https://github.com/DFgraphics/Phoebus.git"#tag=${pkgver}
        git+"https://github.com/DFgraphics/Spacefox.git"#tag=${pkgver}
        git+"https://github.com/DFgraphics/Taffer.git"
        git+"https://github.com/DFgraphics/Tergel.git"#tag=${pkgver}
        git+"https://github.com/DFgraphics/Wanderlust.git"#tag=43.04
        git+"https://github.com/DFHack/dfhack.git"#tag=0.${pkgver}-${_dfhack_pkgrel}
        git+"https://github.com/svenstaro/dwarf_fortress_unfuck.git"#tag=0.${pkgver}
        git+"https://github.com/mifki/df-twbt.git"#tag=v5.70
        hg+"https://bitbucket.org/Pidgeot/python-lnp"
        "http://bay12games.com/dwarves/df_${_pkgver}_linux.tar.bz2"
        'DFAnnouncementFilter.zip'::'http://dffd.bay12games.com/download.php?id=7905&f=DFAnnouncementFilter.zip'
        "dfhack-twbt.patch"
        "dfhack-visualizers.patch"
        "lnp"
        "${pkgname}.desktop"
        "${pkgname}.install"
        )

noextract=()

md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '17d9ceb486fd476b4c6e8f0834d21d2e'
         'affd6273731c321d364c55a8da314fea'
         '856c54681faed3608cd951bf286d12d5'
         '5cc79b5dc202d8faa02086293badfcee'
         '389e34b6937f843c8f635d5e7326c9fc'
         'bba8ab4d3f70cea8b812e78445fef1f0'
         '6a87f6069f54645847b846833ff62d5a')



prepare() {

  cd $srcdir/Lazy-Newb-Pack-Linux
  git submodule init
  git submodule update

  rm -rf $srcdir/DFgraphics/graphics-packs
  mkdir -p $srcdir/DFgraphics/graphics-packs
  for pack in Afro-Graphics CLA GemSet Ironhand Jolly-Bastion Mayday Obsidian \
    Phoebus Spacefox Taffer Tergel Wanderlust; do
    mv $srcdir/${pack} $srcdir/DFgraphics/graphics-packs
  done

  cd $srcdir/dfhack
  git submodule init
  git submodule update

  cd $srcdir/dfhack/plugins
  patch -uN CMakeLists.custom.txt $srcdir/dfhack-twbt.patch

  cd $srcdir/dfhack/plugins
  patch -uN CMakeLists.txt $srcdir/dfhack-visualizers.patch

  mkdir -p $srcdir/dfhack/plugins/df-twbt
  cd $srcdir/df-twbt
  rsync -av --progress $srcdir/df-twbt $srcdir/dfhack/plugins \
    --exclude .git \
    --exclude .gitignore

  export DFHACKVER="${pkgver}-${_dfhack_pkgrel}"

  cd $srcdir/dfhack/build
  cmake .. -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/$pkgname/df_linux \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS} ${CPPFLAGS} -fPIC" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} ${CPPFLAGS} -fPIC" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS:STRING="${LDFLAGS}"

  cd $srcdir/dwarf_fortress_unfuck
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=$pkgdir/opt/$pkgname/df_linux/libs \
    -DCMAKE_C_FLAGS:STRING="${CFLAGS} ${CPPFLAGS} -fPIC" \
    -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} ${CPPFLAGS} -fPIC" \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
    -DCMAKE_SHARED_LINKER_FLAGS:STRING="${LDFLAGS}"


}
build() {

  export DFHACKVER="${pkgver}-r3"

  cd $srcdir/dwarf_fortress_unfuck
  cd build
  make

  cd $srcdir/dfhack/build
  make

}
package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  install -Dm755 "$srcdir/Lazy-Newb-Pack-Linux/pack/startlnp" "$pkgdir/opt/$pkgname/"

  cp -r "$srcdir/Lazy-Newb-Pack-Linux/pack/df_linux" "$pkgdir/opt/$pkgname"

  cp -r "$srcdir/df_linux" "$pkgdir/opt/$pkgname"
  rm -rf "$pkgdir/opt/$pkgname/df_linux/g_src"

  #rm "$pkgdir/opt/$pkgname/df_linux/libs/"{libgraphics.so,libgcc_s.so.1,libstdc++.so.6}

  install -Dm755 "$srcdir/dwarf_fortress_unfuck/build/libgraphics.so" \
    "$pkgdir/opt/$pkgname/df_linux/libs/libgraphics.so"

  cd "$srcdir/dfhack/build"
  make install

  cp -r $srcdir/Lazy-Newb-Pack-Linux/pack/LNP "$pkgdir/opt/$pkgname/LNP"

  rsync -ap "$srcdir/python-lnp" "$pkgdir/opt/$pkgname" \
    --exclude .hg \
    --exclude .hgtags \
    --exclude .hgignore \

  cd "$pkgdir/opt/$pkgname"

  ln -s "/opt/$pkgname/python-lnp/launch.py" "$pkgdir/opt/$pkgname/PyLNP"

  rsync -ap $srcdir/DFgraphics/graphics-packs/* "$pkgdir/opt/$pkgname/LNP/Graphics" \
    --exclude .git \
    --exclude .gitmodules \
    --exclude .gitignore

  #move libs
  install -dm755 "$pkgdir/usr/lib/$pkgname/df_linux"

  install -dm755 "$pkgdir/usr/lib/$pkgname/df_linux/hack"

  mv "$pkgdir/opt/$pkgname/df_linux/hack/plugins" \
    "$pkgdir/usr/lib/$pkgname/df_linux/hack"

  ln -s "/usr/lib/$pkgname/df_linux/hack/plugins" \
    "$pkgdir/opt/$pkgname/df_linux/hack/plugins"

  mv "$pkgdir/opt/$pkgname/df_linux/hack/libs" \
    "$pkgdir/usr/lib/$pkgname/df_linux/hack"

  ln -s "/usr/lib/$pkgname/df_linux/hack/libs" \
    "$pkgdir/opt/$pkgname/df_linux/hack/libs"

  mv "$pkgdir/opt/$pkgname/df_linux/libs" \
    "$pkgdir/usr/lib/$pkgname/df_linux"

  ln -s "/usr/lib/$pkgname/df_linux/libs" \
    "$pkgdir/opt/$pkgname/df_linux/libs"

  for _lib in libruby.so liblua.so libdfhack-client.so libdfhack.so\
    libprotobuf-lite.so; do

    mv "$pkgdir/opt/$pkgname/df_linux/hack/$_lib" \
      "$pkgdir/usr/lib/$pkgname/df_linux/hack"

    ln -s "/usr/lib/$pkgname/df_linux/hack/$_lib" \
      "$pkgdir/opt/$pkgname/df_linux/hack/$_lib"
  done

  mv "$pkgdir/opt/$pkgname/df_linux/dfhack-run" \
    "$pkgdir/usr/lib/$pkgname/df_linux"

  ln -s "/usr/lib/$pkgname/df_linux/dfhack-run" \
    "$pkgdir/opt/$pkgname/df_linux/dfhack-run"

  mv "$pkgdir/opt/$pkgname/df_linux/hack/binpatch" \
    "$pkgdir/usr/lib/$pkgname/df_linux/hack"

  ln -s "/usr/lib/$pkgname/df_linux/hack/binpatch" \
    "$pkgdir/opt/$pkgname/df_linux/hack/binpatch"

  # create bin
  install -Dm755 "$srcdir/lnp" "$pkgdir/usr/bin/lnp"


  test ! -z "$(which dwarftherapist)" \
    && mkdir -p "$pkgdir/opt/$pkgname/LNP/Utilities/dwarf_therapist" \
    && ln -s "$(which dwarftherapist)" "$pkgdir/opt/$pkgname/LNP/Utilities/dwarf_therapist/DwarfTherapist"

  test ! -z "$(which soundsense)" \
    && mkdir -p "$pkgdir/opt/$pkgname/LNP/Utilities/soundsense" \
    && ln -s "$(which soundsense)" \
  "$pkgdir/opt/$pkgname/LNP/Utilities/soundsense/soundSense.sh"

  mkdir -p "$pkgdir/opt/$pkgname/LNP/Utilities/df_announcement_filter"
  install -dm755 "$pkgdir/opt/$pkgname/LNP/Utilities/df_announcement_filter"
  install -Dm755 "$srcdir/DFAnnouncementFilter.jar" \
    "$pkgdir/opt/$pkgname/LNP/Utilities/df_announcement_filter"


  install -Dm644 "${srcdir}/${pkgname}.desktop" \
    "$pkgdir/usr/share/applications/lnp.desktop"

  install -Dm644 "${srcdir}/Lazy-Newb-Pack-Linux/pack/dflogo128.png" \
    "$pkgdir/usr/share/icons/hicolor/128x128/apps/lnp.png"

  for license in python-lnp/COPYING.txt dfhack/depends/protobuf/COPYING.txt \
    dfhack/plugins/stonesense/LICENSE dfhack/LICENSE.rst \
    ; do
    install -DTm644 "$srcdir/$license" \
    "${pkgdir}/usr/share/licenses/${pkgname}/$license"
  done

  for license in df_linux/data/art/font df_linux/sdl/sdl ; do
    install -DTm644 "$srcdir/$license license.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/$license license.txt"
  done

  # Set world-readable for files and executable for dirs
  find ${pkgdir} -type d -exec chmod a+rx {} +
  find ${pkgdir} -type f -exec chmod a+r {} +

}
