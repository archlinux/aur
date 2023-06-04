# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>

pkgname=gpt4all-chat-git
_gitname=gpt4all
pkgver=r914.9f590db
pkgrel=1
pkgdesc="Cross platform Qt based GUI for GPT4All versions"
arch=('x86_64')
url="https://github.com/nomic-ai/gpt4all"
license=('MIT')
makedepends=('cmake' 'git')
depends=(
  'qt6-base' 'qt6-httpserver' 'qt6-quickcontrols2' 'qt6-svg'
  'qt6-webengine' 'qt6-shadertools' 'qt6-5compat'
)
conflicts=('gpt4all-chat')
provides=('gpt4all-chat')
source=(
  "${_gitname}::git+https://github.com/nomic-ai/gpt4all.git"
  "gpt4all-chat.desktop"
)
sha256sums=(
  'SKIP'
  '8861ce995b79e95363e86a261d7a9d3c4c7da6de1b63f40ee5b2ecd02dcd6693'
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
  cp -av bin/* ${pkgdir}/opt/gpt4all-chat/bin/

	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

	cp "${srcdir}/gpt4all-chat.desktop" "${pkgdir}/usr/share/applications/"
	cp ../icons/logo.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gpt4all-chat.svg"
}
