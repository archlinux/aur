# Maintainer: Martchus <martchus@gmx.net>
# Contributor: ant32 <antreimer@gmail.com>
# Contributor: Filip Brcic <brcha@gna.org>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# See the comment below for additional dependencies/functionality.

_qt_module=qtwebkit
pkgname=mingw-w64-qt5-webkit
pkgver=5.6.0
pkgrel=2
arch=('any')
pkgdesc="Classes for a WebKit2 based implementation and a new QML API (mingw-w64)"
depends=('mingw-w64-qt5-declarative'
         'mingw-w64-qt5-sensors'
         'mingw-w64-qt5-location'
         'mingw-w64-qt5-multimedia'
         'mingw-w64-angleproject'
         'mingw-w64-fontconfig'
         'mingw-w64-libpng'
         'mingw-w64-libjpeg-turbo'
         'mingw-w64-libxslt'
         'mingw-w64-zlib'
         'mingw-w64-icu'
         'mingw-w64-sqlite'
         'mingw-w64-libwebp')
# these dependencies will enable further functionality
#depends+=('mingw-w64-webchannel')
#depends+=('mingw-w64-gst-plugins-base')
#optdepends+=('mingw-w64-gst-plugins-good: Webm codec support')
makedepends=('mingw-w64-gcc' 'python' 'gperf' 'ruby' 'mingw-w64-pkg-config')
options=('!strip' '!buildflags' 'staticlibs')
license=("custom, FDL, GPL3, LGPL")
url="https://www.qt.io/"
_pkgfqn="${_qt_module}-opensource-src-${pkgver}"
groups=(mingw-w64-qt mingw-w64-qt5)
source=("https://download.qt.io/community_releases/${pkgver:0:3}/${pkgver}/${_pkgfqn}.tar.xz"
        qt5-qtwebkit-dont-depend-on-icu.patch
        qt5-qtwebkit-enable-pkgconfig-support-for-win32-target.patch
        qt5-qtwebkit-fix-compatibility-with-latest-angle.patch
        qt5-qtwebkit-use-correct-icu-libs.patch
        qt5-qtwebkit-workaround-build-breakage-after-svn-commit-136242.patch
        qtwebkit-dont-use-bundled-angle-libraries.patch
        qtwebkit-opensource-src-5.0.1-debuginfo.patch
        revert-qt4-unicode-removal.patch
        webkit-commit-151422.patch
        qt5-webkit-pthread.patch)
