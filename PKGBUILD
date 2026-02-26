# Maintainer: Forest Ames <fox dot ames at smallfox dot io>
_pkgname="multiworld-gg"
pkgname="${_pkgname}-git"
pkgver=r9672
pkgrel=1
pkgdesc="MultiworldGG Multi-Game Randomizer and Server - Fork of Archipelago"
arch=('any')
url="https://github.com/MultiworldGG/MultiworldGG"
license=('GPL-3.0')
provides=('multiworld-gg')
conflicts=('multiworld-gg')
depends=('python')
makedepends=('uv')
checkdepends=('uv')
_author="FoxAmes"
_branch="feat/xdg-terminal-exec"
source=("${_pkgname}::git+https://github.com/${_author}/MultiworldGG.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  git rev-list --count HEAD | sed 's/\([0-9][0-9]*\)/r\1/'
}

build() {
  cd "$srcdir/${_pkgname}"
  uv venv --allow-existing --python 3.13
  . .venv/bin/activate
  uv pip install --quiet -r requirements.txt
  cat <<EOF >"requirements-override.txt" # Works around build errors related to dated gclib deps
pyfastyaz0yay0 @ git+https://github.com/LagoLunatic/PyFastYaz0Yay0.git@00e19626ab17621416d4b9055b17f0ea3fea66f3
EOF
  ls worlds/*/requirements.txt | xargs -l uv pip install --quiet --overrides=requirements-override.txt -r
  uv pip install --quiet pip cx-Freeze==8.4.0 # Used directly by the setup script
  python setup.py build_exe -b build/MultiworldGG
}

check() {
  cd "$srcdir/${_pkgname}"
  uv venv --allow-existing --python 3.13
  . .venv/bin/activate
  uv pip install --quiet -r requirements.txt
  uv pip install pytest
  uv pip install flask flask_caching pony # Needed for several tests

  cat <<EOF >"conftest.py"
import sys

collect_ignore = [
    "rlds/dk64/randomizer/CollectibleLogicFiles/TestBananaTotals.py",
    "worlds/minecraft/test/TestAdvancements.py",
    "worlds/minecraft/test/TestDataLoad.py",
    "worlds/minecraft/test/TestEntrances.py",
    "worlds/minecraft/test/TestOptions.py",
    "worlds/poe/test/test_generation.py",
    "worlds/smo/TestClient.py",
    "worlds/toontown/test/TestFishing.py",
    "worlds/toontown/test/TestTreasures.py",
    "worlds/tp/tests/test_shuffle_options.py",
    "worlds/tp/tests/test_tests.py"
]
EOF
  
  pytest -s
}

package() {
  install -d "$pkgdir/opt"
  cp -r "$srcdir/${_pkgname}/build/MultiworldGG" "$pkgdir/opt/"
  mkdir -p "$pkgdir/usr/share/applications"
  cat <<EOF >"$pkgdir/usr/share/applications/MultiworldGG.desktop"
[Desktop Entry]
Version=1.0
Exec=/opt/MultiworldGG/MultiworldGGLauncher
Path=/opt/MultiworldGG/
Name=MultiworldGG
Type=Application
Icon=/opt/MultiworldGG/icon.png
Categories=Game;
Keywords=multi-game;randomizer;
EOF
}
