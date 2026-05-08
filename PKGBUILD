# Maintainer: Gasoile <gasoile at gmail dot com>

pkgname=openstudioapplication
pkgver=1.11.0
pkgrel=1
pkgdesc='Graphical application for the OpenStudio energy modeling SDK'
arch=('x86_64')
url='https://github.com/openstudiocoalition/OpenStudioApplication'
license=('LicenseRef-OpenStudio')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'openstudio-bin=3.11.0'
  'qt6-5compat'
  'qt6-base'
  'qt6-charts'
  'qt6-declarative'
  'qt6-positioning'
  'qt6-svg'
  'qt6-webengine'
)
makedepends=(
  'chrpath'
  'cmake'
  'conan'
  'git'
  'ninja'
  'patchelf'
  'qt6-tools'
  'qt6-translations'
)
options=('!lto')
_measures_commit='da6832b3eec8e3ecccaadd39142e7c3d9c2da10f'
source=(
  "OpenStudioApplication-${pkgver}.tar.gz::https://github.com/openstudiocoalition/OpenStudioApplication/archive/refs/tags/v${pkgver}.tar.gz"
  "git+https://github.com/openstudiocoalition/openstudio-coalition-measures.git#commit=${_measures_commit}"
  'arch-build-fixes.patch'
)
sha256sums=(
  '3c2923991723ebe32e173ee940b6f4e33f7ef180dd5f8491a42cd07b2e168441'
  'SKIP'
  'e64edca8c2cf762212c36e41f86ecfffcdf206be2a020178b9899a69f664d5e8'
)

prepare() {
  cd "OpenStudioApplication-${pkgver}"
  patch -Np1 -i "${srcdir}/arch-build-fixes.patch"
}

build() {
  cd "OpenStudioApplication-${pkgver}"

  export CONAN_HOME="${srcdir}/.conan2"
  CFLAGS+=" -ffile-prefix-map=${srcdir}=."
  CXXFLAGS+=" -ffile-prefix-map=${srcdir}=."
  conan profile detect --force
  conan remote add nrel-v2 'http://conan.openstudio.net/artifactory/api/conan/conan-v2' --force
  conan install "${PWD}" \
    --output-folder="${srcdir}/build" \
    --build=never \
    -c tools.cmake.cmaketoolchain:generator=Ninja \
    -s:h compiler.version=13 \
    -s:b compiler.version=13 \
    -s:h compiler.cppstd=20 \
    -s:b compiler.cppstd=20 \
    -s:h build_type=Release \
    -s:b build_type=Release \
    -o '&:with_testing=False' \
    -o '&:with_benchmark=False'

  source "${srcdir}/build/conanbuild.sh"

  local qt_version qt_data qt_libexec qt_plugins qt_translations
  qt_version="$(qmake6 -query QT_VERSION)"
  qt_data="$(qmake6 -query QT_INSTALL_DATA)"
  qt_libexec="$(qmake6 -query QT_INSTALL_LIBEXECS)"
  qt_plugins="$(qmake6 -query QT_INSTALL_PLUGINS)"
  qt_translations="$(qmake6 -query QT_INSTALL_TRANSLATIONS)"

  cmake -S "${PWD}" -B "${srcdir}/build" -G Ninja \
    -DCMAKE_TOOLCHAIN_FILE="${srcdir}/build/conan_toolchain.cmake" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr/lib/${pkgname}" \
    -Dopenstudio_DIR=/opt/openstudio/lib/cmake/openstudio \
    -DQT_INSTALL_DIR=/usr \
    -DQT_VERSION="${qt_version}" \
    -DQtWebEngineProcess="${qt_libexec}/QtWebEngineProcess" \
    -Dicudtl="${qt_data}/resources/v8_context_snapshot.bin" \
    -Dqweb_resources="${qt_data}/resources/qtwebengine_resources.pak" \
    -Dqweb_resources_devtools="${qt_data}/resources/qtwebengine_devtools_resources.pak" \
    -Dqweb_resources_100="${qt_data}/resources/qtwebengine_resources_100p.pak" \
    -Dqweb_resources_200="${qt_data}/resources/qtwebengine_resources_200p.pak" \
    -DQT_QXCB="${qt_plugins}/platforms/libqxcb.so" \
    -DQT_QXCB_GLX="${qt_plugins}/xcbglintegrations/libqxcb-glx-integration.so" \
    -DQT_TRANSLATIONS_DIR="${qt_translations}" \
    -DOPENSTUDIOAPPLICATION_SKIP_FIXUP_BUNDLE=ON \
    -DOPENSTUDIOAPPLICATION_CONFIGURED_SOURCE_DIR="/usr/src/debug/${pkgname}/OpenStudioApplication-${pkgver}" \
    -DOPENSTUDIOAPPLICATION_CONFIGURED_BUILD_DIR="/usr/src/debug/${pkgname}/build" \
    -DOPENSTUDIOAPPLICATION_CONFIGURED_MEASURES_SOURCE_DIR="/usr/src/debug/${pkgname}/openstudio-coalition-measures" \
    -DOPENSTUDIO_COALITION_MEASURES_SOURCE_DIR="${srcdir}/openstudio-coalition-measures"

  cmake --build "${srcdir}/build"
}

