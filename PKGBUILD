# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=pegsofur
pkgver=0.1.5
pkgrel=1
_gdext_ver=0.17.1
pkgdesc="Ancient city-states dice and wooden pegboard strategy game for 1-4 Human/AI players"
arch=('x86_64' 'aarch64')
url="https://github.com/chrisfair/pegsofur"
license=('MIT' 'CC0-1.0')
depends=(
  'godot>=4.6'
  'glibc'
  'hicolor-icon-theme'
)
makedepends=(
  'nim>=2.2.0'
  'git'
  'python'
)
provides=('pegsofur')
conflicts=('pegsofur')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/chrisfair/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
  "gdext-nim-${_gdext_ver}.tar.gz::https://github.com/godot-nim/gdext-nim/archive/refs/tags/v${_gdext_ver}.tar.gz"
)
sha256sums=(
  '6cf81e82292b28b2d024462a4905f3ef29c45360c9515a9029342dbfad7d990f'
  'e446f3d682e49c609552bee599d21de01ebc86b47889559ab267655b3e887f2d'
)

prepare() {
  local _nimble_dir="${srcdir}/${pkgname}-${pkgver}/.nimble"
  local _fake_home="${srcdir}/home"
  mkdir -p "${_fake_home}"

  # Apply Nim 2.4+ compatibility fixes to gdext-nim v0.17.1 before local install
  python3 "${srcdir}/${pkgname}-${pkgver}/packaging/patch_gdext_nim24.py" "${srcdir}/gdext-nim-${_gdext_ver}"

  cd "${srcdir}/gdext-nim-${_gdext_ver}"
  if [ ! -d .git ]; then
    git init -q
    git -c user.name="makepkg" -c user.email="makepkg@localhost" add -A
    git -c user.name="makepkg" -c user.email="makepkg@localhost" commit -q -m "source"
  fi
  HOME="${_fake_home}" NIMBLE_DIR="${_nimble_dir}" nimble install -y
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  local _nimble_dir="${PWD}/.nimble"
  local _fake_home="${srcdir}/home"
  mkdir -p .godot "${_fake_home}/.cache" "${_fake_home}/.local/share" "${_fake_home}/.config"
  printf "res://nim/PegsOfUr.gdextension\n" > .godot/extension_list.cfg

  (
    cd nim
    HOME="${_fake_home}" NIMBLE_DIR="${_nimble_dir}" \
      nim c -d:release -d:target=debug --nimcache:"${srcdir}/nimcache_ext_dbg" bootstrap.nim
    HOME="${_fake_home}" NIMBLE_DIR="${_nimble_dir}" \
      nim c -d:release -d:target=release --nimcache:"${srcdir}/nimcache_ext_rel" bootstrap.nim
  )

  # Pre-import Godot textures, audio streams, and UID cache so /usr/share/pegsofur runs read-only
  HOME="${_fake_home}" godot --headless --path . --import
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  local _nimble_dir="${PWD}/.nimble"
  local _fake_home="${srcdir}/home"
  HOME="${_fake_home}" NIMBLE_DIR="${_nimble_dir}" \
    nim c -r \
      --path:nim/src \
      --nimCache:"${srcdir}/nimcache_check" \
      -o:"${srcdir}/test_runner" \
      tests/test_all.nim
  HOME="${_fake_home}" godot --headless --path . --quit-after 5
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "packaging/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "packaging/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -dm755 "${pkgdir}/usr/share/${pkgname}/nim/lib"
  cp -a project.godot icon.svg icon.svg.import assets scenes .godot "${pkgdir}/usr/share/${pkgname}/"
  install -Dm644 "nim/PegsOfUr.gdextension" "${pkgdir}/usr/share/${pkgname}/nim/PegsOfUr.gdextension"
  if [ -f "nim/PegsOfUr.gdextension.uid" ]; then
    install -Dm644 "nim/PegsOfUr.gdextension.uid" "${pkgdir}/usr/share/${pkgname}/nim/PegsOfUr.gdextension.uid"
  fi
  install -Dm755 nim/lib/libPegsOfUr.linux.*.so "${pkgdir}/usr/share/${pkgname}/nim/lib/"
}
