# Maintainer: guglovich <guglovich164@gmail.com>
# Created with assistance from Gemini 3.1 Pro.
pkgname=yandex-music-downloader-gui
pkgver=1.1.1
pkgrel=6
pkgdesc="Простой и красивый загрузчик музыки из Яндекс.Музыки"
arch=('any')
url="https://github.com/atyonekilla/yandex-music-downloader-gui"
license=('MIT')
depends=('python' 'python-mutagen' 'python-pycryptodome' 'python-pillow' 'python-customtkinter' 'python-imageio-ffmpeg' 'python-requests' 'python-aiohttp' 'python-aiofiles' 'python-typing_extensions')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("git+$url.git#tag=v$pkgver"
        "$pkgname.desktop"
        "yandex-music-api.zip::https://github.com/llistochek/yandex-music-api/archive/9623fbca7704f47766614efe51d66c9fd496714c.zip")
sha256sums=('SKIP'
            '1be1896f5e31ddc49c5d586d50666fa003ae750f8cd17e9504305fb2f6a493e5'
            '44c897892a8a6463246b5dc18c340ddb0f25a312b12b1727820de8387235c857')

prepare() {
  cd "$pkgname"
  # Remove setuptools-git requirement to simplify dependencies
  sed -i '/"setuptools-git"/d' pyproject.toml
  
  # Remove strenum dependency from pyproject.toml
  sed -i '/"StrEnum"/d' pyproject.toml
  
  # Patch out strenum dependency in code
  sed -i 's/from strenum import StrEnum/from enum import StrEnum/g' ymd/api.py
  sed -i 's/from strenum import LowercaseStrEnum/from enum import StrEnum/g' ymd/core.py
  # Add LowercaseStrEnum implementation to core.py
  sed -i '/from enum import StrEnum/a \
\
class LowercaseStrEnum(StrEnum):\
    def _generate_next_value_(name, start, count, last_values):\
        return name.lower()' ymd/core.py

  # Vendor specific yandex-music-api revision
  rm -rf yandex_music_ymd
  cp -r "../yandex-music-api-9623fbca7704f47766614efe51d66c9fd496714c/yandex_music" yandex_music_ymd
  
  # Patch imports in the main project to use the vendored version
  find ymd -name "*.py" -exec sed -i 's/yandex_music/yandex_music_ymd/g' {} +
  
  # Patch internal imports in the vendored library itself
  find yandex_music_ymd -name "*.py" -exec sed -i 's/yandex_music/yandex_music_ymd/g' {} +
  
  # Ensure the vendored package is included in the build
  sed -i 's/packages = \["ymd"\]/packages = ["ymd", "yandex_music_ymd"]/' pyproject.toml
}

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