md5sums=('b68565d18db63ee4db998bb8e37608a5'
         'ce7d257e2b5b94fe3affd98f52d99d09'
         'ac574de962545d6a9e975b4db63c3e09'
         '4ad37c7d4dda8e77bb0a25c671f79adc'
         '228f28df2b10e417a325176f7878ebe1'
         '18b21fd8e9517f48db7748544d2aa92f'
         'f452210683386f9c28f04d7dea0ecfc7'
         '6aba6468efafb64943887079e258b799'
         '4e374836f26853b4d82be0e87aa584a5'
         'c36fe581e0f3b61cef19415782b257ca'
         'f65286024f65ca87837171272fc8975d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgfqn}"

  # see description inside the patch file
  patch -p1 -i ../qt5-webkit-pthread.patch

  # note: most patches are originally from http://pkgs.fedoraproject.org/git/rpms/mingw-qt5-qtwebkit.git
  # however, I needed to update most of them in order to update to 5.6.0 and to use the latest ANGLE

  # The ICU libraries used for cross-compilation are named exactly the same as their native Linux counterpart
  patch -p1 -b -i ../qt5-qtwebkit-use-correct-icu-libs.patch

  # By default the build system assumes that pkg-config isn't used for the win32 target
  # However, we're using it in the Fedora MinGW toolchain so make sure it is used automatically
  patch -p0 -b -i ../qt5-qtwebkit-enable-pkgconfig-support-for-win32-target.patch

  # Make sure the bundled copy of the ANGLE library isn't used
  patch -p1 -b -i ../qtwebkit-dont-use-bundled-angle-libraries.patch

  # qt5-webkit depends on qt5-base with ICU support.
  # As ICU support in qtbase also introduces over 20MB of additional dependency
  # bloat (and the qtbase libraries itself are only 13MB) the decision was made
  # to build qtbase without ICU support.
  # Make sure qtwebkit doesn't depend on a qtbase with ICU support any more
  patch -p1 -b -i ../qt5-qtwebkit-dont-depend-on-icu.patch

  # Undo the removal of the old Qt4 based unicode support
  # as we want to use it instead of the bloated ICU
  patch -p1 -R -b -i ../revert-qt4-unicode-removal.patch

  # WebKit svn commit 136242 implemented a split into QtWebKit and QtWebKitWidgets
  # Due to this change a static library named WebKit1.a is created first.
  # After this a shared library is created named Qt5WebKit.dll which contains
  # the contents of this static library and some other object files.
  # However, various symbols in the static library are expected to be exported
  # in the Qt5WebKit.dll shared library. As static libraries normally don't care
  # about exported symbols (everything is exported after all) the decoration
  # attribute Q_DECL_EXPORT won't be set.
  # This results in undefined references when trying to link the QtWebKitWidgets
  # shared library (which depends on various symbols which aren't exported properly
  # in the Qt5WebKit.dll shared library)
  patch -p0 -b -i ../qt5-qtwebkit-workaround-build-breakage-after-svn-commit-136242.patch

  # Smaller debuginfo s/-g/-g1/ (debian uses -gstabs) to avoid 4gb size limit
  patch -p1 -b -i ../qtwebkit-opensource-src-5.0.1-debuginfo.patch

  # Revert commit 151422 to fix a build failure which happens because we're not using ICU
  patch -p1 -R -b -i ../webkit-commit-151422.patch

  # Fix compatibility issue when using the latest ANGLE
  patch -p1 -b -i ../qt5-qtwebkit-fix-compatibility-with-latest-angle.patch

  # Make sure the bundled copy of the ANGLE libraries isn't used
  rm -rf Source/ThirdParty/ANGLE
}

build() {
  unset PKG_CONFIG_PATH
  cd "${srcdir}/${_pkgfqn}"
  for _arch in ${_architectures}; do
    # Generate headers
    # seems like this has been fixed
    #${_arch}-syncqt.pl-qt5 ./Source -version ${pkgver}

    mkdir -p build-${_arch} && pushd build-${_arch}

    # Since Source/ThirdParty/ANGLE has been removed ensure files
    # from system ANGLE can be included (patches from Fedora don't help
    # here because Fedora uses other paths)
    export CPATH="$CPATH:/usr/$_arch/include:/usr/$_arch/include/GLSLANG"

    # SH_GLSL_OUTPUT has been renamed to SH_GLSL_COMPATIBILITY_OUTPUT
    # in the latest ANGLE version so I just add a definition for backward compatibility
    ${_arch}-qmake-qt5 \
      QMAKE_CXXFLAGS+=-Wno-c++0x-compat \
      DEFINES+=SH_GLSL_OUTPUT=SH_GLSL_COMPATIBILITY_OUTPUT \
      ../WebKit.pro
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgfqn}/build-${_arch}"
    make INSTALL_ROOT="${pkgdir}" install

    # The .dll's are installed in both bindir and libdir
    # One copy of the .dll's is sufficient
    rm -f "${pkgdir}/usr/${_arch}/lib/"*.dll
    find "${pkgdir}/usr/${_arch}" -name "*.exe" -o -name "*.bat" -o -name "*.def" -o -name "*.exp" -o -name '*.prl' | xargs -rtl1 rm
    find "${pkgdir}/usr/${_arch}" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}" -name "*.a" -o -name "*.dll" | xargs -rtl1 ${_arch}-strip -g
  done
}
