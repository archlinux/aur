# Maintainer: Nicolas Iooss <nicolas.iooss_aur at m4x.org>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com>
#
# This PKGBUILD is maintained on https://github.com/fishilico/funguloids

pkgname=funguloids
pkgver=1.06.4
_realver=1.06-4
pkgrel=12
pkgdesc="3D game about collecting mushrooms in outerspace"
arch=('i686' 'x86_64')
url="http://funguloids.sourceforge.net/"
license=('ZLIB')
makedepends=('boost' 'python')
depends=('boost-libs' 'ogre>=1.10' 'ois>=0.7' 'freealut' 'lua51' 'libogg' 'libvorbis' 'libmad')
source=(http://downloads.sourceforge.net/${pkgname}/${pkgname}-linux-${_realver}.tar.bz2
        funguloids.desktop
        funguloids-alc_error.patch
        funguloids-gcc44.patch
        funguloids-ogre_1.6.patch
        funguloids-strcmp.patch
        size_chunks_reverse.patch
        mpak.py
        funguloids-lua.patch
        openalsoundsystem.cpp.diff
        funguloids-ogre-1.7.0.patch
        funguloids-compilation.patch
        funguloids-boost-system.patch
        funguloids-ogre-1.9.0.patch
        funguloids-ogre-1.10.4.patch
        funguloids-ogre-1.10.8.patch
        funguloids-ois-1.4.patch
        funguloids-ogre-1.11.0.patch
        funguloids-gcc8-ogre-settings.patch)
sha256sums=('e9c9074a5d2de11690484a7e8eef7de9dd7d360ea72185ea35c54976646ef5cf'
            'ceaf1c19d5ed694ff3832320ef6b6b268f73cbf16bc5998c15de47c77298885a'
            '753a8ac858ff21e81f2a3466092e297703d081689ceaa1159fe6cb42d97d06a6'
            'b2b7767da01529ef6944eba3dd6c14c0883e723d6c2658838f186f6809da9695'
            '345c0b54e6ca28a7b243ec9e86a6310062d973f8c35236856b7d66cefc7f9f97'
            '107a0eec5efb2eea99c86d7dad91e28a20ca1f35d4f5eda067ae64c88c9d0304'
            'eb5c821adbc9e6d93f6a78cb40a661e97ffa67eb6ab346913318cbcf3bc66083'
            '12a8cd48b299d9a7de74a9bdae429a4a2489ee8357e9af935e89bf5f417ff157'
            '59de5a0e12cb6575facd0d13d6b28b2d2a1bbfdcdf32dadf0c962c276e961c01'
            'a70e2a40b19f3e0e3c44aa8fa41d866854ce21d111decce1d43f8fba04f7a16c'
            '334831c41160457a4b0162bab349ba77570bbcc0b8e8c63a8e01e8a50c40bd48'
            '4ed88c6502601d684fd7e85dbe33684e36669bdf65583f782b24ddd596dcaf3c'
            'e17a559558d49e493f3f19ae6baa147c64fb37497fb384d31e0d3bc7ae484df1'
            'a007990ef35c249fe4440938553737d14f2dd8377407ee97fecdc6f17b1136ec'
            'd00b04968aaaee97babd99ecca46cc22d567694fdcc341a5ff4124af9b08be95'
            '6d356bf604073f9314ec581439ad4e6d3d4ea00592e6340f6316c61af48bd863'
            'ec9722d796781852bbeeb39d7a8b2493067c15180a8fd807cae2097aedc17074'
            '2bb7a71375256d89e6851bea025ac96a917b90c4299f04af8ef1f6837ef97ead'
            'c9a5a0797bd54fcae56853522fce7e968d1a662453831077504384ffe1790395')

