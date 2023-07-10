# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=gpt4all-chat-git
_gitname=gpt4all
pkgver=r1150.c8d761a
pkgrel=1
pkgdesc="Cross platform Qt based GUI for GPT4All versions"
arch=('x86_64')
url="https://github.com/nomic-ai/gpt4all"
license=('MIT')
makedepends=('cmake' 'git')
depends=(
  'qt6-base' 'qt6-httpserver' 'qt6-quickcontrols2' 'qt6-svg'
  'qt6-webengine' 'qt6-shadertools' 'qt6-5compat' 'qt6-wayland'
)
conflicts=('gpt4all-chat')
provides=('gpt4all-chat')
source=(
  "${_gitname}::git+https://github.com/nomic-ai/gpt4all.git"
  "gpt4all-chat.desktop"
  "gpt4all-chat.sh"
)
sha256sums=(
  'SKIP'
  '16cd7d32166c493b1028c3e5c6a8437d3d81315c92076f5a94240e509a93a271'
  'c8b8b5ab8b0badd9f74210fb26181b9fef48741e14256e3494cbbc46c8f98d9f'
)


pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"
  git submodule update --init --recursive
  mkdir -p gpt4all-chat/build
  sed -i '/CMAKE_INSTALL_PREFIX/d' gpt4all-chat/CMakeLists.txt
}

build() {
  cd "${srcdir}/${_gitname}/gpt4all-chat/build"
  cmake -DCMAKE_INSTALL_PREFIX=/opt/gpt4all-chat -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "${srcdir}/${_gitname}/gpt4all-chat/build"

  DESTDIR="${pkgdir}" make install

  mv "${pkgdir}/opt/gpt4all-chat/bin/chat" "${pkgdir}/opt/gpt4all-chat/bin/gpt4all-chat"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

  cp "${srcdir}/gpt4all-chat.sh" "${pkgdir}/usr/bin/gpt4all-chat"
  chmod 0755 "${pkgdir}/usr/bin/gpt4all-chat"

  cp "${srcdir}/gpt4all-chat.desktop" "${pkgdir}/usr/share/applications/"
  cp ../icons/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gpt4all-chat.svg"
}