package() {
  cd "OpenStudioApplication-${pkgver}"

  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  local appdir="${pkgdir}/usr/lib/${pkgname}"
  patchelf --set-rpath '$ORIGIN:$ORIGIN/../lib' "${appdir}/bin/OpenStudioApp-${pkgver}"
  if [[ -f "${appdir}/Ruby/openstudio_modeleditor.so" ]]; then
    patchelf --set-rpath '$ORIGIN:$ORIGIN/../lib' "${appdir}/Ruby/openstudio_modeleditor.so"
  fi

  rm -rf "${appdir}/Temp"

  rm -rf "${appdir}/EnergyPlus" "${appdir}/Examples" "${appdir}/Python" "${appdir}/Radiance" "${appdir}/lib"
  ln -s /opt/openstudio/EnergyPlus "${appdir}/EnergyPlus"
  ln -s /opt/openstudio/Examples "${appdir}/Examples"
  ln -s /opt/openstudio/Python "${appdir}/Python"
  ln -s /opt/openstudio/Radiance "${appdir}/Radiance"
  ln -s /opt/openstudio/lib "${appdir}/lib"

  rm -rf \
    "${appdir}/Ruby/Gemfile" \
    "${appdir}/Ruby/Gemfile.lock" \
    "${appdir}/Ruby/openstudio" \
    "${appdir}/Ruby/openstudio-gems.gemspec" \
    "${appdir}/Ruby/openstudio.rb" \
    "${appdir}/Ruby/openstudio.so"
  ln -s /opt/openstudio/Ruby/Gemfile "${appdir}/Ruby/Gemfile"
  ln -s /opt/openstudio/Ruby/Gemfile.lock "${appdir}/Ruby/Gemfile.lock"
  ln -s /opt/openstudio/Ruby/openstudio "${appdir}/Ruby/openstudio"
  ln -s /opt/openstudio/Ruby/openstudio-gems.gemspec "${appdir}/Ruby/openstudio-gems.gemspec"
  ln -s /opt/openstudio/Ruby/openstudio.rb "${appdir}/Ruby/openstudio.rb"
  ln -s /opt/openstudio/Ruby/openstudio.so "${appdir}/Ruby/openstudio.so"

  local qt_data qt_libexec qt_plugins qt_translations
  qt_data="$(qmake6 -query QT_INSTALL_DATA)"
  qt_libexec="$(qmake6 -query QT_INSTALL_LIBEXECS)"
  qt_plugins="$(qmake6 -query QT_INSTALL_PLUGINS)"
  qt_translations="$(qmake6 -query QT_INSTALL_TRANSLATIONS)"

  rm -f "${appdir}/bin"/libQt6*.so* "${appdir}/bin"/libicu*.so*
  rm -rf "${appdir}/bin/platforms" "${appdir}/bin/resources" "${appdir}/bin/translations" "${appdir}/bin/xcbglintegrations"
  ln -s "${qt_plugins}/platforms" "${appdir}/bin/platforms"
  ln -s "${qt_data}/resources" "${appdir}/bin/resources"
  ln -s "${qt_translations}" "${appdir}/bin/translations"
  ln -s "${qt_plugins}/xcbglintegrations" "${appdir}/bin/xcbglintegrations"

  rm -f "${appdir}/bin/QtWebEngineProcess" "${appdir}/bin/install_utility" "${appdir}/bin/openstudio"
  ln -s "${qt_libexec}/QtWebEngineProcess" "${appdir}/bin/QtWebEngineProcess"
  ln -s /opt/openstudio/bin/install_utility "${appdir}/bin/install_utility"
  ln -s /opt/openstudio/bin/openstudio "${appdir}/bin/openstudio"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/bin/OpenStudioApp" "${pkgdir}/usr/bin/OpenStudioApp"
  ln -s "/usr/lib/${pkgname}/bin/OpenStudioApp" "${pkgdir}/usr/bin/openstudioapplication"

  install -Dm644 debian/openstudioapp.desktop "${pkgdir}/usr/share/applications/openstudioapplication.desktop"
  sed -i \
    -e 's|^Exec=.*|Exec=/usr/bin/openstudioapplication %u|' \
    -e 's|^Icon=.*|Icon=openstudioapp|' \
    "${pkgdir}/usr/share/applications/openstudioapplication.desktop"

  install -Dm644 debian/x-openstudio.xml "${pkgdir}/usr/share/mime/packages/x-openstudio.xml"
  install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md"

  local size
  for size in 16 32 48 64 128 256 512 1024; do
    install -Dm644 "icons/os_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/openstudioapp.png"
  done

  for size in 16 32 48 64 128 256; do
    install -Dm644 "icons/osm_${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/mimetypes/application-x-openstudio.png"
  done
}
