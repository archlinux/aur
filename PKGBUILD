# Maintainer: Emilia <your-email@example.com>
pkgname=skyscraper-simulator-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="3D skyscraper and elevator simulator (SourceForge build with OpenEXR 3.1 compat)"
arch=('x86_64')
url="http://www.skyscrapersim.com/"
license=('GPL')
# Убедись, что freeimage уже стоит (paru -S freeimage)
depends=('jxrlib' 'freeimage' 'openal' 'libxaw' 'libpng12')
makedepends=('cmake' 'gcc' 'curl')
source=("skyscraper-${pkgver}.tar.bz2::https://sourceforge.net/projects/skyscraper/files/v2.0.3/skyscraper-2.0.3-linux-x64.tar.bz2/download"
        "https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.1.3.tar.gz"
        "https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.1.5.tar.gz")
sha256sums=('1527b2b876ae4ac18b2bc76aac59d9c15e0787be8db020db61b8d24c95bd018a'
            '0bf7ec51162c4d17a4c5b850fb3f6f7a195cff9fa71f4da7735f74d7b5124320'
            '93925805c1fc4f8162b35f0ae109c4a75344e6decae5a240afdfce25f8a433ec')

build() {
  # 1. Собираем Imath 3.1
  cd "${srcdir}/Imath-3.1.3"
  cmake -B build -DCMAKE_INSTALL_PREFIX="${srcdir}/compat_layer" -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j$(nproc)
  cmake --install build

  # 2. Собираем OpenEXR 3.1 (тот самый хак)
  cd "${srcdir}/openexr-3.1.5"
  cmake -B build \
    -DCMAKE_INSTALL_PREFIX="${srcdir}/compat_layer" \
    -DCMAKE_PREFIX_PATH="${srcdir}/compat_layer" \
    -DImath_DIR="${srcdir}/compat_layer/lib/cmake/Imath" \
    -DCMAKE_CXX_FLAGS="-include cstdint" \
    -DOPENEXR_BUILD_BINARIES=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build -j$(nproc)
  cmake --install build
}

package() {
  mkdir -p "${pkgdir}/opt/skyscraper"

  cd "${srcdir}/skyscraper"
  cp -r * "${pkgdir}/opt/skyscraper/"

  # Накатываем наши совместимые либы
  cp "${srcdir}/compat_layer/lib/"libImath-3_1.so.29 "${pkgdir}/opt/skyscraper/lib/"
  cp "${srcdir}/compat_layer/lib/"libOpenEXR-3_1.so.30 "${pkgdir}/opt/skyscraper/lib/"
  cp "${srcdir}/compat_layer/lib/"libIex-3_1.so.30 "${pkgdir}/opt/skyscraper/lib/"
  cp "${srcdir}/compat_layer/lib/"libIlmThread-3_1.so.30 "${pkgdir}/opt/skyscraper/lib/"

  # Создаём умный скрипт запуска
  mkdir -p "${pkgdir}/usr/bin"
  cat <<EOF > "${pkgdir}/usr/bin/skyscraper"
#!/bin/sh
# Создаём рабочую папку в домашнем каталоге
SKYSCRAPER_USER_DIR="\$HOME/.skyscraper"
mkdir -p "\$SKYSCRAPER_USER_DIR"

# Переходим туда
cd "\$SKYSCRAPER_USER_DIR"

# Создаём ссылки на данные игры, если их ещё нет
# Нам нужны ссылки на bin, data и либы
[ ! -L bin ] && ln -s /opt/skyscraper/bin bin
[ ! -L data ] && ln -s /opt/skyscraper/data data
[ ! -L lib ] && ln -s /opt/skyscraper/lib lib

# Запускаем
export LD_LIBRARY_PATH=/opt/skyscraper/lib
./bin/skyscraper
EOF

  chmod +x "${pkgdir}/usr/bin/skyscraper"

# Создаём ярлык для меню приложений
  mkdir -p "${pkgdir}/usr/share/applications"
  cat <<EOF > "${pkgdir}/usr/share/applications/skyscraper.desktop"
[Desktop Entry]
Name=Skyscraper Simulator
Comment=3D Skyscraper and Elevator Simulator
Exec=skyscraper
Icon=/opt/skyscraper/data/icon.png
Terminal=false
Type=Application
Categories=Game;Simulation;
EOF
}