prepare() {
  cd "${srcdir}/${pkgname}"

  # Convert DOS line ending to Unix by removing every CR character
  find . \( -name '*.h' -o -name '*.cpp' -o -name '*.in' -o -name '*.am' \) \
    -exec sed 's/\r//' -i {} \;

  patch -p0 < ../openalsoundsystem.cpp.diff
  patch -p1 < ../funguloids-gcc44.patch
  patch -p0 < ../funguloids-ogre_1.6.patch
  patch -p0 < ../funguloids-strcmp.patch
  patch -p0 < ../size_chunks_reverse.patch
  patch -p0 < ../funguloids-lua.patch
  patch -p1 < ../funguloids-ogre-1.7.0.patch
  patch -p1 < ../funguloids-compilation.patch
  patch -p1 < ../funguloids-boost-system.patch
  patch -p1 < ../funguloids-ogre-1.9.0.patch
  patch -p1 < ../funguloids-ogre-1.10.4.patch
  patch -p1 < ../funguloids-ogre-1.10.8.patch
  patch -p1 < ../funguloids-ois-1.4.patch
  patch -p1 < ../funguloids-ogre-1.11.0.patch
  patch -p1 < ../funguloids-gcc8-ogre-settings.patch

  sed -i -e 's;cp bootstrap.mpk "@gameinstalldir@";cp bootstrap.mpk "$(DESTDIR)@gameinstalldir@";' -e 's;funguloids.mpk "@gameinstalldir@";funguloids.mpk "$(DESTDIR)@gameinstalldir@";' bin/Makefile.in
  sed -i -e 's;cp MarylandInMay.ogg "@musicinstalldir@";cp MarylandInMay.ogg "$(DESTDIR)@musicinstalldir@";' bin/music/Makefile.in
  sed -i -e 's;-llua5.1;-llua;' -e 's;share/games/funguloids;share/funguloids;' \
      -e 's;bininstalldir="${prefix}/games;bininstalldir="${prefix}/bin;' configure.ac
  chmod +x ../mpak.py
  ../mpak.py -e -f bin/bootstrap.mpk -p _bootstrap
  ../mpak.py -e -f bin/funguloids.mpk -p _gamedata
  sed -ri '/^[A-Z]/ s/(.*)/overlay \1/' _bootstrap/*.overlay _gamedata/*.overlay
  sed -ri '/^[A-Z]/ s/(.*)/particle_system \1/' _gamedata/*.particle
  sed -ri 's/^(\t\t\t)(texture_unit) 1/\1\2\n\1{\n\1}\n\1\2/' _gamedata/materials.material

  # OGRE 1.11.0 compatibility
  # Error: ScriptCompiler - unexpected token in Vera.fontdef(1): 'VeraBold'. If this is a legacy script you must prepend the type (e.g. font, overlay).
  sed -ri '/^[A-Z]/ s/(.*)/font \1/' _bootstrap/Vera.fontdef _gamedata/menufont.fontdef
  # Warning: the syntax 'element type(name)' is deprecated use 'overlay_element name type' at OgreDebugPanel.overlay:6
  sed -ri 's/^(\s*)(container|element) ([a-zA-Z0-9]+)\(([a-zA-Z0-9/]+)\)\s*$/\1overlay_element \4 \3/' _bootstrap/*.overlay _gamedata/*.overlay
  # Error: ScriptCompiler - invalid parameters in materials.material(1413): 'cubic_texture .. combinedUVW' is deprecated. Use 'texture .. cubic' instead.
  sed -ri 's/^(\s*)cubic_texture (\S+) combinedUVW(\s*)$/\1texture \2 cubic \3/' _gamedata/materials.material
  # Warning: Overlay: caption value must be enclosed by quotes
  sed -ri 's/^(\s*caption) ([^"]+)$/\1 "\2"/' _bootstrap/*.overlay _gamedata/*.overlay
  # An exception has occured: InvalidStateException: no matching " found for " at line 9 in ScriptLexer::tokenize
  sed -ri 's/^(\s*)glyph " /\1glyph u34 /' _gamedata/menufont.fontdef
  sed -ri 's/^(\s*)glyph \$ /\1glyph u36 /' _gamedata/menufont.fontdef
  sed -ri 's/^(\s*)glyph : /\1glyph u58 /' _gamedata/menufont.fontdef
  sed -ri 's/^(\s*)glyph \{ /\1glyph u123 /' _gamedata/menufont.fontdef
  sed -ri 's/^(\s*)glyph \} /\1glyph u125 /' _gamedata/menufont.fontdef
  # Warning: Plane.mesh is an older format ([MeshSerializer_v1.8]); you should upgrade it as soon as possible using the OgreMeshUpgrade tool.
  OgreMeshUpgrader _gamedata/Asteroid1.mesh
  OgreMeshUpgrader _gamedata/Asteroid2.mesh
  OgreMeshUpgrader _gamedata/Asteroid3.mesh
  OgreMeshUpgrader _gamedata/Base.mesh
  OgreMeshUpgrader _gamedata/Drop.mesh
  OgreMeshUpgrader _gamedata/Mushroom.mesh
  OgreMeshUpgrader _gamedata/Plane.mesh
  OgreMeshUpgrader _gamedata/Tentacle.mesh
  OgreMeshUpgrader _gamedata/Whirler.mesh
  OgreMeshUpgrader _gamedata/WormBall.mesh

  ../mpak.py -c -f bin/bootstrap.mpk _bootstrap/*
  ../mpak.py -c -f bin/funguloids.mpk _gamedata/*
  rm -rf _bootstrap _gamedata

  rm -f build-aux/*
  aclocal
  autoheader
  autoconf
  automake --add-missing
  ./configure --prefix=/usr
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install

  # install desktop file
  install -Dm644 "${srcdir}/funguloids.desktop" \
    "${pkgdir}/usr/share/applications/funguloids.desktop"

  # install license file
  install -Dm644 "${srcdir}/${pkgname}/COPYING" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # use default location for docs
  mv "${pkgdir}/usr/share/docs" "${pkgdir}/usr/share/doc"
}
